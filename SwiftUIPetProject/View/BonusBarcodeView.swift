//
//  BonusBarcodeView.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 16.08.2023.
//

import SwiftUI

fileprivate enum Constants {
    static let bgImageCornerRadius: CGFloat = 20
    static let bgImageShadowRadius: CGFloat = 5
    static let frameViewWidth: CGFloat = UIScreen.main.bounds.width * 0.9
    static let frameViewHeight: CGFloat = UIScreen.main.bounds.width * 0.3
    static let imageSize: CGFloat = UIScreen.main.bounds.width * 0.2
    static let bonusCountFontSizeLarge: CGFloat = 30
    static let bonusCountFontSizeSmall: CGFloat = 15
    static let leadingPaddingOfBonusCount: CGFloat = 20
    static let topPaddingPaddingOfBonusCount: CGFloat = 15
    static let trailingPaddingOfbarcodeImage: CGFloat = 23
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
                width: Constants.frameViewWidth,
                height: Constants.frameViewHeight
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
            .cornerRadius(Constants.bgImageCornerRadius)
            .clipped()
            .frame(
                width: Constants.frameViewWidth,
                height: Constants.frameViewHeight
            )
            .shadow(radius: Constants.bgImageShadowRadius)
    }
    
    private var bonusCountView: some View {
        let bonusCountText = Text("\(Int(viewModel.barcodeBonus.first?.imageBarcode.countOfBonus ?? 0))")
            .font(.system(size: Constants.bonusCountFontSizeLarge, weight: .bold))
        
        let bonusSuffix = Text(" бонусов")
            .font(.system(size: Constants.bonusCountFontSizeSmall))
        
        return (bonusCountText + bonusSuffix)
            .alignmentGuide(.top) { d in d[.top] }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top, Constants.topPaddingPaddingOfBonusCount)
            .padding(.leading, Constants.leadingPaddingOfBonusCount)
    }
    
    private var barcodeImageView: some View {
        Image(viewModel.barcodeBonus.first?.imageBarcode.imageBarcodeOfUser ?? "")
            .resizable()
            .scaledToFit()
            .frame(width: Constants.imageSize, height: Constants.imageSize)
            .padding(.trailing, Constants.trailingPaddingOfbarcodeImage)
    }
}

struct BonusBarcodeView_Previews: PreviewProvider {
    static var previews: some View {
        BonusBarcodeView()
    }
}
