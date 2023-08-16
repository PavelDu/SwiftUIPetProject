//
//  PromoViewModel.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 14.08.2023.
//

import SwiftUI

// ViewModel для карусели
class PromolViewModel: ObservableObject {
    @Published var promoImages: [PromoModel] = []
    
    init() {
        for image in imagePromoCollection {
            let promoImage = PromoModel(imagePromo: image)
            promoImages.append(promoImage)
        }
    }
    
    func tappedImageIndex(for promoImage: PromoModel) -> Int {
        return promoImages.firstIndex(where: { $0.id == promoImage.id }) ?? -1
    }
}

