//
//  View.swift
//  AIVoiceChanger
//
//  Created by Gizem Zorlu on 8.09.2023.
//

import UIKit
import NeonSDK
import SnapKit

class VoiceImageView: UIView {
    
    let viewTrump = UIView()
    let viewObama = UIView()
    let viewTaylor = UIView()
    let viewElon = UIView()
    let viewBrad = UIView()
    let viewCelebrity = UIView()
    let viewDuaLipa = UIView()
    let viewCelebrity2 = UIView()
    
    let trumpImage = UIImageView()
    let trumpLabel = UILabel()
    
    let obamaImage = UIImageView()
    let obamaLabel = UILabel()
    
    let taylorImage = UIImageView()
    let taylorLabel = UILabel()
    
    let elonImage = UIImageView()
    let elonLabel = UILabel()
    
    let bradImage = UIImageView()
    let bradLabel = UILabel()
    
    let celebrityImage = UIImageView()
    let celebrityLabel = UILabel()
    
    let johnnyImage = UIImageView()
    let johnnyLabel = UILabel()
    
    let dualipaImage = UIImageView()
    let dualipapLabel = UILabel()
    
    let celebrity2Image = UIImageView()
    let celebrity2Label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        setupView()
    }
    
    private func setupView() {
        
//        Trump
        
        viewTrump.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        viewTrump.layer.cornerRadius = 40
        viewTrump.clipsToBounds = true

        self.addSubview(viewTrump)
        viewTrump.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.width.height.equalTo(80)
        }
        
        
        trumpImage.image = UIImage(named: "trump")
        viewTrump.addSubview(trumpImage)
        
        trumpImage.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(74)
    
        }
        
        trumpLabel.text = "Trump"
        trumpLabel.textAlignment = .center
        trumpLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        trumpLabel.font = Font.custom(size: 13, fontWeight: .Light)
        
        self.addSubview(trumpLabel)
        trumpLabel.snp.makeConstraints { make in
            make.left.equalTo(viewTrump)
            make.top.equalTo(viewTrump.snp.bottom).offset(4)
            make.width.equalTo(80)
            make.height.equalTo(18)
            
        }
        
//        Obama
        
        
        viewObama.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        viewObama.layer.cornerRadius = 40
        viewObama.clipsToBounds = true

        self.addSubview(viewObama)
        viewObama.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalTo(viewTrump.snp.right).offset(19)
            make.width.height.equalTo(80)
        }
        
        
        obamaImage.image = UIImage(named: "obama")
        viewObama.addSubview(obamaImage)
        
        obamaImage.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(74)
        }
        
        obamaLabel.text = "Obama"
        obamaLabel.textAlignment = .center
        obamaLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        obamaLabel.font = Font.custom(size: 13, fontWeight: .Light)
        
        self.addSubview(obamaLabel)
        obamaLabel.snp.makeConstraints { make in
            make.left.equalTo(viewObama)
            make.top.equalTo(viewObama.snp.bottom).offset(4)
            make.width.equalTo(80)
            make.height.equalTo(18)
            
        }
        
//        Taylor
        
        viewTaylor.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        viewTaylor.layer.cornerRadius = 40
        viewTaylor.clipsToBounds = true

        self.addSubview(viewTaylor)
        viewTaylor.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalTo(viewObama.snp.right).offset(19)
            make.width.height.equalTo(80)
        }
        
        taylorImage.image = UIImage(named: "taylor")
        viewTaylor.addSubview(taylorImage)
        
        taylorImage.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(74)
        }
        
        taylorLabel.text = "Taylor"
        taylorLabel.textAlignment = .center
        taylorLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        taylorLabel.font = Font.custom(size: 13, fontWeight: .Light)
        
        self.addSubview(taylorLabel)
        taylorLabel.snp.makeConstraints { make in
            make.left.equalTo(viewTaylor)
            make.top.equalTo(viewTaylor.snp.bottom).offset(4)
            make.width.equalTo(80)
            make.height.equalTo(18)
            
        }
        
//        Elon
        
        viewElon.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        viewElon.layer.cornerRadius = 40
        viewElon.clipsToBounds = true

        self.addSubview(viewElon)
        viewElon.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalTo(viewTaylor.snp.right).offset(19)
            make.width.height.equalTo(80)
        }
        
        
        elonImage.image = UIImage(named: "elon")
        viewElon.addSubview(elonImage)
        
        elonImage.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(74)
        }
        
        elonLabel.text = "Elon"
        elonLabel.textAlignment = .center
        elonLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        elonLabel.font = Font.custom(size: 13, fontWeight: .Light)
        
        self.addSubview(elonLabel)
        elonLabel.snp.makeConstraints { make in
            make.left.equalTo(viewElon)
            make.top.equalTo(viewElon.snp.bottom).offset(4)
            make.width.equalTo(80)
            make.height.equalTo(18)
            
        }
        
