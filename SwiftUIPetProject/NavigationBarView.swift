//
//  NavigationBar.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 14.08.2023.
//

import SwiftUI

struct NavigationBarContentView: View {
    
    private enum UIConstants {
        static let imageSize: CGFloat = 15
        static let imageLeadingPadding: CGFloat = 8
        static let textPadding: CGFloat = 8
        static let buttonWidth: CGFloat = UIScreen.main.bounds.size.width - 70
        static let cornerRadius: CGFloat = 20
        static let strokeWidth: CGFloat = 0.2
        static let buttonPadding: CGFloat = 0
        static let menuIconSize: CGFloat = 24
    }
    
    var body: some View {
        HStack(spacing: 0) {
            buttonSearchOfCity
            menuButton
        }
    }
    
    var buttonSearchOfCity: some View {
        
        Button(action: {
            print("Тап по кнопке - список городов")
        }){
            HStack(spacing: 0) {
                Image(systemName: "mappin.and.ellipse")
                    .font(.system(size: UIConstants.imageSize))
                    .foregroundColor(.red)
                    .padding(.leading, UIConstants.imageLeadingPadding)
                    
                Text("Москва, Москва и Московская область")
                    .padding(UIConstants.textPadding)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .foregroundColor(.primary)
            }
            .frame(width: UIConstants.buttonWidth, alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: UIConstants.cornerRadius)
                    .stroke(Color.gray, lineWidth: UIConstants.strokeWidth)
            )
            .padding(UIConstants.buttonPadding)
        }
    }
    
    var menuButton: some View {
        Button(action: {
            print("Тап по кнопке - меню справа")
        }){
            Image(systemName: "line.horizontal.3")
                .font(.system(size: UIConstants.menuIconSize))
                .foregroundColor(.green)
        }
    }
}

struct NavigationBarContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarContentView()
    }
}
