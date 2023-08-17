//
//  ProductsView.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 17.08.2023.
//

import SwiftUI

fileprivate enum SectionName: String, CaseIterable {
    case recommendations = "Рекомендуем"
    case sweetMood = "Сладкое настроение"
}

struct ProductsView: View {
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        VStack {
            ForEach(SectionName.allCases, id: \.self) { section in
                SectionView(title: section.rawValue,
                            products: getProducts(for: section))
                    .environmentObject(viewModel)
            }
        }
    }
    
    private func getProducts(for section: SectionName) -> [ProductModel] {
        switch section {
        case .recommendations:
            return viewModel.recommendProducts
        case .sweetMood:
            return viewModel.sweetMoodProducts
        }
    }
}

struct SectionView: View {
    private enum UIConstants {
        static let titleFontSize: CGFloat = 18
        static let horizontalPadding: CGFloat = 10
        static let spacing: CGFloat = 0
    }

    let title: String
     let products: [ProductModel]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: UIConstants.titleFontSize))
                .fontWeight(.semibold)
                .padding(.leading)

            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { scrollViewProxy in
                    HStack(spacing: UIConstants.spacing) {
                        ForEach(Array(zip(products.indices, products)), id: \.0) { index, product in
                            ProductView(product: product).id(index)
                        }
                    }
                    .padding(.horizontal, UIConstants.horizontalPadding)
                    .onAppear {
                        let middleIndex = products.count / 2
                        scrollViewProxy.scrollTo(middleIndex, anchor: .center)
                    }
                }
            }
        }
    }
}

struct ProductView: View {
    @EnvironmentObject var viewModel: ProductViewModel
    let product: ProductModel
    
    private enum UIConstants {
        static let cornerRadiusCell: CGFloat = 10
        static let shadowRadiusCell: CGFloat = 3
        static let imageSize: CGFloat = 130
        static let priceFontSize: CGFloat = 14
        static let priceLeadingPadding: CGFloat = 10
        static let priceTrailingPadding: CGFloat = -5
        static let discountedPriceFontSize: CGFloat = 12
        static let discountFontSize: CGFloat = 14
        static let textDiscountPadding: CGFloat = 7
        static let textDiscountCircleXOffset: CGFloat = 80
        static let textDiscountCircleYOffset: CGFloat = 108
        static let priceUnitSize: CGFloat = 20
        static let cartImageSize: CGFloat = 40
        static let cartImagePadding: CGFloat = 5
        static let labelOnImageProductFontSize: CGFloat = 10
        static let labelOnImageProductPadding: CGFloat = -5
        static let labelOnImageProductOpacity: Double = 0.8
        static let labelOnImageBackgroundCornerRadius: CGFloat = 10
        static let backgroundLableOnImageOpacity: Double = 0.3
        static let labelOnImageProductTopPadding: CGFloat = 2
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                Image(product.imageNameProduct)
                    .resizable()
                    .frame(width: UIConstants.imageSize, height: UIConstants.imageSize)
                
                HStack {
                    VStack(alignment: .leading) {
                        if let discountedPrice = product.discountedPrice {
                            Text(viewModel.formatPrice(discountedPrice))
                                .font(.system(size: UIConstants.priceFontSize))
                                .bold()
                            Text(viewModel.formatPrice(product.price, showDecimal: discountedPrice == product.price))
                                .font(.system(size: discountedPrice == product.price ? UIConstants.priceFontSize : UIConstants.discountedPriceFontSize))
                                .strikethrough()
                                .foregroundColor(.gray)
                                .bold()
                        } else {
                            Text(viewModel.formatPrice(product.price))
                                .font(.system(size: UIConstants.priceFontSize))
                                .bold()
                        }
                    }
                    .padding(.leading, UIConstants.priceLeadingPadding)
                    .padding(.trailing, UIConstants.priceTrailingPadding)

                    Image(product.priceUnit)
                        .resizable()
                        .frame(width: UIConstants.priceUnitSize, height: UIConstants.priceUnitSize)
                    
                    Spacer()
                    
                    Image("cartSpar")
                        .resizable()
                        .frame(width: UIConstants.cartImageSize, height: UIConstants.cartImageSize)
                        .cornerRadius(100)
                        .clipped()
                        .padding(UIConstants.cartImagePadding)
                        .onTapGesture {
                            viewModel.handleTapOnCart(product)
                        }
                }
            }
            
            if let label = product.labelOnImageProduct {
                let backgroundColor = viewModel.backgroundColorForLabel(label)
                Text("  \(label)")
                    .font(.system(size: UIConstants.labelOnImageProductFontSize))
                    .bold()
                    .foregroundColor(.white)
                    .background(
                        backgroundColor.opacity(UIConstants.labelOnImageProductOpacity)
                            .cornerRadius(UIConstants.labelOnImageBackgroundCornerRadius)
                            .padding(UIConstants.labelOnImageProductPadding)
                    )
                    .padding(.top, UIConstants.labelOnImageProductTopPadding)
            }
            
            if product.discount != nil {
                Text("\(product.discountPercentage ?? 0)%")
                    .font(.system(size: UIConstants.discountFontSize))
                    .bold()
                    .foregroundColor(.red)
                    .padding(UIConstants.textDiscountPadding)
                    .background(Color.white.opacity(UIConstants.backgroundLableOnImageOpacity))
                    .clipShape(Circle())
                    .offset(x: UIConstants.textDiscountCircleXOffset, y: UIConstants.textDiscountCircleYOffset)
            }
            
        }
        .cornerRadius(UIConstants.cornerRadiusCell)
        .background(
            RoundedRectangle(cornerRadius: UIConstants.cornerRadiusCell)
                .foregroundColor(Color.white)
                .shadow(color: .gray, radius: UIConstants.shadowRadiusCell, x: 3, y: 3)
                .opacity(UIConstants.backgroundLableOnImageOpacity))
        .padding(UIConstants.textDiscountPadding)
        .onTapGesture {
            viewModel.handleTapOnProduct(product)
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
