//
//  StoryModel.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 14.08.2023.
//

import SwiftUI

struct StoryModel: Identifiable {
    
    let id = UUID()
    let textStory: String
    let imageStory: String
    var isViewed: Bool = false
    
}
