//
//  BonusBarcodeView.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 16.08.2023.
//

import SwiftUI

fileprivate enum UIConstants {
    static let bgImageCornerRadius: CGFloat = 20
    static let bgImageShadowRadius: CGFloat = 3
    static let bgImageShadowopacity: CGFloat = 0.5
    static let frameViewWidth: CGFloat = UIScreen.main.bounds.width - 30
    static let frameViewHeight: CGFloat = frameViewWidth * 0.3
    static let imageSize: CGFloat = UIScreen.main.bounds.width * 0.2
    static let bonusCountFontSizeLarge: CGFloat = 30
    static let bonusCountFontSizeSmall: CGFloat = 15
    static let leadingPaddingOfBonusCount: CGFloat = 20
    static let topPaddingPaddingOfBonusCount: CGFloat = 15
    static let trailingPaddingOfbarcodeImage: CGFloat = 25
}

struct BonusBarcodeView: View {
    
    @ObservedObject var viewModel = BarcodeBonusViewModel()
    
    var body: some View {
        ZStack {
            backgroundView
            HStack {
                bonusCountView
                Spacer()
                barcodeImageView
            }
            .frame(
                width: UIConstants.frameViewWidth,
                height: UIConstants.frameViewHeight
            )
        }
        .onTapGesture {
            viewModel.handleImageTap()
        }
    }
    
    private var backgroundView: some View {
        Image("bonusImage")
            .resizable()
            .scaledToFit()
            .cornerRadius(UIConstants.bgImageCornerRadius)
            .clipped()
            .frame(
                width: UIScreen.main.bounds.width - 32.0,
                height: UIConstants.frameViewHeight
            )
            .shadow(color: Color.gray.opacity(UIConstants.bgImageShadowopacity), radius: UIConstants.bgImageShadowRadius)
    }
    
    private var bonusCountView: some View {
        let bonusCountText = Text("\(Int(viewModel.barcodeBonus.first?.imageBarcode.countOfBonus ?? 0))")
            .font(.system(size: UIConstants.bonusCountFontSizeLarge, weight: .bold))
        
        let bonusSuffix = Text(" бонусов")
            .font(.system(size: UIConstants.bonusCountFontSizeSmall))
            .bold()
        
        return (bonusCountText + bonusSuffix)
            .alignmentGuide(.top) { d in d[.top] }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top, UIConstants.topPaddingPaddingOfBonusCount)
            .padding(.leading, UIConstants.leadingPaddingOfBonusCount)
    }
    
    private var barcodeImageView: some View {
        Image(viewModel.barcodeBonus.first?.imageBarcode.imageBarcodeOfUser ?? "")
            .resizable()
            .scaledToFit()
            .frame(width: UIConstants.imageSize, height: UIConstants.imageSize)
            .padding(.trailing, UIConstants.trailingPaddingOfbarcodeImage)
    }
}

struct BonusBarcodeView_Previews: PreviewProvider {
    static var previews: some View {
        BonusBarcodeView()
    }
}
