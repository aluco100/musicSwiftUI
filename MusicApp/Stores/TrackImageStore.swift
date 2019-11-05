//
//  TrackImageStore.swift
//  MusicApp
//
//  Created by Alfredo Luco on 04-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class TrackImageStore: ObservableObject {
    
    var didChange = PassthroughSubject<TrackImageStore,Never>()
    
    @Published var imageData: Data
    @Published var reducer: ImageReducer
    
    
    init() {
        imageData = Data()
        reducer = ImageReducer()
    }
    
    func dispatch(url: String){
        reducer.retrieveImageData(url: url, success: {
            self.imageData = $0
            self.didChange.send(self)
        }, failure: {
            print($0)
        })
    }
    
}
