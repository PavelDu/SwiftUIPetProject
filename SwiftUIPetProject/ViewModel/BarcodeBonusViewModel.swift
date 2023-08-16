//
//  BarcodeBonusViewModel.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 16.08.2023.
//

import SwiftUI

class  BarcodeBonusViewModel: ObservableObject {
    @Published var  barcodeBonus: [BonusBarcodeModel] = DataBonusBarcode.dataBonusBarcode
    
    func handleImageTap() {
        print("Тап по картинке с бонусами")
    }
}
