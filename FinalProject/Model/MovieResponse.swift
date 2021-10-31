//
//  MovieResponse.swift
//  FinalProject
//
//  Created by Tuba Nur on 29.10.2021.
//

import Foundation

class MovieResponse: Codable {
    
  
    public let resultCount: Int
    public var results: [Movie]
    
    public init(resultCount: Int, results: [Movie]){
       
        self.resultCount = resultCount
        self.results = results
    }
}

public struct Movie: Codable {
    
    public var trackId: Int
    public let trackName: String
    public let artistName: String

    public let artworkUrl100: String
    public let collectionPrice: Double
    public let collectionName: String?
    public let primaryGenreName: String?
    
    public init(trackId: Int, trackName: String, artworkUrl100: String, collectionPrice: Double, collectionName: String?, artistName: String, primaryGenreName: String?){
        self.trackId = trackId
        self.trackName = trackName
        self.artistName = artistName
        self.artworkUrl100 = artworkUrl100
        self.collectionPrice = collectionPrice
        self.collectionName = collectionName
        self.primaryGenreName = primaryGenreName

    }
}
