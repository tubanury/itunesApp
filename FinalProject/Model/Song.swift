//
//  Song.swift
//  FinalProject
//
//  Created by Tuba Nur on 28.10.2021.
//

import Foundation

import UIKit

class Pokemon{
    
    var trackName: String?
    var artWorkUrl: String?
    
    var trackId: Int
    var collectionName: String?
    var type: String?
    var artwork: UIImage?
    
    init(id: Int, dictionary: [String: AnyObject]){
        self.trackId = id
        if let name = dictionary["name"] as? String{
            self.trackName = name
        }
        if let artWorkUrl = dictionary["artWorkUrl"] as? String{
            self.artWorkUrl = artWorkUrl
        }
        if let collectionName = dictionary["collectionName"] as? String{
            self.collectionName = collectionName
        }
  
    }
}
