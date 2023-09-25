//
//  AllSongsCollectionViewCell.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 18.09.2023.
//

import UIKit
import NeonSDK
import SnapKit

class SongsCollectionViewCell: NeonCollectionViewCell<SavedSongs> {
    
    var songImageView = UIImageView()
    var titleLabel = UILabel()
    var voiceNameLabel = UILabel()
    var promptLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupSubviews() {
        
        contentView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)
        contentView.layer.cornerRadius = 10
        
        contentView.addSubview(songImageView)
        songImageView.layer.cornerRadius = 37
        songImageView.layer.borderWidth = 6
        songImageView.layer.borderColor = UIColor(red: 0.70, green: 0.47, blue: 1.00, alpha: 1.00).cgColor
        songImageView.clipsToBounds = true
        songImageView.contentMode = .scaleAspectFit
        songImageView.clipsToBounds = true
        songImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(18)
            make.left.equalToSuperview().offset(15)
            make.width.height.equalTo(74)
        }
        
        titleLabel.textAlignment = .left
        titleLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        titleLabel.font = UIFont(name: "Poppins-Medium", size: 13)
        titleLabel.sizeToFit()
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(songImageView)
            make.left.equalTo(songImageView.snp.right).offset(22)
        }
        
        voiceNameLabel.textAlignment = .left
        voiceNameLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        voiceNameLabel.font = UIFont(name: "Poppins-SemiBold", size: 10)
        voiceNameLabel.sizeToFit()
        contentView.addSubview(voiceNameLabel)
        voiceNameLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.equalTo(titleLabel)
        }
        
        promptLabel.textAlignment = .left
        promptLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        promptLabel.font = UIFont(name: "Poppins-Regular", size: 12)
        promptLabel.sizeToFit()
        contentView.addSubview(promptLabel)
        promptLabel.snp.makeConstraints { make in
            make.top.equalTo(voiceNameLabel.snp.bottom).offset(4)
            make.left.equalTo(titleLabel)
        }
    }
  
    override func configure(with song: SavedSongs) {
        super.configure(with: song)
        songImageView.image = UIImage(named: song.voiceImage)
        voiceNameLabel.text = song.voiceName
        promptLabel.text = song.promptText
        titleLabel.text = "Generation"
    }
}


