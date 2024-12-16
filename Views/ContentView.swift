//
//  CatService.swift
//  CatFactsApp
//
//  Created by DonMokong on 12/15/24.
//
import SwiftUI
import Kingfisher

struct ContentView: View {
    @StateObject private var viewModel = CatViewModel()

    var body: some View {
        NavigationView { // Wrap ContentView in NavigationView
            ZStack {
                // Background Image
                Image("cat_facts_background") // Add your background image to Assets.xcassets and name it "cat_facts_background".
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

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
                            .font(.custom("ChalkboardSE-Regular", size: 18)) // Use your preferred custom font
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(Color.white.opacity(0.7))
                            .cornerRadius(8)
                    }
                }
                .padding()


            }
            .onTapGesture {
                viewModel.fetchCatData()
            }
            .onAppear {
                viewModel.fetchCatData()
            }
        }
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
