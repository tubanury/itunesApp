//
//  Music.swift
//  FinalProject
//
//  Created by Tuba Nur on 26.10.2021.
//

import Foundation
import Combine
import UIKit

class SongViewModel: Identifiable, ObservableObject{
    
    var id: Int
    var collectionName: String?
    var description: String?
    var type: String?
    @Published var artwork: UIImage?
    
    init(song: Song){
        
        self.id = song.id
        self.collectionName = song.collectionName
        
    }
}


class SonglistViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published public private(set) var songs: [SongViewModel] = []
    
    
    
    private let dataModel: SongResponse = SongResponse()
    private var disposables = Set<AnyCancellable>()
    

    init(){
        $searchTerm.sink(receiveValue: loadSongs(searchTerm:)).store(in: &disposables)
    }


    private func loadSongs(searchTerm: String){
        songs.removeAll()
        /*dataModel.loadSongs(searchTerm: searchTerm){ songs in
            songs.forEach {self.appendsong(song: $0)}
            
        }*/
    }
    
    private func appendsong(song: Song){
        let songViewModel = SongViewModel(song: song)
        DispatchQueue.main.async {
            self.songs.append(songViewModel)
        }
    }
    
    
}
