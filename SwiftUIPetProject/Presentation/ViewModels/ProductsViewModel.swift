//
//  ProductsViewModel.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 17.08.2023.
//

import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var recommendProducts: [ProductModel]
    @Published var sweetMoodProducts: [ProductModel]
    
    init() {
        self.recommendProducts = Self.makeMockProducts(defaultProducts: DataProducts.recommendProducts)
        self.sweetMoodProducts = Self.makeMockProducts(defaultProducts: DataProducts.sweetMoodProducts)
    }
    
    static func makeMockProducts(defaultProducts: [ProductModel]) -> [ProductModel] {
        var products = defaultProducts
        for _ in 0..<5 {
            products += defaultProducts
        }
        
        return products
    }
    
    func handleTapOnProduct(_ product: ProductModel) {
        if let index = recommendProducts.firstIndex(where: { $0.id == product.id }) {
            print("Тапнули по изображению в разделе 'Рекомендациях' по индексу \(index)")
        } else if let index = sweetMoodProducts.firstIndex(where: { $0.id == product.id }) {
            print("Тапнули по изображению в разделе 'Сладкое настроение' по индексу \(index)")
        }
    }
    func handleTapOnCart(_ product: ProductModel) {
        if let tappedProductIndex = recommendProducts.firstIndex(where: { $0.id == product.id }) {
            print("Тапнули по корзине для товара в разделе 'Рекомендациях' по индексу \(tappedProductIndex)")
        } else if let tappedProductIndex = sweetMoodProducts.firstIndex(where: { $0.id == product.id }) {
            print("Тапнули по корзине для товара в разделе 'Сладкое настроение' по индексу \(tappedProductIndex)")
        } else {
            print("Товар не найден")
        }
    }
    
    
    
    func backgroundColorForLabel(_ label: String?) -> Color {
        guard let label = label else {
            return Color.clear
        }
        
        switch label {
        case "Цена по карте":
            return Color.green
        case "Удар по ценам", "Супер цена":
            return Color.red
        case "Новинка":
            return Color.blue
        default:
            return Color.clear
        }
    }
    
    func formatPrice(_ price: Double, showDecimal: Bool = true) -> String {
        if price.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", price)
        } else {
            if showDecimal {
                return String(format: "%.2f", price)
            } else {
                return String(format: "%.2f", price)
            }
        }
    }
}
