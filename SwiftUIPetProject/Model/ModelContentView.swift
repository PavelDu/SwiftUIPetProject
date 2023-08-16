//
//  StoryModel.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 14.08.2023.
//

import SwiftUI

//MARK: - Data for stories
struct StoryModel: Identifiable {
    let id = UUID()
    let textStory: String
    let imageStory: String
    var isViewed: Bool = false
}

//MARK: - Image of promoCollectionView
struct PromoModel: Identifiable {
    var id = UUID()
    let imagePromo: String
}
