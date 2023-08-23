//
//  ContentView.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 13.08.2023.
//

import SwiftUI

struct ContentView: View {
    private enum UIConstants {
        static let tabBarDividerHeight: CGFloat = 2
        static let tabBarTopPadding: CGFloat = 8
    }
    
    @State private var selectedTab: Tab = .main
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
                MainTabView()
                    .tag(Tab.main)
                
                CatalogTabView()
                    .tag(Tab.catalog)
                
                CartTabView()
                    .tag(Tab.cart)
                
                ProfileTabView()
                    .tag(Tab.profile)
            }
            ZStack(alignment: .top) {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.size.width, height: UIConstants.tabBarDividerHeight)
                    .foregroundColor(.white)
                    .opacity(0.2)
                    .shadow(color: .gray, radius: 1, x: 0, y: -2)
                HStack {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        TabBarItem(tab: tab, selected: $selectedTab)
                    }
                }
                .padding(.top, UIConstants.tabBarTopPadding)
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
