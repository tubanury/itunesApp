//
//  SongResponse.swift
//  FinalProject
//
//  Created by Tuba Nur on 27.10.2021.
//

import Foundation

class SongResponse: Codable {
    
    /*public let data: SongListData
    public init(data: SongListData){
        self.data = data
    }*/
    
    
    //private var dataTask: URLSessionDataTask?
    
    
    
   /* func loadSongs(searchTerm: String, completion: @escaping(([Song]) -> Void)) {
        
        dataTask?.cancel() //stop any executing task
        guard let url = buildURL(forTerm: searchTerm, forFilter: "song") else {
            completion([])
            return
        }
        dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion([])
                return
            }
            if let songResponse = try? JSONDecoder().decode(SongList.self, from: data){
                
                completion(songResponse.results)
            }
        }

        dataTask?.resume()
        
    }*/
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
public struct SongList: Codable {
    
    public let limit, total, count: Int
    public let results: [Song]
    
    public init(limit: Int, total: Int, count: Int, results: [Song]){
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }
}

public struct Song: Codable {
    
    public let id: Int
    public let name: String
    public let artworkUrl100: String
    public let collectionPrice: Int
    public let collectionName: String
    
    
    public init(id: Int, name: String, artworkUrl100: String, collectionPrice: Int, collectionName: String){
        self.id = id
        self.name = name
        self.artworkUrl100 = artworkUrl100
        self.collectionPrice = collectionPrice
        self.collectionName = collectionName
    }
}

