//
//  NetworkClient.swift
//  NestedTableView
//
//  Created by AcePlus Admin on 9/21/19.
//  Copyright © 2019 SLH. All rights reserved.
//


import Foundation
import Alamofire

class NetworkClient {
	
	private let baseURL : String
	private init(baseURL : String) {
		self.baseURL = baseURL
	}
	
	private static var sharedNetworkClient : NetworkClient = {
		let url = SharedConstants.BASE_URL
		return NetworkClient(baseURL: url)
	}()
	
	class func shared() -> NetworkClient {
		return sharedNetworkClient
	}
	
	public func getData(success : @escaping (Any) -> Void , failure: @escaping(String) -> Void) {
		
		
		Alamofire.request(baseURL).responseData { (response) in
			switch response.result {
			case .success :
				guard let data = response.result.value else {return}
				success(data)
				break
			case .failure(let err):
				failure(err.localizedDescription)
				break
			}
			
		}
	}
	
}
