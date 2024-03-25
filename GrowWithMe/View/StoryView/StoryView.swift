//
//  StoryView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 30.01.2024.
//

import SwiftUI
import AVFoundation

struct StoryView: View {
    @EnvironmentObject var storyDataVM: StoryDataViewModel
    @State private var isBackwardTapped: Bool = false
    @State private var isForwardTapped: Bool = false
    
    @State private var progress: Double = 0.0
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScreenBackgroundView()
                VStack(spacing: 10) {
                    StoryImageView(imageName: "gece")
                    VStack(alignment: .leading, spacing: 8) {
                        Text("story_1".localized())
                            .font(.title)
                            .bold()
                        
                        Text("story_of_the_day".localized())
                    }
                    
                    ZStack {
                        CircularProgressView(circleWidth: 130, circleHeight: 130, progress: $progress)
                        ButtonActionView(
                            backwardAction: {
                                print("backwardbuttontapped")
                                storyDataVM.backward(seconds: 10)
                                isBackwardTapped = true
                            }, forwardAction: {
                                print("forwardbuttontapped")
                                storyDataVM.forward(seconds: 10)
                            }, playAction: {
                                if storyDataVM.playbackState == .stopped {
                                    storyDataVM.playAudio(fileName: "story")
                                } else if storyDataVM.playbackState == .paused && storyDataVM.playbackState == .playing {
                                    storyDataVM.togglePlayPause()
                                }
                            }, isBackwardTapped: $isBackwardTapped, isForwardTapped: $isForwardTapped)
                    }
                    
                }
            }
            
            .navigationTitle("story".localized())
            
            
            
            .onReceive(storyDataVM.timer) { _ in
                if storyDataVM.audioDuration > 0 {
                    progress = min(1.0, max(0.0, storyDataVM.currentPlaybackTime / storyDataVM.audioDuration))
                } else {
                    progress = 0.0
                }
            }
            
        }
        
    }
}

#Preview {
    StoryView()
}








