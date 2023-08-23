//
//  StoreBenefitsView.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 16.08.2023.
//

import SwiftUI

struct StoreBenefitsView: View {
    @ObservedObject var viewModel = StoreBenefitsViewModel()
    
    private enum StoreBenefitsConstants {
        static let imageWidth: CGFloat = 120 * 0.83
        static let imageHeight: CGFloat = 120
        static let cornerRadius: CGFloat = 10
        static let shadowColor: Color = Color.gray.opacity(0.1)
        static let shadowRadius: CGFloat = 2
        static let shadowX: CGFloat = 4
        static let shadowY: CGFloat = 4
        static let imagePadding: CGFloat = 5
        static let horizontalSpacing: CGFloat = 2
        static let horizontalPadding: CGFloat = 10
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: StoreBenefitsConstants.horizontalSpacing) {
                ForEach(viewModel.storeBenefitsImage) { benefit in
                    Image(benefit.imageStoreBenefits)
                        .resizable()
                        .cornerRadius(StoreBenefitsConstants.cornerRadius)
                        .clipped()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: StoreBenefitsConstants.imageWidth, height: StoreBenefitsConstants.imageHeight)
                        .shadow(color: StoreBenefitsConstants.shadowColor, radius: StoreBenefitsConstants.shadowRadius, x: StoreBenefitsConstants.shadowX, y: StoreBenefitsConstants.shadowY)
                        .padding(StoreBenefitsConstants.imagePadding)
                        .onTapGesture {
                            viewModel.handleTapOnImageBenefit(benefit: benefit)
                        }
                }
            }
            .padding(.horizontal, StoreBenefitsConstants.horizontalPadding)
        }
    }
}

struct StoreBenefitsView_Previews: PreviewProvider {
    static var previews: some View {
        StoreBenefitsView()
    }
}
