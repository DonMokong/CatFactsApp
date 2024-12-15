//
//  CatViewModel.swift
//  CatFactsApp
//
//  Created by DonMokong on 12/15/24.
//

import Foundation

class CatViewModel: ObservableObject {
    @Published var catFact: String = "Tap to fetch a cat fact!"
    @Published var catImageURL: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let service = CatService.shared
    
    func fetchCatData() {
        isLoading = true
        errorMessage = nil
        
        let group = DispatchGroup()
        
        group.enter()
        service.fetchCatFact { [weak self] result in
            switch result {
            case .success(let fact):
                self?.catFact = fact
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
            group.leave()
        }
        
        group.enter()
        service.fetchCatImage { [weak self] result in
            switch result {
            case .success(let imageURL):
                self?.catImageURL = imageURL
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
            group.leave()
        }
        
        group.notify(queue: .main) {
            self.isLoading = false
        }
    }
}
