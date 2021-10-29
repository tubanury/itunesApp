//
//  MainController.swift
//  FinalProject
//
//  Created by Tuba Nur on 26.10.2021.
//

import UIKit
import DefaultNetworkOperationPackage


private let reuseIdentifier = "MusicCell"
class MainController: UICollectionViewController{
    
    var songs = SongResponse(resultCount: 0, results: [])
    
    
    //MARK: Init
    let searchBar = UISearchBar()

    //let segmentedControl = UISegmentedControl()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        //fetchData()
    }
    //MARK: API
    
    
    
    func fetchData(term: String){
       
        do{
            guard let request = try?
                    SongResponse.buildURL(forTerm: term, forFilter: "song") else {return}
            
            fireApiCall(with: request) {result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let response):
                    print(response)
                    DispatchQueue.main.async {
                        self.songs = response
                        self.collectionView.reloadData()
                    }
                }
            }
            
        }
    }
      
    
    private func fireApiCall(with request: URLRequest, with completion: @escaping (Result<SongResponse, ErrorResponse>) -> Void){
        APIManager.shared.executeRequest(urlRequest: request, completion: completion)
    }
    
   

    
    // MARK: Helper Function
    func configureViewComponents(){
        searchBar.sizeToFit()
        searchBar.delegate = self
        searchBar.scopeButtonTitles = ["Movies", "Music", "Apps", "Books"]
        searchBar.showsScopeBar = true
        /*segmentedControl.insertSegment(withTitle: "deneme", at: 0, animated: true)
        segmentedControl.setTitle("test", forSegmentAt: 0)

        segmentedControl.insertSegment(withTitle: "deneme2", at: 1, animated: true)
        segmentedControl.setTitle("test2", forSegmentAt: 1)*/
        
        collectionView.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.titleView?.tintColor = .white
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        //navigationItem.title = "Itunes"
        navigationItem.titleView = searchBar
        searchBar.becomeFirstResponder() //gerekli mi????
        
        collectionView.register(MusicCell.self, forCellWithReuseIdentifier: reuseIdentifier)
       
       
    }
    

}

extension MainController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songs.resultCount
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MusicCell
        //cell.song = songs[indexPath.item]
        
        cell.song = songs.results[indexPath.item]
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print ("selected")
        /*if let cell = collectionView.cellForItem(at: indexPath) as? MusicCell{
    
        }*/
    }
}

extension MainController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        let width = (view.frame.width - 36)/2
        return CGSize(width: width, height: width*1.5)
    }
}

extension MainController: UISearchBarDelegate{
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("edit started")
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 2 {
            print (searchText)
            fetchData(term: searchText)
        }
    }
}
