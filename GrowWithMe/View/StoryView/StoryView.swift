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
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("darkBlueColor"), Color("lightBlueColor")]), startPoint: .center, endPoint: .top)
                    .ignoresSafeArea(.all, edges: .top)
                
                VStack {
                    Spacer()
                    Spacer()
                    ButtonActionView(
                        backwardAction: {
                            print("backwardbuttontapped")
                            storyDataVM.backward(seconds: 10)
                        }, forwardAction: {
                            print("forwardbuttontapped")
                            storyDataVM.forward(seconds: 10)
                        }, playAction: {
                            if storyDataVM.playbackState == .stopped {
                                storyDataVM.playAudio(fileName: "story")
                            } else if storyDataVM.playbackState == .paused && storyDataVM.playbackState == .playing {
                                storyDataVM.togglePlayPause()
                            }
                        })
                    Spacer()
                    Image("gece")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 390)
                    //    .blendMode(.difference)
                        //.blendMode(.darken)
                        .blendMode(.plusLighter)
                        .ignoresSafeArea()
                    
                }
            }
            
            .navigationTitle("story".localized())
            .foregroundStyle(.red)
            .foregroundColor(.red)
            
        }
        
    }
}

#Preview {
    StoryView()
}

struct PlayButtonView: View {
    var symbolImage: String
    
    var circleWidth: Double
    var circleHeight: Double
    
    var innerCircleWidth: Double
    var innerCircleHeight: Double
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: circleWidth, height: circleHeight)
                .foregroundColor(Color.orange.opacity(0.5)) // Örneğin mavi bir daire
            
            Image(systemName: symbolImage) // Play simgesi
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: innerCircleWidth, height: innerCircleHeight)
                .foregroundColor(.orange) // Play simgesinin rengi
            
        }
    }
}

struct TimerButtonView: View {
    var imageStyle: String
    var body: some View {
        ZStack {
            Image(systemName: imageStyle)
            // Play simgesi
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .foregroundColor(.orange) // Play simgesinin rengi
            
            Circle()
                .foregroundStyle(.orange.opacity(0.5))
                .frame(width: 75, height: 75, alignment: .center)
        }
    }
}

struct ButtonActionView: View {
    @StateObject var storyDataVM = StoryDataViewModel()
    var backwardAction: () -> ()
    var forwardAction: () -> ()
    var playAction: () -> ()
    var body: some View {
        HStack {
            Button {
                print("-10 sec tapped")
                backwardAction()
            } label: {
                TimerButtonView(imageStyle: "arrow.counterclockwise.circle.fill")
            }
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
                    PlayButtonView(symbolImage: "pause.circle.fill", circleWidth: 150, circleHeight: 150, innerCircleWidth: 100, innerCircleHeight: 100)
                } else if storyDataVM.playbackState == .paused {
                    PlayButtonView(symbolImage: "play.circle.fill", circleWidth: 150, circleHeight: 150, innerCircleWidth: 100, innerCircleHeight: 100)
                } else if storyDataVM.playbackState == .stopped {
                    PlayButtonView(symbolImage: "play.circle.fill", circleWidth: 150, circleHeight: 150, innerCircleWidth: 100, innerCircleHeight: 100)
                }
            }
            Button {
                print("+10 sec tapped")
                forwardAction()
            } label: {
                TimerButtonView(imageStyle: "arrow.clockwise.circle.fill")
            }
        }
    }
}
