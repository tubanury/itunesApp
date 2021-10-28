//
//  MusicCell.swift
//  FinalProject
//
//  Created by Tuba Nur on 26.10.2021.
//

import Foundation
import UIKit
class MusicCell: UICollectionViewCell{
    
    /*var music: Music?{
        didSet{
            nameLabel.text = music?.name?.capitalized
            imageView.image = music?.image
          
        }
        
    }*/
    
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
        //iv.backgroundColor = .groupTableViewBackground
        iv.backgroundColor = #colorLiteral(red: 0.2050352991, green: 0.770994544, blue: 0.3534177542, alpha: 1)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var mainContainerView: UIView = {
        let temp = UIView()
        temp.backgroundColor = #colorLiteral(red: 0.2050352991, green: 0.770994544, blue: 0.3534177542, alpha: 1)
        temp.addSubview(containerView)
        
        containerView.center(inView: temp)
        return temp
    }()
    
   
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .white.withAlphaComponent(0.4)
        view.addSubview(nameLabel)
        view.layer.cornerRadius = 10
        nameLabel.center(inView: view)
        return view
    }()
   
    let nameLabel: UILabel = {
       let temp = UILabel()
        temp.textColor = .white
        temp.font = UIFont.systemFont(ofSize: 16)
        temp.text = "Some Music"
        temp.layer.masksToBounds = true
        temp.layer.cornerRadius = 10
        temp.backgroundColor = .white.withAlphaComponent(0.4)
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
}
