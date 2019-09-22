//
//  ViewController.swift
//  NestedTableView
//
//  Created by AcePlus Admin on 9/15/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: BaseViewController {

	@IBOutlet weak var parentTableView: UITableView!
	var parentList : [ParentVO] = []
	var refreshControl = UIRefreshControl()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		let baseURLString = "https://a847c7d4-655d-497f-9f10-b3ea1a4e51b5.mock.pstmn.io/parents"
		
//		guard let url = URL(string: baseURLString) else {return}
//		Alamofire.request(url).responseData { (response) in
//			guard let data = response.result.value else {return}
//			do {
//				let decoder = JSONDecoder()
//				decoder.keyDecodingStrategy = .convertFromSnakeCase
//				self.parentList = try decoder.decode([ParentVO].self, from: data)
//				
//				print(self.parentList.first?.childs?.first?.childName ?? "")
//				self.parentTableView.reloadData()
//			}catch let jsonErr{
//				print(jsonErr)
//			}
//		}
		parentTableView.delegate = self
		parentTableView.dataSource = self
		parentTableView.separatorStyle = .none
		parentTableView.register(UINib(nibName: ParentListItemTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ParentListItemTableViewCell.identifier)
		getParentList()

		refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
		parentTableView.addSubview(refreshControl)
	}
	@objc func onRefresh(){
		getParentList()
	}
	func getParentList(){
		showProgress(message: "Loading...")
		ParentModel.shared().apiGetParentList(success: {
			self.parentList = ParentModel.shared().parentResponse
			self.parentTableView.reloadData()
			self.hideProgress()
			self.refreshControl.endRefreshing()
		}) { (err) in
			print("error \(err)")
			self.hideProgress()
			self.refreshControl.endRefreshing()
		}
	}

}
	
extension ViewController : UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return parentList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: ParentListItemTableViewCell.identifier, for: indexPath) as! ParentListItemTableViewCell
		cell.parent = self.parentList[indexPath.row]
		
		return cell
	}
	
	
}
extension ViewController : UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if let childItemCount = self.parentList[indexPath.row].childs?.count {
			return  CGFloat(52 + (108 * childItemCount))

		}else {
			return 52
		}
	}
}

