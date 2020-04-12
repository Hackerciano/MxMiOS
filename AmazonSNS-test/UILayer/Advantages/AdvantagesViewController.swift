//
//  AdvantagesViewController.swift
//  AmazonSNS-test
//
//  Created by Diego Graciano on 11/04/20.
//  Copyright © 2020 Diego Graciano. All rights reserved.
//

import UIKit

class AdvantagesViewController: UIViewController {
    
    @IBOutlet weak var buttonView1: UIView!
    @IBOutlet weak var buttonView2: UIView!
    @IBOutlet weak var buttonView3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shadow(view: buttonView1)
        shadow(view: buttonView2)
        shadow(view: buttonView3)
    }
    
    func shadow(view: UIView) {
        view.layer.cornerRadius = 15
        view.layer.shadowRadius = 6
        if #available(iOS 13.0, *) {
            view.layer.shadowColor = UIColor.systemGray2.cgColor
            view.layer.shadowOpacity = 1.0
        } else {
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.4
        }
        
        view.layer.shadowOffset = .zero
    }
    



}
