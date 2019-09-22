//
//  ParentModel.swift
//  NestedTableView
//
//  Created by AcePlus Admin on 9/22/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import Foundation
class ParentModel {
	
	class func shared() ->  ParentModel {
		return sharedParentModel
	}
	private static var sharedParentModel :  ParentModel = {
		let parentModel = ParentModel()
		return parentModel
	}()
	
	
	var parentResponse: [ParentVO] = [ParentVO]()

	func apiGetParentList(success : @escaping () -> Void , failure : @escaping(String) -> Void) {
		NetworkClient.shared().getData(success: { (data) in
			guard let data = data as? Data else {return}
			do {
				let decoder = JSONDecoder()
				decoder.keyDecodingStrategy = .convertFromSnakeCase
				self.parentResponse = try decoder.decode([ParentVO].self, from: data)
				success()
				
			}catch let jsonErr {
				failure(jsonErr.localizedDescription)
			}
		}) { (err) in
			failure(err)
		}
	}
}
