//
//  TrackStore.swift
//  MusicApp
//
//  Created by Alfredo Luco on 03-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class TrackStore: ObservableObject {
    
    
    @Published var tracks: [TrackObject] = []
    var reducer = TrackReducer()
    
    func dispatch(){
        reducer.getTracks({
            self.tracks = $0
        }, {
            print($0)
        })
    }
    
}
