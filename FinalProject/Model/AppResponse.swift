//
//  AppResponse.swift
//  FinalProject
//
//  Created by Tuba Nur on 29.10.2021.
//

import Foundation


class AppResponse: Codable {
    
  
    public let resultCount: Int
    public var results: [App]
    
    public init(resultCount: Int, results: [App]){
       
        self.resultCount = resultCount
        self.results = results
    }
}

public struct App: Codable {
    
    public var trackId: Int
    public let trackName: String

    public let artworkUrl100: String
    public let formattedPrice: String
    //public let collectionName: String?
    public let primaryGenreName: String?
    public var releaseDate: String

    public init(trackId: Int, trackName: String, artworkUrl100: String, formattedPrice: String, primaryGenreName: String?, releaseDate: String){
        self.trackId = trackId
        self.trackName = trackName
        self.artworkUrl100 = artworkUrl100
        self.formattedPrice = formattedPrice
        self.primaryGenreName = primaryGenreName
        self.releaseDate = releaseDate
    }
}
