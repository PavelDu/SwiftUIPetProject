//
//  ContentView.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 13.08.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .first
    
    var body: some View {
        TabView(selection: $selectedTab) {
            tabView(for: .first)
                .tabItem {
                    Image(systemName:Tab.first.iconName)
                    Text(Tab.first.title)
                }
                .tag(Tab.first)
            
            tabView(for: .second)
                .tabItem {
                    Image(systemName: Tab.second.iconName)
                    Text(Tab.second.title)
                }
                .tag(Tab.second)
            
            tabView(for: .third)
                .tabItem {
                    Image(systemName: Tab.third.iconName)
                    Text(Tab.third.title)
                }
                .tag(Tab.third)
            
            tabView(for: .fourth)
                .tabItem {
                    Image(systemName: Tab.fourth.iconName)
                    Text(Tab.fourth.title)
                }
                .tag(Tab.fourth)
        }
        .accentColor(.green)
    }
    
    @ViewBuilder
    func tabView(for tab: Tab) -> some View {
        NavigationView {
            VStack {
                switch tab {
                case .first:
                    ScrollView {
                        LazyVStack(spacing: 18) {
                            StoryCollectionContentView()
                            PromoCollectionViewContent()
                            BonusBarcodeView()
                            StoreBenefitsView()
                            ProductsView()
                        }
                    }
                    .toolbar {
                        NavigationBarContentView()
                    }
                default:
                    Text("Содержимое \(tab.title)")
                        .navigationBarTitle(tab.title, displayMode: .inline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
