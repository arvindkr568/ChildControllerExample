//
//  RunPassView.swift
//  ChildController
//
//  Created by Arvind on 17/12/20.
//

import Foundation
import UIKit
import UIKit

class RunPassView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var faniqLavelView: UIView!
    
      override init(frame: CGRect) {
       super.init(frame: frame)
       setup()
      }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
      }
    
    func setup() {
        view = loadViewFromNib()
        view.frame = bounds
        addSubview(view)
        
        // Add our border here and every custom setup
      }
    
    func loadViewFromNib() -> UIView! {
       let bundle = Bundle(for: type(of: self))
       let nib = UINib(nibName: "RunPassView", bundle: bundle)
       let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
       return view
     }
    
    func layoutViewInController(_ viewController: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let topLayout = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: viewController, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: 0)
        let bottomLayout = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: viewController, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 0)
       
        let trailingLayout = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: viewController, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1.0, constant: 0)
        let leadingLayout = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: viewController, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1.0, constant: 0)
        viewController.addConstraint(topLayout)
        viewController.addConstraint(leadingLayout)
        viewController.addConstraint(trailingLayout)
        viewController.addConstraint(bottomLayout)
        viewController.addSubview(self)
        viewController.bringSubviewToFront(self)
    }

}
