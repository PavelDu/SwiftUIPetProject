//
//  NavigationBar.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 14.08.2023.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack(spacing: 0) {
            buttonSearchOfCity
            menuButton
        }
       // Divider()
         //   .padding(8)
    }
    
    var buttonSearchOfCity: some View {
        
        Button(action: {
            print("Тап по кнопке - список городов")
        }){
            HStack(spacing: 0) {
                Image(systemName: "mappin.and.ellipse") .font(.system(size: 15))
                    .foregroundColor(.red)
                    .padding(.leading, 8)
                    
                Text("Москва, Москва и Московская область")
                    .padding(8)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .foregroundColor(.primary)
            }.frame(width: UIScreen.main.bounds.size.width - 70, alignment: .leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(0)
        }
    }
    
    var menuButton: some View {
        Button(action: {
            print("Тап по кнопке - меню справа")
        }){
            Image(systemName: "line.horizontal.3")
                .font(.system(size: 24))
                .foregroundColor(.green)
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
