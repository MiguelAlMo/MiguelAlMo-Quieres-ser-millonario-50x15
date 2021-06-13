//
//  SoundExtensions.swift
//  _50 x 15_
//
//  Created by Miguel Alarcon on 11/6/21.
//
import UIKit
import AVFoundation

var audioPlayer = AVAudioPlayer()

func soundHome(titleSong: String) {
    do {
        audioPlayer = try
            AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: titleSong, ofType: "mp3")!))
        audioPlayer.numberOfLoops = -1
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    } catch {
        print(error)
    }
}

