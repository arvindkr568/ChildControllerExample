//
//  ViewController.swift
//  ChildController
//
//  Created by Arvind on 16/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnClicked: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.containerView.isHidden = true
    }

    @IBAction func addViewClicked(_ sender: Any) {
        
        setUpContainer()
    }
    
}

extension ViewController {
    func setUpContainer() {
        
        dropShadow(conatinerView: self.containerView)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller: DashViewController = storyboard.instantiateViewController(withIdentifier: "DashViewController") as! DashViewController
        controller.dashViewControllerDelegate = self
        self.addChild(viewController: controller, container: self.containerView)
        
    }
    
    func addChild(viewController: UIViewController, container: UIView) {
        
        addChild(viewController)
        container.addSubview(viewController.view)
        viewController.view.frame = self.containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
        addContainerView(container: container)

    }
    
    func addContainerView(container: UIView) {
        container.isHidden = false
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = .push
        transition.subtype = .fromTop
        container.layer.add(transition, forKey: kCATransition)
    }
    
    func remove(viewController: UIViewController, container: UIView) {
        animateAndRemove(containerView: container)
        container.isHidden = true
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
        
    }
    
    func animateAndRemove(containerView: UIView) {
       
        let transition:CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromBottom
        containerView.layer.add(transition, forKey: kCATransition)
    }
    
    func dropShadow(conatinerView: UIView) {

        conatinerView.layer.shadowColor = UIColor.black.cgColor
        conatinerView.layer.shadowOffset = CGSize.zero
        conatinerView.layer.masksToBounds = false

        conatinerView.layer.shadowOpacity = 1
        conatinerView.layer.shadowRadius = 24
        conatinerView.layer.rasterizationScale = UIScreen.main.scale
        conatinerView.layer.shouldRasterize = true
    }
}

extension ViewController: DashViewControllerDelegate {
    func dismissViewController(viewController: UIViewController) {
        remove(viewController: viewController, container: self.containerView)
    }
}
