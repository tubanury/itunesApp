//
//  BookResponse.swift
//  FinalProject
//
//  Created by Tuba Nur on 29.10.2021.
//

import Foundation

class BookResponse: Codable {
    
  
    public let resultCount: Int
    public var results: [Book]
    
    public init(resultCount: Int, results: [Book]){
       
        self.resultCount = resultCount
        self.results = results
    }
}

public struct Book: Codable {
    
    public let trackId: Int
    public let trackName: String
    public let artistName: String

    public let artworkUrl100: String
    public let formattedPrice: String?
    public let collectionName: String?
    
    public init(trackId: Int, trackName: String, artworkUrl100: String, formattedPrice: String?, collectionName: String?, artistName: String){
        self.trackId = trackId
        self.trackName = trackName
        self.artistName = artistName
        self.artworkUrl100 = artworkUrl100
        self.formattedPrice = formattedPrice
        self.collectionName = collectionName

    }
}
