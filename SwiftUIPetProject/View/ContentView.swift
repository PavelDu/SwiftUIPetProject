//
//  ContentView.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 13.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    //    init() {
    //        UITabBar.appearance().backgroundColor = .gray
    //    }
    @State private var selectedView = 1
    
    var body: some View {
        
        TabView(selection: $selectedView) {
            //  Вкладка 1
            NavigationView {
                ScrollView {
                    VStack {
                        StoryCollectionContentView()
                        Spacer()
                        PromoCollectionViewContent()
                            .padding(.bottom, 15)
                        BonusBarcodeView()
                    }
                }
             .toolbar {
                 NavigationBarContentView()
                }
            }
            
            .tabItem {
                Image(systemName: "1.circle")
                Text("Вкладка 1")
            } .tag(1)
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            // Вкладка 2
            NavigationView {
                VStack {
                    Text("Содержимое второй вкладки")
                }
                .navigationBarTitle("Вкладка 2", displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "2.circle")
                Text("Вкладка 2")
            }
            
            // Вкладка 3
            NavigationView {
                VStack {
                    Text("Содержимое третьей вкладки")
                }
                .navigationBarTitle("Вкладка 3", displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "3.circle")
                Text("Вкладка 3")
            }
            
            // Вкладка 4
            NavigationView {
                VStack {
                    Text("Содержимое третьей вкладки")
                }
                .navigationBarTitle("Вкладка 4", displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "4.circle")
                Text("Вкладка 4")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
