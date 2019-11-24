//
//  SoundReducer.swift
//  MusicApp
//
//  Created by Alfredo Luco on 24-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//

import Foundation
import AVFoundation
import Alamofire

struct SoundReducer{
        
    func playSound(url: String){
        let soundManager = SoundManager()
        soundManager.playSound(url: url)
    }
    
}

class SoundManager {
    
    var player: AVAudioPlayer? = nil
    
    func playSound(url: String){
        Alamofire.request(url).responseData(completionHandler: {
            response in
            do{
                self.player = try AVAudioPlayer(data: response.result.value ?? Data())
                self.player?.prepareToPlay()
                self.player?.volume = 1.0
                self.player?.play()
            }catch let error{
                print(error)
            }
        })
    }
    
}
