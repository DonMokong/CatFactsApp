//
//  CatService.swift
//  CatFactsApp
//
//  Created by DonMokong on 12/15/24.
//

import Foundation
import Alamofire

class CatService {
    static let shared = CatService()
    private let factURL = "https://meowfacts.herokuapp.com/"
    private let imageURL = "https://api.thecatapi.com/v1/images/search"
    

    func fetchCatFact(completion: @escaping (Result<String, Error>) -> Void) {
        AF.request(factURL).responseData { response in
            switch response.result {
            case .success(let data):

                debugPrint(String(data: data, encoding: .utf8) ?? "No data")
                
                do {
                    let catFact = try JSONDecoder().decode(CatFact.self, from: data)
                    if let fact = catFact.data.first {
                        completion(.success(fact))
                    } else {
                        completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No fact found"])))
                    }
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchCatImage(completion: @escaping (Result<String, Error>) -> Void) {
        AF.request(imageURL).responseData { response in
            switch response.result {
            case .success(let data):
                debugPrint(String(data: data, encoding: .utf8) ?? "No data")
                
                do {
                    let catImages = try JSONDecoder().decode([CatImage].self, from: data)
                    if let imageURL = catImages.first?.url {
                        completion(.success(imageURL))
                    } else {
                        completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No image found"])))
                    }
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
