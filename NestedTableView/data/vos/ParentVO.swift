//
//  ParentVO.swift
//  NestedTableView
//
//  Created by AcePlus Admin on 9/15/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import Foundation

struct ParentVO :Codable {
	var id : Int?
	var parentName : String?
	var childs : [ChildVO]?
}
