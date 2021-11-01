//
//  SongResponse.swift
//  FinalProject
//
//  Created by Tuba Nur on 27.10.2021.
//

import Foundation
import UIKit
class SongResponse: Codable {
    
  
    public let resultCount: Int
    public var results: [Song]
    
    public init(resultCount: Int, results: [Song]){
       
        self.resultCount = resultCount
        self.results = results
    }
}

public struct Song: Codable {
    
    public var trackId: Int
    public let trackName: String
    public let artistName: String

    public let artworkUrl100: String
    public let collectionPrice: Double
    public let collectionName: String
    public var releaseDate: String
    
    public init(trackId: Int, trackName: String, artworkUrl100: String, collectionPrice: Double, collectionName: String, artistName: String, releaseDate: String){
        self.trackId = trackId
        self.trackName = trackName
        self.artistName = artistName
        self.artworkUrl100 = artworkUrl100
        self.collectionPrice = collectionPrice
        self.collectionName = collectionName
        self.releaseDate = releaseDate

       

        
    }
}

