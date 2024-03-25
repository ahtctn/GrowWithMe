//
//  ButtonActionView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 25.03.2024.
//

import SwiftUI

struct ButtonActionView: View {
    @StateObject var storyDataVM = StoryDataViewModel()
    var backwardAction: () -> ()
    var forwardAction: () -> ()
    var playAction: () -> ()
    @Binding var isBackwardTapped: Bool
    @Binding var isForwardTapped: Bool
    var body: some View {
        HStack(spacing: 32) {
            //MARK: BackwardView
            VStack {
                TimerForwardBackwardTextView(isBackwardORForwardTapped: $isBackwardTapped, textSecond: "-10")
                Button {
                    backwardAction()
                    isBackwardTapped = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
                        withAnimation(.easeInOut) {
                            isBackwardTapped = false
                            
                        }
                    }
                    
                } label: {
                    TimerButtonView(imageStyle: "arrow.counterclockwise.circle.fill")
                }
            }
            
            //MARK: PlayPauseView
            Button {
                if storyDataVM.playbackState == .playing || storyDataVM.playbackState == .paused {
                    storyDataVM.togglePlayPause()
                } else if storyDataVM.playbackState == .stopped {
                    storyDataVM.playbackState = .playing
                    playAction()
                    //storyDataVM.togglePlayPause()
                }
            } label: {
                if storyDataVM.playbackState == .playing {
                    PlayButtonView(symbolImage: "pause.circle.fill", circleWidth: 130, circleHeight: 130, innerCircleWidth: 100, innerCircleHeight: 100)
                } else if storyDataVM.playbackState == .paused {
                    PlayButtonView(symbolImage: "play.circle.fill", circleWidth: 130, circleHeight: 130, innerCircleWidth: 100, innerCircleHeight: 100)
                } else if storyDataVM.playbackState == .stopped {
                    PlayButtonView(symbolImage: "play.circle.fill", circleWidth: 130, circleHeight: 130, innerCircleWidth: 100, innerCircleHeight: 100)
                }
            }
            
            //MARK: ForwardView
            VStack {
                TimerForwardBackwardTextView(isBackwardORForwardTapped: $isForwardTapped, textSecond: "+10")
                Button {
                    forwardAction()
                    isForwardTapped = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
                        withAnimation(.easeInOut) {
                            isForwardTapped = false
                        }
                    }
                } label: {
                    TimerButtonView(imageStyle: "arrow.clockwise.circle.fill")
                }
            }
        }
    }
}

#Preview {
    ButtonActionView(backwardAction: {}, forwardAction: {}, playAction: {}, isBackwardTapped: .constant(true), isForwardTapped: .constant(true))
}
