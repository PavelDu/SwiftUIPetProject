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
