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
        static let horizontalPadding: CGFloat = 2
    }
    
    @ObservedObject var viewModel = PromolViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { scrollViewProxy in
                HStack {
                    ForEach(0..<viewModel.promoImages.count * Constants.countRepeatCollectionImage) { index in
                        let adjustedIndex = index % viewModel.promoImages.count
                        PromoCollectionViewCell(viewModel: viewModel, imagePromo: viewModel.promoImages[adjustedIndex])
                            .id(index) // Используем обычный индекс для идентификации элемента
                            .padding(.horizontal, Constants.horizontalPadding)
                    }
                }
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
    
    var body: some View {
        ZStack {
            Image(imagePromo.imagePromo)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width * 4/5, height: UIScreen.main.bounds.width * 2/5)
                .cornerRadius(20)
                .clipped()
        }
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
