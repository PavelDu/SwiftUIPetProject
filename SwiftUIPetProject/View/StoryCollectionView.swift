//
//  StoryCollectionView.swift
//  SwiftUIPetProject
//
//  Created by Павел Дю on 14.08.2023.
//

import SwiftUI

struct StoryCollectionContentView: View {
    private enum Constants {
        static let horizontalSpacing: CGFloat = 25
        static let padding: CGFloat = 20
    }
    
    @ObservedObject var viewModel = StoriesViewModel()
    
    var body: some View  {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: Constants.horizontalSpacing) {
                ForEach(viewModel.stories) { storyItem in
                    StoryViewCell(viewModel: viewModel, story: storyItem)
                }
            }
            .padding(Constants.padding)
        }
    }
}

struct StoryViewCell: View {
    @ObservedObject var viewModel: StoriesViewModel
    let story: StoryModel
    
    private enum UIConstants {
        static let horizontalPadding: CGFloat = 10
        static let verticalPadding: CGFloat = 6
        static let circleSize: CGFloat = 70
        static let imageFrameSize: CGFloat = 60
        static let textFrameSize: CGSize = CGSize(width: 80, height: 30)
        static let borderWidth: CGFloat = 3
        static let fontSize: CGFloat = 12
    }
    
    var body: some View {
        VStack(spacing: UIConstants.verticalPadding) {
            ZStack {
                Circle()
                    .frame(width: UIConstants.circleSize, height: UIConstants.circleSize)
                    .foregroundColor(.clear)
                    .overlay(Circle().stroke(Color.green, lineWidth: UIConstants.borderWidth))
                Image(story.imageStory)
                    .resizable()
                    .frame(width: UIConstants.imageFrameSize, height: UIConstants.imageFrameSize)
                    .clipShape(Circle())
                    .padding(.horizontal, UIConstants.horizontalPadding)
            }
            Text(story.textStory)
                .frame(width: UIConstants.textFrameSize.width, height: UIConstants.textFrameSize.height)
                .font(.system(size: UIConstants.fontSize))
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
        .onTapGesture {
            viewModel.markStoryAsViewed(story: story)
        }
    }
}

struct StoryCollectionContentView_Previews: PreviewProvider {
    static var previews: some View {
        StoryCollectionContentView()
    }
}
