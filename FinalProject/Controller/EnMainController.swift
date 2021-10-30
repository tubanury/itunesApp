//
//  EnMainController.swift
//  FinalProject
//
//  Created by Tuba Nur on 30.10.2021.
//

import Foundation
//
//  MainController.swift
//  FinalProject
//
//  Created by Tuba Nur on 26.10.2021.
//

import UIKit


class EnMainController: UIViewController {
    

   
    let searchBar = UISearchBar()
    var searchWorkItem: DispatchWorkItem?
    private var startSearchView = StartSearchView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        addStartSearchView()
    }
    //MARK: API
    
  
    
    // MARK: Helper Function
    func configureViewComponents(){
        searchBar.sizeToFit()
        searchBar.placeholder = "Search something..."
        searchBar.delegate = self
        searchBar.scopeButtonTitles = ["Movies", "Music", "Apps", "Books"]
        searchBar.showsScopeBar = true
    
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.titleView?.tintColor = .white
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Itunes"
        navigationItem.titleView = searchBar
        searchBar.becomeFirstResponder() //gerekli mi????
       
    }
    private func addStartSearchView(){
        //startSearchView = PermissionMainView(data: viewModel.getPermissionMainViewData())
        startSearchView.translatesAutoresizingMaskIntoConstraints =  false
        view.addSubview(startSearchView)
        
        NSLayoutConstraint.activate([
            startSearchView.topAnchor.constraint(equalTo: view.topAnchor),
            startSearchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            startSearchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            startSearchView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    

}

extension EnMainController: UISearchBarDelegate{
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
       
        print("edit started")
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count < 2 {return}
        
        startSearchView.removeFromSuperview()
        
    }
    
}

