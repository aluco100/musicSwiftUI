//
//  TrackReducer.swift
//  MusicApp
//
//  Created by Alfredo Luco on 03-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

struct TrackReducer {
    
    func getTracks(_ success: @escaping (_ tracks: [TrackObject])->Void, _ failure: @escaping (_ error: Error)->Void){
        
        Alamofire.request("https://itunes.apple.com/search?term=jack+johnson", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            guard response.error == nil else{
                failure(response.error!)
                return
            }
            
            guard response.result.error == nil else{
                failure(response.result.error!)
                return
            }
            
            let result = response.result.value as? [String : Any] ?? [:]
            let resultArray = result["results"] as? [[String : Any]] ?? []
            let tracks = resultArray.map { (dict) -> TrackObject? in
                let mapper : Mapper<TrackObject> = Mapper<TrackObject>()
                let value = mapper.map(JSON: dict)
                if(value != nil){
                    CacheManager.shared.createTrack(trackObject: value!)
                }
                return value
            }
            let flatTracks = tracks.compactMap({ $0 })
            success(flatTracks)
        }
        
    }
    
}
