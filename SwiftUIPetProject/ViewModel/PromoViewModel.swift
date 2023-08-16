//
//  PromoViewModel.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 14.08.2023.
//

import SwiftUI

class PromolViewModel: ObservableObject {
    @Published var promoImages: [PromoModel] = DataPromoCollection.imagePromoCollection
    
    func tappedImageIndex(for promoImage: PromoModel) -> Int {
        return promoImages.firstIndex(where: { $0.id == promoImage.id }) ?? -1
    }
}
