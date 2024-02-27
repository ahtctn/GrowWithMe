//
//  StoryDataViewModel.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 27.02.2024.
//

import Foundation
import AVFAudio

class StoryDataViewModel: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    @Published var playbackState: PlaybackState = .stopped

    
    // Dosyayı çal
    func playAudio(fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("Dosya bulunamadı.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("AudioPlayer oluşturulamadı: \(error)")
        }
    }
    
    // Çalma işlemini durdur
    func stopAudio() {
        audioPlayer?.stop()
    }
    
    // Belirli bir süreye ileri sarma
    func forward(seconds: TimeInterval) {
        guard let player = audioPlayer else { return }
        let currentTime = player.currentTime
        let newTime = currentTime + seconds
        if newTime < player.duration {
            player.currentTime = newTime
        } else {
            player.currentTime = player.duration
        }
    }
    
    // Belirli bir süreye geri sarma
    func backward(seconds: TimeInterval) {
        guard let player = audioPlayer else { return }
        let currentTime = player.currentTime
        let newTime = currentTime - seconds
        if newTime > 0 {
            player.currentTime = newTime
        } else {
            player.currentTime = 0
        }
    }
    func togglePlayPause() {
        if playbackState == .playing {
            audioPlayer?.pause()
            playbackState = .paused
        } else {
            audioPlayer?.play()
            playbackState = .playing
        }
    }
}

enum PlaybackState {
    case playing
    case paused
    case stopped
}
