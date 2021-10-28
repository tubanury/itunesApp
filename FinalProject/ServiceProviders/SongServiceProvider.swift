//
//  SongServiceProvider.swift
//  FinalProject
//
//  Created by Tuba Nur on 27.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage


class SongServiceProvider: ApiServiceProvider<SongRequest>{
    
    
    init(request: SongRequest){
        super.init(method: .get, baseUrl: baseUrl.dev.rawValue, path: nil, data: request)
        
    }
    
    
    
    
    
}
