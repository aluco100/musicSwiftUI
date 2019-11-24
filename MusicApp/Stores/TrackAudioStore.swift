//
//  TrackAudioStore.swift
//  MusicApp
//
//  Created by Alfredo Luco on 24-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class TrackAudioStore: ObservableObject {
    
    
    @Published var audioData: Data
    @Published var reducer: SoundReducer
    
    
    init() {
        audioData = Data()
        reducer = SoundReducer()
    }
    
    func dispatch(url: String){
        reducer.playSound(url: url)
    }
    
}
