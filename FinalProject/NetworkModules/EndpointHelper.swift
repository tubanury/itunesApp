//
//  EndpointHelper.swift
//  FinalProject
//
//  Created by Tuba Nur on 27.10.2021.
//

import Foundation

typealias baseUrl = EndpointHelper.BaseUrls
typealias entity = EndpointHelper.Entity

enum EndpointHelper {
    
    enum BaseUrls: String {
        case dev = "https://itunes.apple.com/search"
    }
    
    enum Entity: String {
        case song  = "music"
        case movie = "movie"
        case app = "software"
        case book = "ebook"
    }
    
    
    
}
