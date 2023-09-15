//
//  Voices.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 10.09.2023.
//

import Foundation
import UIKit

//class Song : Codable {
//    var success : Bool
//    var state : {
//        var job_token :  String,
//        var status : String,
//        var maybe_extra_status_description : String,
//        "attempt_count": 0,
//        "maybe_result_token": null,        "maybe_public_bucket_wav_audio_path": null,
//        "model_token": "TM:7wbtjphx8h8v",
//        "tts_model_type": "tacotron2",
//        "title": "Mario*",        "raw_inference_text": "This is a use of the voice",
//        "created_at": "2022-02-28T05:39:36Z",
//        "updated_at": "2022-02-28T05:39:36Z"
//      }
//    }
    
class SongURL : Codable {
    
    let url : String
    
    enum CodingKeys : String, CodingKey {
        case url = "maybe_public_bucket_wav_audio_path"
    }
    
    init(url: String) {
        self.url = url
    }
}
    
struct TTSGenerationRequest :Codable {
    let tts_model_token: String
    let uuid_idempotency_token: String
    let inference_text: String
}

extension UIColor {
    static let labelColor = UIColor(named: "LabelColor")
}
