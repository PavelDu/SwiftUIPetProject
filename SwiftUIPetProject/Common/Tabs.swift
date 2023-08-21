//
//  Tabs.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 18.08.2023.
//

enum Tab: Int, CaseIterable, Identifiable {
    case main 
    case catalog
    case cart
    case profile
    
    var id: Int { rawValue }
    
    var iconImageName: String {
        switch self {
        case .main: return "spar"
        case .catalog: return "catalog"
        case .cart: return "cart"
        case .profile: return "profile"
        }
    }
    
    var iconImageNameIsActive: String {
        switch self {
        case .main: return "sparActive"
        case .catalog: return "catalogActive"
        case .cart: return "cartActive"
        case .profile: return "profileActive"
        }
    }
    
    var title: String {
        switch self {
        case .main: return "Главная"
        case .catalog: return "Каталог"
        case .cart: return "Корзина"
        case .profile: return "Профиль"
        }
    }
}
