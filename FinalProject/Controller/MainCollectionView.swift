////
////  MainCollectionView.swift
////  FinalProject
////
////  Created by Tuba Nur on 30.10.2021.
////
//
//import Foundation
//
//import UIKit
//import DefaultNetworkOperationPackage
//
//
//private let reuseIdentifier = "MusicCell"
//
//class MainCollectionView: UICollectionViewController{
//    
//
//    var songs = SongResponse(resultCount: 0, results: [])
//    var movies = MovieResponse(resultCount: 0, results: [])
//    var books = BookResponse(resultCount: 0, results: [])
//    var apps = AppResponse(resultCount: 0, results: [])
//    //MARK: Init
//    
//   
//        
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureViewComponents()
//        //fetchData()
//    }
//    //MARK: API
//    
//    
//    
//    func fetchMusic(term: String, entity: String){
//        guard let request = SongResponse.buildURL(forTerm: term, forFilter: entity) else {return}
//
//        do{
//            fireApiCallForMusic(with: request) {result in
//                switch result {
//                case .failure(let error):
//                    print(error)
//                case .success(let response):
//                    DispatchQueue.main.async {
//                        self.movies.results.removeAll()
//                        self.books.results.removeAll()
//                        self.apps.results.removeAll()
//
//                        self.songs = response
//                        self.collectionView.reloadData()
//                    }
//                }
//            }
//            
//        }
//    }
//    
//    func fetchMovie(term: String, entity: String){
//        guard let request = SongResponse.buildURL(forTerm: term, forFilter: entity) else {return}
//
//        do{
//            fireApiCallForMovie(with: request) {result in
//                switch result {
//                case .failure(let error):
//                    print(error)
//                case .success(let response):
//                   
//                    DispatchQueue.main.async {
//                        self.songs.results.removeAll()
//                        self.books.results.removeAll()
//                        self.apps.results.removeAll()
//
//                        self.movies = response
//                        self.collectionView.reloadData()
//                    }
//                }
//            }
//            
//        }
//    }
//    func fetchBook(term: String, entity: String){
//        guard let request = SongResponse.buildURL(forTerm: term, forFilter: entity) else {return}
//
//        do{
//            fireApiCallForBook(with: request) {result in
//                switch result {
//                case .failure(let error):
//                    print(error)
//                case .success(let response):
//                    DispatchQueue.main.async {
//                        self.songs.results.removeAll()
//                        self.movies.results.removeAll()
//                        self.apps.results.removeAll()
//
//                        self.books = response
//                        self.collectionView.reloadData()
//                    }
//                }
//            }
//            
//        }
//    }
//    func fetchApp(term: String, entity: String){
//        guard let request = SongResponse.buildURL(forTerm: term, forFilter: entity) else {return}
//
//        do{
//            fireApiCallForApp(with: request) {result in
//                switch result {
//                case .failure(let error):
//                    print(error)
//                case .success(let response):
//                    DispatchQueue.main.async {
//                        self.songs.results.removeAll()
//                        self.movies.results.removeAll()
//                        self.books.results.removeAll()
//
//                        self.apps = response
//                        self.collectionView.reloadData()
//                    }
//                }
//            }
//            
//        }
//    }
//    
//    
//    private func fireApiCallForMusic(with request: URLRequest, with completion: @escaping (Result<SongResponse, ErrorResponse>) -> Void){
//        APIManager.shared.executeRequest(urlRequest: request, completion: completion)
//    }
//    
//    private func fireApiCallForMovie(with request: URLRequest, with completion: @escaping (Result<MovieResponse, ErrorResponse>) -> Void){
//        APIManager.shared.executeRequest(urlRequest: request, completion: completion)
//    }
//    private func fireApiCallForBook(with request: URLRequest, with completion: @escaping (Result<BookResponse, ErrorResponse>) -> Void){
//        APIManager.shared.executeRequest(urlRequest: request, completion: completion)
//    }
//    private func fireApiCallForApp(with request: URLRequest, with completion: @escaping (Result<AppResponse, ErrorResponse>) -> Void){
//        APIManager.shared.executeRequest(urlRequest: request, completion: completion)
//    }
//
//    
//    // MARK: Helper Function
//    func configureViewComponents(){
//        collectionView.backgroundColor = .white
//        collectionView.register(MusicCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//    
//    }
//    
//
//}
//
//extension MainCollectionView{
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        let index = searchBar.selectedScopeButtonIndex
//        print ("aaaaaa")
//        print (index)
//        switch index{
//            case 0:
//                return movies.resultCount
//            case 1:
//                return songs.resultCount
//            case 2:
//                return apps.resultCount
//            case 3:
//                return books.resultCount
//        default:
//            //cell.song = songs.results[indexPath.item]
//            return 0
//        }
//       
//    }
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let index = searchBar.selectedScopeButtonIndex
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MusicCell
//    
//        switch index{
//            case 0:
//                cell.movie = movies.results[indexPath.item]
//            case 1:
//                cell.song = songs.results[indexPath.item]
//            case 2:
//                cell.app = apps.results[indexPath.item]
//            case 3:
//                cell.book = books.results[indexPath.item]
//        default:
//            //cell.song = songs.results[indexPath.item]
//            let a = 1
//        }
//       
//        return cell
//    }
//    
//    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print ("selected")
//        /*if let cell = collectionView.cellForItem(at: indexPath) as? MusicCell{
//    
//        }*/
//    }
//}
//
//extension MainCollectionView: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//      
//        let width = (view.frame.width - 36)/2
//        return CGSize(width: width, height: width*1.5)
//    }
//}
//
//extension MainCollectionView: UISearchBarDelegate{
//    
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//
//        print("edit started")
//    }
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        let index = searchBar.selectedScopeButtonIndex
//        
//        if searchText.count < 2 {return}
//        
//        searchWorkItem?.cancel()
//        
//        let newTask = DispatchWorkItem { [weak self] in
//            switch index {
//            case 0:
//                self?.fetchMovie(term: searchText, entity: "movie")
//            case 1:
//                self?.fetchMusic(term: searchText, entity: "song")
//            case 2:
//                self?.fetchApp(term: searchText, entity: "software")
//            case 3:
//                self?.fetchBook(term: searchText, entity: "ebook")
//            
//            default:
//                let a = 1
//
//            }
//           
//        }
//        self.searchWorkItem = newTask
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: newTask)
//        
//    }
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        guard let text = searchBar.text else {return}
//        print(selectedScope)
//        
//        if text.count > 2 {
//            switch selectedScope {
//            case 0:
//                fetchMovie(term: text, entity: "movie")
//            case 1:
//                fetchMusic(term: text, entity: "song")
//            case 2:
//                fetchApp(term: text, entity: "software")
//            case 3:
//                fetchBook(term: text, entity: "ebook")
//            
//            default:
//                let a = 1
//
//            }
//        }
//    }
//}
//
