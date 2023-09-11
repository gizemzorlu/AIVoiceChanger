//
//  File.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 8.09.2023.
//

import UIKit

class CustomGradientButton: UIButton {
    
    
  override func layoutSubviews() {
      
    super.layoutSubviews()
    gradientLayer.frame = bounds
  }
    
  private lazy var gradientLayer: CAGradientLayer = {
    let l = CAGradientLayer()
    l.frame = self.bounds
      
    l.colors = [UIColor(red: 0.70, green: 0.47, blue: 1.00, alpha: 1.00).cgColor, UIColor(red: 0.31, green: 0.34, blue: 1.00, alpha: 1.00).cgColor]
      
    l.startPoint = CGPoint(x: 0, y: 0.5)
      
    l.endPoint = CGPoint(x: 1, y: 0.5)
    l.cornerRadius = 20
    layer.insertSublayer(l, at: 0)
    return l
      
  }()
}








