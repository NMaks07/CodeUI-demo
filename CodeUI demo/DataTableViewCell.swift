//
//  DataTableViewCell.swift
//  CodeUI demo
//
//  Created by Nodirbek Maksumov on 12/05/21.
//

import UIKit
import PinLayout

class DataTableViewCell: UITableViewCell {

    let phoneNum: UILabel = {
        let l = UILabel()
        l.textColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)
        l.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.09

        // Line height: 18 pt
        // (identical to box height)

        //l.attributedText = NSMutableAttributedString(string: "+7 965 407 00 39", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return l
    }()
    
    let checkedImg: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    let timeLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.09
        return lbl
    }()
    
    let msgLbl: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .white

        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.09
        
        return lb
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(phoneNum)
        contentView.addSubview(checkedImg)
        contentView.addSubview(timeLbl)
        contentView.addSubview(msgLbl)
        // Initialization code
    }

    func set(msg: Message){
        self.phoneNum.text = msg.text
        
        if msg.isPhoneCheked {
            checkedImg.image = UIImage(named: "chekedActive")
        } else {
            checkedImg.image = UIImage(named: "chekedDisabled")
        }
        
        msgLbl.text = msg.text
        timeLbl.text = msg.time
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("layoutcell rabotaet")
        phoneNum.pin.left(16).top(24).sizeToFit()
        checkedImg.pin.top(24).after(of: phoneNum).margin(4).size(12)
        
        timeLbl.pin.topRight().sizeToFit()
        
        msgLbl.pin.left().below(of: phoneNum).sizeToFit()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
