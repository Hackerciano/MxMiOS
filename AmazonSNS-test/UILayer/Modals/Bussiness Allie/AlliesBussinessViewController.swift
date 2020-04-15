//
//  AlliesBussinessViewController.swift
//  AmazonSNS-test
//
//  Created by Diego Graciano on 15/04/20.
//  Copyright © 2020 Diego Graciano. All rights reserved.
//

import UIKit

class AlliesBussinessViewController: UIViewController {

    @IBOutlet weak var nameOfBussiness: UILabel!
    @IBOutlet weak var regLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    var passedBussinessName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGreen.cgColor
        nameOfBussiness.text = passedBussinessName
        var randomDouble = Double.random(in: 0000000...9999999)
        randomDouble = round(randomDouble)
        regLabel.text = "Registro: " + String(randomDouble)
    }
    

    @IBAction func requestAllie(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
