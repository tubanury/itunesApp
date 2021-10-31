//
//  DetailView.swift
//  FinalProject
//
//  Created by Tuba Nur on 30.10.2021.
//

import Foundation

import UIKit

class DetailView: UIView{
    
    
    var song: Song?{
        didSet{
            searchLabel.text = (song?.trackName ?? "")
           
            print(song?.trackName ?? "")
            fetchImage(withUrlString: song?.artworkUrl100 ?? "") { image in
                DispatchQueue.main.async {
                    self.searchImage.image = image
                }
                
            }
        }
        
    }
    var movie: Movie?{
        didSet{
            searchLabel.text = (movie?.trackName ?? "")
            fetchImage(withUrlString: movie?.artworkUrl100 ?? "") { image in
                DispatchQueue.main.async {
                    self.searchImage.image = image
                }
                
            }
        }
        
    }
    var app: App?{
        didSet{
            searchLabel.text = (app?.trackName ?? "")
           
            fetchImage(withUrlString: app?.artworkUrl100 ?? "") { image in
                DispatchQueue.main.async {
                    self.searchImage.image = image
                }
                
            }
        }
        
    }
    var book: Book?{
        didSet{
            searchLabel.text = (book?.trackName ?? "")
            fetchImage(withUrlString: book?.artworkUrl100 ?? "") { image in
                DispatchQueue.main.async {
                    self.searchImage.image = image
                }
                
            }
        }
        
    }
    
    
    
    
    private lazy var containerView: UIView = {
       let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.backgroundColor = .white
        return temp
    }() //boş container, padding vs verirken yönetim kolaylığı sağlar
    
    private lazy var mainStackView: UIStackView = {
    
        let temp = UIStackView(arrangedSubviews: [searchImage, searchLabel])
        searchImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        searchImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 0
        return temp
        
        
    }()
  
 
    private lazy var searchImage: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints =  false
        temp.contentMode = .scaleAspectFill
        temp.image = UIImage(named: "startSearch")
        return temp
        
    }()
    
    private lazy var searchLabel: UILabel = {
        let temp =  UILabel()
        temp.text = "Waiting to search!"
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
        
    }()
    private lazy var priceLabel: UILabel = {
        let temp =  UILabel()
        temp.text = "9.99"
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addUserComponents()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addUserComponents(){
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -60),
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
        ])
        
    }
    private func setupContainerViewLayers(){
        containerView.layer.cornerRadius = 10
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    private func fetchImage(withUrlString urlString: String, completion: @escaping(UIImage)->()){
        
        guard let url  = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error =  error {
                print ("fetchin image error", error.localizedDescription)
                return
            }
            
            guard let data  = data  else {return}
            guard let image = UIImage(data: data) else {return}
            
            completion(image)
        }.resume()
    }
}
