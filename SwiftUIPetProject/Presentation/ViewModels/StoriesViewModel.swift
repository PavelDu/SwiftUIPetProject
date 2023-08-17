//
//  StoriesViewModel.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 14.08.2023.
//

import SwiftUI

class StoriesViewModel: ObservableObject {
    @Published var stories: [StoryModel] = StoryData.stories
    
    func markStoryAsViewed(story: StoryModel) {
        if let index = stories.firstIndex(where: { $0.id == story.id }) {
            stories[index].isViewed = true
            print("Тап по ячейке сторис \(index)")
        }
    }
}

