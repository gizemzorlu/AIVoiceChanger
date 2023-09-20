//
//  Globals.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 13.09.2023.
//

import Foundation
import UIKit

public class Globals {
    
    public static var arrVoices = [VoicesModal]()
    public static var selectedVoiceUUID : String?
    public static var voiceBaseURL = "https://storage.googleapis.com/vocodes-public"
    public static var resultVoiceURL = ""
    public static var choosenName: String = ""
    public static var choosenImage: String = ""
    public static var choosenUUID: String = ""
    public static var promptText: String = ""
    public static var songArr = [SavedSongs]()
}
