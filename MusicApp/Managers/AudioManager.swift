//
//  AudioManager.swift
//  MusicApp
//
//  Created by Jorge Acosta on 30-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//


import Foundation
import AVFoundation
import Combine
import Alamofire

final class AudioManager : ObservableObject {
    
    var player: AVAudioPlayer? = nil
    var request: DataRequest? = nil
    
    @Published var selectedItem : TrackObject? = nil {
        didSet{
            stopSound()
            self.dispatch(url: self.selectedItem!.previewUrl)
        }
    }
        

    @Published var isLoading: Bool = false
    
    @Published var progress = 0.0

    
    func playSound(data: Data){
        
        self.stopSound()
        
        do{
            self.player = try AVAudioPlayer(data: data )
            self.player?.prepareToPlay()
            self.player?.volume = 1.0
            self.player?.play()
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }catch _{
            
        }
    }
    
    @objc func updateTime(timer : Timer){
        self.progress = Double(self.player!.currentTime)
    }
    
    func stopSound(){
        if player != nil {
           self.player?.stop()
        }
    }
    
    func dispatch(url: String){
        
      if(request != nil){
          request?.cancel()
          self.request = nil
          return
      }
        

      
      self.request = Alamofire
            .request(url)
            .responseData(completionHandler: { response in
                self.request = nil
                self.playSound(data: response.result.value!)
            })
     
  }
    
    
    
}
