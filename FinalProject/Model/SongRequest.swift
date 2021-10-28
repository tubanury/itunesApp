//
//  SongRequest.swift
//  FinalProject
//
//  Created by Tuba Nur on 27.10.2021.
//

import Foundation

class SongRequest: Codable {
    
    private(set) public var songId: Int?
    private(set) public var term: String

    private(set) public var offset: Int = 0
    private(set) public var limit: Int = 30
    
    public init (term: String, offset: Int = 0, limit: Int = 30)
    {
        self.term = term
        self.offset = offset
        self.limit = limit
    }

    
    
    
    
}
 
