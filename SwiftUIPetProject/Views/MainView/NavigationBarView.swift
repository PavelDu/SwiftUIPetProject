//
//  NavigationBar.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 14.08.2023.
//

import SwiftUI

struct NavigationBarContentView: View {
    private enum UIConstants {

        static let textVerticalPadding: CGFloat = 10
        static let buttonSearchOfCityWidth: CGFloat = UIScreen.main.bounds.size.width - 70
        static let buttonSearchOfCityCornerRadius: CGFloat = 20
        static let strokeWidth: CGFloat = 0.2
        static let buttonSearchOfCityPadding: CGFloat = 0
        static let buttonSearchOfCityPaddingHeight: CGFloat = 40
        static let locationImageName = "location"
        static let imageSizeOfLocation: CGFloat = 20
        static let leadingPaddingOfImageLocation: CGFloat = 5
        static let menuImageName = "burger"
        static let menuIconSize: CGFloat = 24
    }
    
    private enum TextConstants {
        static let cityButtonText = "Санкт-Петербург, Санкт-Петербург и Ленинградская область"
        static let menuButtonTap = "Нажатие на кнопку - Меню справа"
        static let searchButtonTap = "Нажатие на кнопку - Список городов"
    }
    
    var body: some View {
        HStack(spacing: 0) {
            buttonSearchOfCity
            menuButton
        }
    }
    
    private var buttonSearchOfCity: some View {
        Button(action: {
            print(TextConstants.searchButtonTap)
        }) {
            HStack(spacing: 0) {
                Image(UIConstants.locationImageName)
                    .resizable()
                    .frame(width: UIConstants.imageSizeOfLocation, height: UIConstants.imageSizeOfLocation, alignment: .center)
                    .padding(UIConstants.leadingPaddingOfImageLocation)
                Text(TextConstants.cityButtonText)
                    .padding(.vertical, UIConstants.textVerticalPadding)
                    .lineLimit(1)
                    .foregroundColor(.primary)
                    .font(.system(size: 14))
            }
            .frame(width: UIConstants.buttonSearchOfCityWidth, height: UIConstants.buttonSearchOfCityPaddingHeight, alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: UIConstants.buttonSearchOfCityCornerRadius)
                    .stroke(Color.gray, lineWidth: UIConstants.strokeWidth)
            )
            .padding(UIConstants.buttonSearchOfCityPadding)
        }
    }
    
    private var menuButton: some View {
        Button(action: {
            print(TextConstants.menuButtonTap)
        }) {
            Image(UIConstants.menuImageName)
                .resizable()
                .frame(width: UIConstants.menuIconSize, height: UIConstants.menuIconSize, alignment: .center)
        }
    }
}

struct NavigationBarContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarContentView()
    }
}
