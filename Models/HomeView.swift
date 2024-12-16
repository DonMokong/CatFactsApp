//
//  HomeView.swift
//  CatFactsApp
//
//  Created by DonMokong on 12/16/24.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("HomeBackground")  
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer()

                    Text("Welcome to Cat Facts!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .padding()

                    Spacer()

                    NavigationLink(destination: ContentView()) {
                        VStack {
                            Image(systemName: "pawprint.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                                .padding(.bottom, 10)

                            Text("Start")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue.opacity(0.8))
                        .clipShape(Capsule())
                        .shadow(radius: 5)
                    }
                    .padding()

                    Spacer()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