//        Brad
        
        viewBrad.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        viewBrad.layer.cornerRadius = 40
        viewBrad.clipsToBounds = true

        self.addSubview(viewBrad)
        viewBrad.snp.makeConstraints { (make) in
            make.top.equalTo(trumpLabel.snp.bottom).offset(12)
            make.left.equalTo(viewTrump)
            make.width.height.equalTo(80)
        }
        
        bradImage.image = UIImage(named: "brad")
        viewBrad.addSubview(bradImage)
        
        bradImage.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(74)
        }
        
        bradLabel.text = "Brad"
        bradLabel.textAlignment = .center
        bradLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        bradLabel.font = Font.custom(size: 13, fontWeight: .Light)
        
        self.addSubview(bradLabel)
        bradLabel.snp.makeConstraints { make in
            make.left.equalTo(viewBrad)
            make.top.equalTo(viewBrad.snp.bottom).offset(4)
            make.width.equalTo(80)
            make.height.equalTo(18)
            
        }
        
//      Celebrity
        
        viewCelebrity.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        viewCelebrity.layer.cornerRadius = 40
        viewCelebrity.clipsToBounds = true

        self.addSubview(viewCelebrity)
        viewCelebrity.snp.makeConstraints { (make) in
            make.top.equalTo(obamaLabel.snp.bottom).offset(12)
            make.left.equalTo(viewObama)
            make.width.height.equalTo(80)
        }
        
        celebrityImage.image = UIImage(named: "celebrity")
        viewCelebrity.addSubview(celebrityImage)
        
        celebrityImage.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(74)
        }
        
        celebrityLabel.text = "Celebrity"
        celebrityLabel.textAlignment = .center
        celebrityLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        celebrityLabel.font = Font.custom(size: 13, fontWeight: .Light)
        
        self.addSubview(celebrityLabel)
        celebrityLabel.snp.makeConstraints { make in
            make.left.equalTo(viewCelebrity)
            make.top.equalTo(viewCelebrity.snp.bottom).offset(4)
            make.width.equalTo(80)
            make.height.equalTo(18)
            
        }
        
//        Dua Lipa
        
        viewDuaLipa.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        viewDuaLipa.layer.cornerRadius = 40
        viewDuaLipa.clipsToBounds = true

        self.addSubview(viewDuaLipa)
        viewDuaLipa.snp.makeConstraints { (make) in
            make.top.equalTo(taylorLabel.snp.bottom).offset(12)
            make.left.equalTo(viewTaylor)
            make.width.height.equalTo(80)
        }
        
        dualipaImage.image = UIImage(named: "dualipa")
        viewDuaLipa.addSubview(dualipaImage)
        
        dualipaImage.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(74)
        }
        
        dualipapLabel.text = "Dua Lipa"
        dualipapLabel.textAlignment = .center
        dualipapLabel.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        dualipapLabel.font = Font.custom(size: 13, fontWeight: .Light)
        
        self.addSubview(dualipapLabel)
        dualipapLabel.snp.makeConstraints { make in
            make.left.equalTo(viewDuaLipa)
            make.top.equalTo(viewDuaLipa.snp.bottom).offset(4)
            make.width.equalTo(80)
            make.height.equalTo(18)
            
        }
        
//        Celebrity2
        
        viewCelebrity2.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        viewCelebrity2.layer.cornerRadius = 40
        viewCelebrity2.clipsToBounds = true

        self.addSubview(viewCelebrity2)
        viewCelebrity2.snp.makeConstraints { (make) in
            make.top.equalTo(elonLabel.snp.bottom).offset(12)
            make.left.equalTo(viewElon)
            make.width.height.equalTo(80)
        }
        
        celebrity2Image.image = UIImage(named: "celebrity2")
        viewCelebrity2.addSubview(celebrity2Image)
        
        celebrity2Image.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(74)
        }
        
        celebrity2Label.text = "Celebrity"
        celebrity2Label.textAlignment = .center
        celebrity2Label.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        celebrity2Label.font = Font.custom(size: 13, fontWeight: .Light)
        
        self.addSubview(celebrity2Label)
        celebrity2Label.snp.makeConstraints { make in
            make.left.equalTo(viewCelebrity2)
            make.top.equalTo(viewCelebrity2.snp.bottom).offset(4)
            make.width.equalTo(80)
            make.height.equalTo(18)
            
        }
        
        
        
        
        
        
        
        
        
    }
        
        
      
}

