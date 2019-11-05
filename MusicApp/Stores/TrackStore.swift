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
    
    
    @Published var currentState: [TrackObject]
    @Published var reducer: TrackReducer
    
    var state: [TrackObject]{ currentState }
    
    init(initState: [TrackObject]) {
        currentState = initState
        reducer = TrackReducer()
    }
    
    func dispatch(){
        reducer.getTracks({
            let newState = $0
            self.currentState = newState
        }, {
            print($0)
        })
    }
    
}
