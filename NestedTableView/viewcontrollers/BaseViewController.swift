//
//  BaseViewController.swift
//  NestedTableView
//
//  Created by AcePlus Admin on 9/22/19.
//  Copyright © 2019 SLH. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
extension BaseViewController : NVActivityIndicatorViewable {
	func showProgress(message:String){
		startAnimating(CGSize(width: 40, height: 40), message: message, type: NVActivityIndicatorType.ballClipRotate)
	}
	func hideProgress(){
		stopAnimating()
	}
}
