//
//  Tabs.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 18.08.2023.
//

enum Tab: Int, CaseIterable, Identifiable {
    case first = 1
    case second
    case third
    case fourth
    
    var id: Int { rawValue }
    
    var iconName: String {
        switch self {
        case .first: return "house.fill"
        case .second: return "book.fill"
        case .third: return "cart.fill"
        case .fourth: return "person.fill"
        }
    }
    
    var title: String {
        switch self {
        case .first: return "Главная"
        case .second: return "Каталог"
        case .third: return "Корзина"
        case .fourth: return "Профиль"
        }
    }
}
