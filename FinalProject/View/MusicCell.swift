//
//  MusicCell.swift
//  FinalProject
//
//  Created by Tuba Nur on 26.10.2021.
//

import Foundation
import UIKit
class MusicCell: UICollectionViewCell{
    
    var song: Song?{
        didSet{
            nameLabel.text = (song?.trackName ?? "")
            artistLabel.text = (song?.artistName ?? "")

            print(song?.trackName ?? "")
           // imageView.image = song?.image
            fetchImage(withUrlString: song?.artworkUrl100 ?? "") { image in
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
                
            }
        }
        
    }
    
    private lazy var shadowContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.4
        view.layer.cornerRadius = 6
        return view
    }()
    var imageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .clear
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    lazy var mainContainerView: UIView = {
        let temp = UIView()
        temp.backgroundColor = .systemBackground
        //temp.addSubview(containerView)
        
        //containerView.center(inView: temp)
        temp.addSubview(stackView)
        stackView.center(inView: temp)
        return temp
    }()
    
    lazy var stackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [nameLabel, artistLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 3
        return temp
        
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .white.withAlphaComponent(0.4)
        //view.addSubview(nameLabel)
        view.layer.cornerRadius = 10
        //nameLabel.center(inView: view)
        //nameLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        return view
    }()
   
    let nameLabel: UILabel = {
       let temp = UILabel()
        temp.textColor = .black
        temp.font = UIFont.systemFont(ofSize: 16)
        temp.text = "Some Music"
        temp.numberOfLines = 2
        //temp.layer.masksToBounds = true
        //temp.layer.cornerRadius = 10
        //temp.backgroundColor = .white.withAlphaComponent(0.4)
        temp.textAlignment = .center
        
        return temp
    }()
    let artistLabel: UILabel = {
       let temp = UILabel()
        temp.textColor = .secondaryLabel
        temp.font = UIFont.systemFont(ofSize: 16)
        temp.text = "Some Music"
        temp.numberOfLines = 2
        //temp.layer.masksToBounds = true
        //temp.layer.cornerRadius = 10
        //temp.backgroundColor = .white.withAlphaComponent(0.4)
        temp.textAlignment = .center
        
        return temp
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewConfigurations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViewConfigurations(){
        
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
       
        addSubview(shadowContainerView)
        
        shadowContainerView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 48)
        
        shadowContainerView.addSubview(mainContainerView)
        mainContainerView.anchor(top: shadowContainerView.topAnchor, left: shadowContainerView.leftAnchor, bottom: shadowContainerView.bottomAnchor, right: shadowContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 48)
       
        addSubview(imageView)

        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: self.frame.height - 32)
        
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
