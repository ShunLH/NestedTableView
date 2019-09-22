//
//  ParentListItemTableViewCell.swift
//  NestedTableView
//
//  Created by AcePlus Admin on 9/15/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit

class ParentListItemTableViewCell: UITableViewCell {
	static let identifier = "ParentListItemTableViewCell"
	
	@IBOutlet weak var lblParentName: UILabel!
	@IBOutlet weak var tableViewChildList: UITableView!
	var parent : ParentVO? {
		didSet {
			if let parent = parent {
				lblParentName.text = parent.parentName
			}
		}
	}

    override func awakeFromNib() {
        super.awakeFromNib()
		selectionStyle = .none
		tableViewChildList.dataSource = self
		tableViewChildList.separatorStyle = .none
		tableViewChildList.isScrollEnabled = false
		tableViewChildList.register(UINib(nibName: ChildListItemTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ChildListItemTableViewCell.identifier)
    }

	override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ParentListItemTableViewCell : UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return parent?.childs?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: ChildListItemTableViewCell.identifier, for: indexPath) as! ChildListItemTableViewCell
		cell.child = self.parent?.childs?[indexPath.row]
		return cell
		
	}
	
	
}

