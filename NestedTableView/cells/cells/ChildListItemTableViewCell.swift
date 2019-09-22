//
//  ChildListItemTableViewCell.swift
//  NestedTableView
//
//  Created by AcePlus Admin on 9/15/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit

class ChildListItemTableViewCell: UITableViewCell {
	static let identifier = "ChildListItemTableViewCell"
	
	@IBOutlet weak var ivProfile: UIImageView!
	@IBOutlet weak var lblStudentName: UILabel!
	@IBOutlet weak var lblGender: UILabel!
	
	var child :ChildVO? {
		didSet {
			if let child = child {
				lblStudentName.text = child.childName
				lblGender.text = child.gender
				if child.gender == "Male"{
					ivProfile.image = UIImage(named: "boy-image")
				}else {
					ivProfile.image = UIImage(named: "girl-image")
				}
			}
		}
	}
	
	override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
