//
//  EndpointHelper.swift
//  FinalProject
//
//  Created by Tuba Nur on 27.10.2021.
//

import Foundation

class EndpointHelper {
    public class func buildURL(forTerm searchTerm: String, forFilter searchFilter: String? = nil, forPage page: String? = "0" ) -> URLRequest? {
       
       guard !searchTerm.isEmpty else {return nil}
       
       let queryItems = [
           URLQueryItem(name: "term", value: searchTerm),
           URLQueryItem(name: "entity", value: searchFilter),
           URLQueryItem(name: "limit", value: "20"),
           URLQueryItem(name: "offset", value: page),
       ]
      
       
       var components = URLComponents(string: "https://itunes.apple.com/search")
       components?.queryItems = queryItems
        guard let url = components?.url else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = "get"
    
       return request

    }
    
}
