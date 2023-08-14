//
//  StoryCollectionView.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 14.08.2023.
//

import SwiftUI

struct StoryCollectionView: View {
    
    @ObservedObject var viewModel = StoriesViewModel()
    
    var body: some View {
        stories
    }
    
    var stories: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
                ForEach(viewModel.stories) { storyItem in
                    StoryView(viewModel: viewModel, story: storyItem)
                }
            }
            .padding(20)
        }
    }
}
struct StoryView: View {
    @ObservedObject var viewModel: StoriesViewModel
    let story: StoryModel
    
    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                // Круглая маска для видимости изображения под кругом
                Circle()
                    .frame(width: 70, height: 70) // Увеличиваем размер маски
                    .foregroundColor(.clear) // Прозрачный цвет круга
                    .overlay(Circle().stroke(Color.green, lineWidth: 3)) // Обводка круга
                // Изображение сториса
                Image(story.imageStory)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle()) // Обрезаем изображение в форму круга
                    .padding(.horizontal, 10)
            }
                       Text(story.textStory)
                .frame(width: 80, height: 30)
                .font(.system(size: 12))
                           .lineLimit(2) // Перенос на две строки
                           .multilineTextAlignment(.center) // Выравнив
        }
        .onTapGesture {
            viewModel.markStoryAsViewed(story: story)
        }
    }
}

struct StoryCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        StoryCollectionView()
    }
}
