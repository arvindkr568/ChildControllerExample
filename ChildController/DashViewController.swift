//
//  DashViewController.swift
//  ChildController
//
//  Created by Arvind on 16/12/20.
//

import UIKit

protocol DashViewControllerDelegate {
    func dismissViewController(viewController: UIViewController)
}


class DashViewController: UIViewController {

    var dashViewControllerDelegate: DashViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addViewClicked(_ sender: Any) {
        dashViewControllerDelegate?.dismissViewController(viewController: self)
    }

}

