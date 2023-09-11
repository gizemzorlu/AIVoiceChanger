//
//  HomeVC2.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 8.09.2023.
//

import UIKit
import NeonSDK
import SnapKit

class HomeVC2: UIViewController, UITextViewDelegate {
    
    let voiceTitleLabel = UILabel()
    let backButton = UIButton()
    var aiPromptLabel = UILabel()
    var aiResponseTextView = UITextView()
    var placeholderLabel = UILabel()
    var characterLimitLabel = UILabel()
    var characterCountLabel = UILabel()
    var selectVoiceLabel = UILabel()
    var selectVoiceButton = UIButton()
    
    var voicesView = VoiceImageView()
    
    var generateButton = CustomGradientButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        
        view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        
        voiceTitleLabel.text = "AI Voices"
        voiceTitleLabel.textAlignment = .center
        voiceTitleLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        voiceTitleLabel.sizeToFit()
        voiceTitleLabel.font = Font.custom(size: 22, fontWeight: .Bold)
        
        view.addSubview(voiceTitleLabel)
        voiceTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalTo(150)
            make.height.equalTo(28)
          
        }
        
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)

      
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(voiceTitleLabel)
            make.left.equalToSuperview().offset(36)
         
        }
        
        aiPromptLabel.text = "What should AI character say?"
        aiPromptLabel.textAlignment = .left
        aiPromptLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        aiPromptLabel.font = Font.custom(size: 17, fontWeight: .Medium)
        
        view.addSubview(aiPromptLabel)
        aiPromptLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().inset(30)
            make.top.equalTo(voiceTitleLabel.snp.bottom).offset(34)
            make.width.equalTo(300)
            make.height.equalTo(22)
           
        }
        
        aiResponseTextView.layer.borderWidth = 0.5
        aiResponseTextView.layer.borderColor = UIColor.black.cgColor
        aiResponseTextView.sizeToFit()
        aiResponseTextView.layer.cornerRadius = 30
        aiResponseTextView.font = Font.custom(size: 17, fontWeight: .Light)
        aiResponseTextView.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        aiResponseTextView.delegate = self
        
        view.addSubview(aiResponseTextView)
        aiResponseTextView.snp.makeConstraints { make in
            make.left.right.equalTo(aiPromptLabel)
            make.top.equalTo(aiPromptLabel.snp.bottom).offset(12)
            make.height.equalTo(190)
        }
        
        placeholderLabel.text = "Write your prompts"
        placeholderLabel.textAlignment = .left
        placeholderLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        placeholderLabel.sizeToFit()
        placeholderLabel.font = Font.custom(size: 17, fontWeight: .Light)
        
        aiResponseTextView.addSubview(placeholderLabel)
        placeholderLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(12)
            make.width.equalTo(334)
            make.height.equalTo(22)
          
        }
        
        characterLimitLabel.text = "Max 250 Character"
        characterLimitLabel.textAlignment = .left
        characterLimitLabel.sizeToFit()
        characterLimitLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        characterLimitLabel.font = Font.custom(size: 13, fontWeight: .Light)
        
        view.addSubview(characterLimitLabel)
        characterLimitLabel.snp.makeConstraints { make in
            make.left.equalTo(aiPromptLabel)
            make.top.equalTo(aiResponseTextView.snp.bottom).offset(12)
            make.width.equalTo(160)
            make.height.equalTo(18)
           
        }

            
        characterCountLabel.text = "250"
        characterCountLabel.textAlignment = .right
        characterCountLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        characterCountLabel.font = Font.custom(size: 13, fontWeight: .Light)
        
        view.addSubview(characterCountLabel)
        characterCountLabel.snp.makeConstraints { make in
            make.right.equalTo(aiPromptLabel)
            make.top.equalTo(aiResponseTextView.snp.bottom).offset(12)
            make.width.equalTo(50)
            make.height.equalTo(18)
           
        }
        
        
        selectVoiceLabel.text = "Select AI Voice"
        selectVoiceLabel.textAlignment = .left
        selectVoiceLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        selectVoiceLabel.font = Font.custom(size: 17, fontWeight: .Medium)
        
        view.addSubview(selectVoiceLabel)
        selectVoiceLabel.snp.makeConstraints { make in
            make.left.equalTo(aiPromptLabel)
            make.top.equalTo(characterLimitLabel.snp.bottom).offset(24)
            make.width.equalTo(160)
            make.height.equalTo(22)
           
        }
        
        
        selectVoiceButton.setTitle("See all >", for: .normal)
        selectVoiceButton.setTitleColor(UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00), for: .normal)
        selectVoiceButton.backgroundColor = .systemBackground
        selectVoiceButton.titleLabel?.font = Font.custom(size: 17, fontWeight: .Medium)
        selectVoiceButton.addTarget(self, action: #selector(seeAllVoice), for: .touchUpInside
        )
        view.addSubview(selectVoiceButton)
        selectVoiceButton.snp.makeConstraints { make in
            make.right.equalTo(aiPromptLabel)
            make.top.equalTo(characterLimitLabel.snp.bottom).offset(24)
            make.width.equalTo(90)
            make.height.equalTo(22)
        }
        
        
        view.addSubview(voicesView)
        voicesView.snp.makeConstraints { make in
            make.top.equalTo(selectVoiceLabel.snp.bottom).offset(24)
            make.left.right.equalToSuperview().offset(10)
        }
        
        generateButton.setTitle("Generate", for: .normal)
        generateButton.setTitleColor(UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00), for: .normal)
   
        generateButton.addTarget(self, action: #selector(generateButtonClicked), for: .touchUpInside)
        
        view.addSubview(generateButton)
        generateButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(voicesView.bradLabel.snp.bottom).offset(43)
            make.width.equalTo(350)
            make.height.equalTo(60)
        }
        
        
        
        
        let gestureRecognizerKey = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizerKey)
        
        
    }
    

@objc func generateButtonClicked() {
    
    present(destinationVC: SongGenerationVC(), slideDirection: .up)
    
    
}
        
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        
        placeholderLabel.isHidden = true
        
        return true
    
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == aiResponseTextView {
              let currentText = textView.text as NSString
              let newText = currentText.replacingCharacters(in: range, with: text)
            
              let characterLimit = 250
              
              let remainingCharacters = characterLimit - newText.count
              
              characterCountLabel.text = "\(remainingCharacters)"
              
              return newText.count <= characterLimit
          }
          
          return true
    }
    
    @objc func seeAllVoice() {
        
       dismiss(animated: true)
    }
    
    
    @objc func backButtonClicked() {
        
       dismiss(animated: true)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
}
}

