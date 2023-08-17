//
//  MokData.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 14.08.2023.
//

import Foundation

//MARK: - Data for stories
struct StoryData {
    static let stories: [StoryModel] = [
        StoryModel(textStory: "Привилегии «Мой SPAR»", imageStory: "storyImage1", isViewed: false),
        StoryModel(textStory: "Конкурсы в соцсетях?", imageStory: "storyImage2", isViewed: false),
        StoryModel(textStory: "Мега скидки?", imageStory: "storyImage3", isViewed: false),
        StoryModel(textStory: "Городецкая роспись", imageStory: "storyImage4", isViewed: false),
        StoryModel(textStory: "Скидки 50%", imageStory: "storyImage5", isViewed: false),
        StoryModel(textStory: "Новинки недели", imageStory: "storyImage6", isViewed: false),
        StoryModel(textStory: "Рецепт недели", imageStory: "storyImage7", isViewed: false),
    ]
}

//MARK: - Images of promoCollectionView
struct DataPromoCollection {
    static let imagePromoCollection: [PromoModel] = [
        PromoModel(imagePromo: "promo1"),
        PromoModel(imagePromo: "promo2"),
        PromoModel(imagePromo: "promo3"),
        PromoModel(imagePromo: "promo4"),
        PromoModel(imagePromo: "promo5"),
        PromoModel(imagePromo: "promo6"),
        PromoModel(imagePromo: "promo7")
    ]
}

//MARK: - Images of promoCollectionView
struct DataBonusBarcode {
    static let dataBonusBarcode: [BonusBarcodeModel] = [
        BonusBarcodeModel(imageBarcode: DataBonus(imageBarcodeOfUser: "barcodeOfBonus", countOfBonus: 777))
    ]
}

//MARK: - Images of StoreBenefits
struct DataStoreBenefits {
    static let imageStoreBenefits: [StoreBenefitsModel] = [
        StoreBenefitsModel(imageStoreBenefits: "storeBenefits1"),
        StoreBenefitsModel(imageStoreBenefits: "storeBenefits2"),
        StoreBenefitsModel(imageStoreBenefits: "storeBenefits3"),
        StoreBenefitsModel(imageStoreBenefits: "storeBenefits4"),
        StoreBenefitsModel(imageStoreBenefits: "storeBenefits5"),
        StoreBenefitsModel(imageStoreBenefits: "storeBenefits6"),
        StoreBenefitsModel(imageStoreBenefits: "storeBenefits7"),
        StoreBenefitsModel(imageStoreBenefits: "storeBenefits8"),
        StoreBenefitsModel(imageStoreBenefits: "storeBenefits9")
    ]
}

//MARK: - Images of ProductsView
struct DataProducts {
    static let recommendProducts: [ProductModel] = [
        ProductModel(imageNameProduct: "recommend1", price: 399.99, priceUnit: "rubPi", discount: 0.2, labelOnImageProduct: "Цена по карте"),
        ProductModel(imageNameProduct: "recommend2", price: 100.49, priceUnit: "rubPi",  discount: 0.3, labelOnImageProduct: "Удар по ценам"),
        ProductModel(imageNameProduct: "recommend3", price: 75, priceUnit: "rubPi",  discount: nil, labelOnImageProduct: "Супер цена"),
        ProductModel(imageNameProduct: "recommend4", price: 70.49, priceUnit: "rubPi",  discount: 0.1, labelOnImageProduct: "Супер цена"),
        ProductModel(imageNameProduct: "recommend5", price: 300, priceUnit: "rubPi",  discount: nil, labelOnImageProduct: nil),
        ProductModel(imageNameProduct: "recommend6", price: 459.99, priceUnit: "rubPi",  discount: 0.3, labelOnImageProduct: "Удар по ценам"),
        ProductModel(imageNameProduct: "recommend7", price: 78.49, priceUnit: "rubGr",  discount: 0.2, labelOnImageProduct: "Цена по карте"),
        ProductModel(imageNameProduct: "recommend8", price: 100, priceUnit: "rubGr",  discount: nil, labelOnImageProduct: nil)
        ]
    static let sweetMoodProducts: [ProductModel] = [
        ProductModel(imageNameProduct: "sweetMood1", price: 239.90, priceUnit: "rubPi", discount: nil, labelOnImageProduct: "Новинка"),
        ProductModel(imageNameProduct: "sweetMood2", price: 99.90, priceUnit: "rubPi",  discount: nil, labelOnImageProduct: "Новинка"),
        ProductModel(imageNameProduct: "sweetMood3", price: 399.90, priceUnit: "rubPi",  discount: nil, labelOnImageProduct: nil),
        ProductModel(imageNameProduct: "sweetMood4", price: 90.90, priceUnit: "rubPi",  discount: nil, labelOnImageProduct: "Новинка"),
        ProductModel(imageNameProduct: "sweetMood5", price: 300, priceUnit: "rubPi",  discount: nil, labelOnImageProduct: nil),
        ProductModel(imageNameProduct: "sweetMood6", price: 99.99, priceUnit: "rubPi",  discount: nil, labelOnImageProduct: nil),
        ProductModel(imageNameProduct: "sweetMood7", price: 319.90, priceUnit: "rubPi",  discount: nil, labelOnImageProduct: "Новинка"),
        ProductModel(imageNameProduct: "sweetMood8", price: 79.49, priceUnit: "rubPi",  discount: nil, labelOnImageProduct: "Новинка"),
        ProductModel(imageNameProduct: "sweetMood9", price: 79.49, priceUnit: "rubPi",  discount: nil, labelOnImageProduct: nil)
    ]
}

