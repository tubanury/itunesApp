//
//  Extensions.swift
//  FinalProject
//
//  Created by Tuba Nur on 26.10.2021.
//

import UIKit

extension UIView{
    func center(inView view: UIView){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat){
        
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top{
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left{
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom{
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if let right = right{
            self.rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
    
        if width != 0{
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0{
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    
}


extension MusicCell{
    func getFormattedDate(unformatted: String) -> String{
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy"
        let formatted = dateFormatterGet.date(from: unformatted)
        
        return dateFormatterPrint.string(from: formatted ?? Date())
        
    }
}
