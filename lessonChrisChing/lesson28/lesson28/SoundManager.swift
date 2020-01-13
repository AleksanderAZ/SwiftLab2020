//
//  SoundManager.swift
//  lesson28
//
//  Created by Z on 12/26/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static var audioPlayer: AVAudioPlayer?
    enum SoundEffect {
        case flip
        case shuffle
        case match
        case nomatch
    }
    
    static func play(_ effect: SoundEffect) {
        var soundFileName = ""
        
        switch effect {
            case .flip:
                    soundFileName = "cardflip"
            case .shuffle:
                    soundFileName = "shuffle"
            case .match:
                    soundFileName = "dingcorrect"
            case .nomatch:
                    soundFileName = "dingwrong"
        }
        
        guard let bundelPath = Bundle.main.path(forResource: soundFileName, ofType: "wav") else { return }
        
        let soundURL = URL(fileURLWithPath: bundelPath)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        }
        catch {
            print("ERROR")
        }
    }
}
