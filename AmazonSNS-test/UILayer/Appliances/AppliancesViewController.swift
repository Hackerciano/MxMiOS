//
//  AppliancesViewController.swift
//  AmazonSNS-test
//
//  Created by Diego Graciano on 12/04/20.
//  Copyright © 2020 Diego Graciano. All rights reserved.
//

import UIKit

class AppliancesViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.green.cgColor
    }
    

    @IBAction func closeModal(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
