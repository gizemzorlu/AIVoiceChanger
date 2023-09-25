//
//  VoicesModal.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 13.09.2023.
//

import Foundation
import UIKit

public class VoicesModal {
    
    var name : String
    var image : String
    var uuid : String
    var isSelected = false
    
    
    init(name: String, image: String, uuid: String, isSelected: Bool = false) {
        self.name = name
        self.image = image
        self.uuid = uuid
        self.isSelected = isSelected
    }
    static func createData(){
        
        let trump = VoicesModal(name: "Trump", image: "trump", uuid: "TM:z7x37sbvb8vc")
        
        let obama = VoicesModal(name: "Obama", image: "obama", uuid: "TM:58vtv7x9f32c")
        
   //        let taylor = VoicesModal(name: "Taylor", image: "taylor", )
        
        let elon = VoicesModal(name: "Elon", image: "elon", uuid: "TM:fxq6hnfc3rht")
        
        let johnny = VoicesModal(name: "Johnny", image: "johnny", uuid: "TM:ca08cc0dgrdd")
        
   //        let brad = VoicesModal(name: "Brad", image: "brad")
        
        let celebrity = VoicesModal(name: "Celebrity", image: "celebrity", uuid: "TM:4v0ft4j72y2g")
       
   //        let dualipa = VoicesModal(name: "Dua Lipa", image: "dualipa", uuid: <#T##String#>)
        
        let celebrity2 = VoicesModal(name: "Celebrity", image: "celebrity2", uuid: "TM:pyzss4phqk6r")
        
        let celebrity3 = VoicesModal(name: "Celebrity", image: "celebrity3", uuid: "TM:djceg00wmcv5")
        
            Globals.arrVoices.append(trump)
            Globals.arrVoices.append(obama)
   //            Globals.arrVoices.append(taylor)
            Globals.arrVoices.append(elon)
            Globals.arrVoices.append(johnny)
   //            Globals.arrVoices.append(brad)
            Globals.arrVoices.append(celebrity)
   //            Globals.arrVoices.append(dualipa)
            Globals.arrVoices.append(celebrity2)
            Globals.arrVoices.append(celebrity3)
        
       }
}

