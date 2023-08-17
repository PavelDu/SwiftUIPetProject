//
//  StoreBenefitsViewModel.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 16.08.2023.
//

import SwiftUI

class StoreBenefitsViewModel: ObservableObject {
    @Published var storeBenefitsImage: [StoreBenefitsModel] = DataStoreBenefits.imageStoreBenefits
    
    func handleTapOnImageBenefit(benefit: StoreBenefitsModel) {
          if let index = storeBenefitsImage.firstIndex(where: { $0.id == benefit.id }) {
              print("Тап по \(index) ячейке преимущества")
          }
      }
}


