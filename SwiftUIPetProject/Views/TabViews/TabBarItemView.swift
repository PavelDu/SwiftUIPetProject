//
//  TabBarItemView.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 20.08.2023.
//

import SwiftUI

struct TabBarItem: View {
    private enum UIConstants {
        static let iconSize: CGFloat = 25
        static let textColor: Color = .black
        static let selectedTextColor: Color = .green
        static let textFontSize: CGFloat = 12
        static let spacing: CGFloat = 5
    }
    
    let tab: Tab
    @Binding var selected: Tab
    
    var body: some View {
        ZStack {
            
            VStack(spacing: UIConstants.spacing) {
                Button {
                    selected = tab
                } label: {
                    Spacer()
                    if selected != tab {
                        Image(tab.iconImageName)
                            .resizable()
                            .frame(width: UIConstants.iconSize, height: UIConstants.iconSize)
                    } else {
                        Image(tab.iconImageNameIsActive)
                            .resizable()
                            .frame(width: UIConstants.iconSize, height: UIConstants.iconSize)
                    }
                    Spacer()
                }
                
                if selected != tab {
                    Text(tab.title)
                        .foregroundColor(UIConstants.textColor)
                        .font(.system(size: UIConstants.textFontSize))
                } else {
                    Text(tab.title)
                        .foregroundColor(UIConstants.selectedTextColor)
                        .font(.system(size: UIConstants.textFontSize))
                }
            }
        }
    }
}
struct TabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItem(tab: .main, selected: .constant(.main))
    }
}

