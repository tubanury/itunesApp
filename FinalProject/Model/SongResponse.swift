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
    

    public class func buildURL(forTerm searchTerm: String, forFilter searchFilter: String? = nil) -> URLRequest? {
       
       guard !searchTerm.isEmpty else {return nil}
       
       let queryItems = [
           URLQueryItem(name: "term", value: searchTerm),
           URLQueryItem(name: "entity", value: searchFilter),
       ]
       
       var components = URLComponents(string: "https://itunes.apple.com/search")
       components?.queryItems = queryItems
        guard let url = components?.url else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = "get"
    
       return request
        
    
    }
}

public struct Song: Codable {
    
    public let trackId: Int
    public let trackName: String
    public let artistName: String

    public let artworkUrl100: String
    public let collectionPrice: Double
    public let collectionName: String
    
    public init(trackId: Int, trackName: String, artworkUrl100: String, collectionPrice: Double, collectionName: String, artistName: String){
        self.trackId = trackId
        self.trackName = trackName
        self.artistName = artistName
        self.artworkUrl100 = artworkUrl100
        self.collectionPrice = collectionPrice
        self.collectionName = collectionName
    }
}

