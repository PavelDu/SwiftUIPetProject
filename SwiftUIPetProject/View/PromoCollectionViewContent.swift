//
//  SwiftUIView.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 15.08.2023.
//

import SwiftUI

struct PromoCollectionViewContent: View {
    private enum Constants {
        static let countRepeatCollectionImage = 6
        static let horizontalPadding: CGFloat = 8
    }
    
    @ObservedObject var viewModel = PromolViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { scrollViewProxy in
                HStack(spacing: Constants.horizontalPadding) {
                    ForEach(0..<viewModel.promoImages.count * Constants.countRepeatCollectionImage) { index in
                        let adjustedIndex = index % viewModel.promoImages.count
                        PromoCollectionViewCell(viewModel: viewModel, imagePromo: viewModel.promoImages[adjustedIndex])
                            .id(index)
                    }
                }
                .padding(.horizontal, Constants.horizontalPadding)
                .onAppear {
                    let middleIndex = (viewModel.promoImages.count * Constants.countRepeatCollectionImage) / 2
                    scrollViewProxy.scrollTo(middleIndex, anchor: .center)
                }
            }
        }
    }
}

struct PromoCollectionViewCell: View {
    @ObservedObject var viewModel: PromolViewModel
    let imagePromo: PromoModel
    
    private enum Constants {
        static let imageWidth: CGFloat = UIScreen.main.bounds.width * 4/5
        static let imageHeight: CGFloat = UIScreen.main.bounds.width * 2/5
        static let cornerRadius: CGFloat = 20
    }
    
    var body: some View {
        Image(imagePromo.imagePromo)
            .resizable()
            .scaledToFill()
            .frame(width: Constants.imageWidth, height: Constants.imageHeight)
            .cornerRadius(Constants.cornerRadius)
            .clipped()
            .onTapGesture {
                let tappedIndex = viewModel.tappedImageIndex(for: imagePromo)
                print("Тап по индексу \(tappedIndex)")
            }
    }
}

struct PromoCollectionViewContent_Previews: PreviewProvider {
    static var previews: some View {
        PromoCollectionViewContent()
    }
}
