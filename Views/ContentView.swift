//
//  ContentView.swift
//  CatFactsApp
//
//  Created by System Administrator on 12/15/24.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @StateObject private var viewModel = CatViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            } else {
                if let url = URL(string: viewModel.catImageURL) {
                    KFImage(url)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                }
                
                Text(viewModel.catFact)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
        .onTapGesture {
            viewModel.fetchCatData()
        }
        .onAppear {
            viewModel.fetchCatData()
        }
        .padding()
    }
}
