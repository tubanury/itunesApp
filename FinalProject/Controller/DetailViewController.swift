//
//  File.swift
//  FinalProject
//
//  Created by Tuba Nur on 30.10.2021.
//

import Foundation

import UIKit

class DetailViewController: UIViewController{
    
    var detailSong = Song(trackId: 0, trackName: "", artworkUrl100: "", collectionPrice: 0.0, collectionName: "", artistName: "")
    var detailMovie = Movie(trackId: 0, trackName: "", artworkUrl100: "", collectionPrice: 0.0, collectionName: "", artistName: "", primaryGenreName: "")
    var detailApp = App(trackId: 0, trackName: "", artworkUrl100: "", formattedPrice: "", primaryGenreName: "")
    var detailBook = Book(trackId: 0, trackName: "", artworkUrl100: "", formattedPrice: "", collectionName: "", artistName: "")
    
    let detailView = DetailView()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewComponents()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if detailSong.trackId != 0 {
            detailView.song = detailSong
        }
        else if detailMovie.trackId != 0 {
            detailView.movie = detailMovie
        }
        else if detailApp.trackId != 0 {
            detailView.app = detailApp
        }
        else if detailBook.trackId != 0 {
            detailView.book = detailBook
        }
        
        

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        detailView.song?.trackId = 0
        detailView.movie?.trackId = 0
        detailView.app?.trackId = 0
        detailView.book?.trackId = 0
    }
    func configureViewComponents(){
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9767697453, green: 0.5664579868, blue: 0.1543098092, alpha: 1)
        detailView.translatesAutoresizingMaskIntoConstraints =  false
        //detailView.song = detailSong
        view.addSubview(detailView)
        
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

       
       
    }
    
}
