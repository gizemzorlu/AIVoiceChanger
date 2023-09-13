//
//  Voices.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 10.09.2023.
//

import Foundation

class Song : Codable {
    
    var title : String
    var model_token : String
    
    init(title: String, model_token: String) {
        self.title = title
        self.model_token = model_token
    }
    }
    
    
    
