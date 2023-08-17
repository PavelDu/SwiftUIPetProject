//
//  StoryModel.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 14.08.2023.
//

import SwiftUI

//MARK: - Model for stories
struct StoryModel: Identifiable {
    let id = UUID()
    let textStory: String
    let imageStory: String
    var isViewed: Bool = false
}

//MARK: - Model for promoCollectionView
struct PromoModel: Identifiable {
    var id = UUID()
    let imagePromo: String
}

//MARK: - Model for BonusBarcodeView
struct BonusBarcodeModel: Identifiable {
    var id = UUID()
    let imageBarcode: DataBonus
}

struct DataBonus {
    let imageBarcodeOfUser: String
    let countOfBonus: Int
}

//MARK: - Model for StoreBenefits
struct StoreBenefitsModel : Identifiable {
    var id = UUID()
    let imageStoreBenefits : String
}

//MARK: - Model for ProductModel
struct ProductModel: Identifiable, Hashable {
    let id = UUID()
    let imageNameProduct: String
    let price: Double
    let priceUnit: String
    let discount: Double?
    let labelOnImageProduct: String?
    var discountedPrice: Double? {
        if let discount = discount {
            return price * (1 - discount)
        }
        return nil
    }
    var discountPercentage: Int? {
        if let discount = discount {
            return Int(discount * 100)
        }
        return nil
    }
}

