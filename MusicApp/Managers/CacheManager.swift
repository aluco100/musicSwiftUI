//
//  CacheManager.swift
//  MusicApp
//
//  Created by Alfredo Luco on 03-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CacheManager {
    
    //MARK: - Singleton
    static let shared: CacheManager = CacheManager()
    private init(){}
    
    public func createTrack(trackObject: TrackObject){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{ return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        guard let trackEntity = NSEntityDescription.entity(forEntityName: "Track", in: managedContext) else{ return }
        
        let track = NSManagedObject(entity: trackEntity, insertInto: managedContext)
        
        track.setValue(trackObject.artistId, forKey: "artistId")
        track.setValue(trackObject.artistName, forKey: "artistName")
        track.setValue(trackObject.artistViewUrl, forKey: "artistViewUrl")
        track.setValue(trackObject.artworkUrl100, forKey: "artworkUrl30")
        track.setValue(trackObject.collectionCensoredName, forKey: "collectionCensoredName")
        track.setValue(trackObject.collectionName, forKey: "collectionName")
        track.setValue(trackObject.trackCensoredName, forKey: "trackCensoredName")
        track.setValue(trackObject.id, forKey: "trackID")
        track.setValue(trackObject.trackName, forKey: "trackName")
        track.setValue(trackObject.trackViewUrl, forKey: "trackViewUrl")
        
        do {
            try managedContext.save()
        } catch let error {
            print(error)
        }
        
    }
    
}
