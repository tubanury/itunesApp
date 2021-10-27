//
//  Music.swift
//  FinalProject
//
//  Created by Tuba Nur on 26.10.2021.
//

import Foundation

import UIKit

class Music{
    
    var id: Int?
    var name: String?
    var imageUrl: String?
    var image: UIImage?
    var description: String?
    var type: String?
    
    init(id: Int, dictionary: [String: AnyObject]){
        
        self.id = id
        
        if let name = dictionary["name"] as? String{
            self.name = name
        }
        if let imageUrl = dictionary["imageUrl"] as? String{
            self.imageUrl = imageUrl
        }
        if let type = dictionary["type"] as? String{
            self.type = type
        }
     
    }
    
    
}
