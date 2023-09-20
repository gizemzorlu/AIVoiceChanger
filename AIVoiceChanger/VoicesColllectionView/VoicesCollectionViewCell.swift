//
//  VoicesCollectionViewCell.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 13.09.2023.
//

import UIKit
import NeonSDK
import SnapKit

class VoicesCollectionViewCell: NeonCollectionViewCell<VoicesModal> {
    
    var voiceView = UIView()
    var voiceImageView = UIImageView()
    var voiceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupSubviews() {
        
        voiceView.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        voiceView.layer.cornerRadius = 37
        voiceView.clipsToBounds = true
        voiceView.contentMode = .scaleAspectFit
        contentView.addSubview(voiceView)
        voiceView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.width.height.equalTo(74)
        }
        
        voiceView.addSubview(voiceImageView)
        voiceImageView.layer.cornerRadius = 37
        voiceImageView.clipsToBounds = true
        voiceImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(74)
        }
        
        
        voiceLabel.textAlignment = .center
        voiceLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        voiceLabel.font = Font.custom(size: 13, fontWeight: .Light)
        contentView.addSubview(voiceLabel)
        voiceLabel.snp.makeConstraints { make in
            make.top.equalTo(voiceView.snp.bottom).offset(4)
            make.left.right.equalTo(voiceView)
            make.width.equalTo(74)
            make.height.equalTo(18)
        }
        
    }
    
    override func configure(with voice: VoicesModal) {
        super.configure(with: voice)
        voiceImageView.image = UIImage(named: voice.image)
        voiceLabel.text = voice.name
        
    }
            
    }
