//
//  MainTabView.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 20.08.2023.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 18) {
                    StoryCollectionContentView()
                    PromoCollectionViewContent()
                    BonusBarcodeView()
                    StoreBenefitsView()
                    ProductsView()
                }
                .toolbar {
                    NavigationBarContentView()
                }
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
