//
//  SubscriptionViewController.swift
//  AmazonSNS-test
//
//  Created by Diego Graciano on 13/04/20.
//  Copyright © 2020 Diego Graciano. All rights reserved.
//

import UIKit
import AWSSNS

class SubscriptionViewController: UIViewController {

    var myBussinessName = AlliesViewController().bussinessName.self
    var myBussinessReg = AlliesViewController().bussinessNumber.self
    
    var readARN : String = ""
    var passedBussinessName: String = ""
    var passedBussinessReg: String = ""
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var nameOfBussiness: UILabel!
    @IBOutlet weak var regNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGreen.cgColor
        nameOfBussiness.text = passedBussinessName
        regNumber.text = passedBussinessReg
        // Do any additional setup after loading the view.
    }
    
    func setupView(title: String, reg: String, arn: String) {
        passedBussinessName = title
        passedBussinessReg = reg
        readARN = arn
    }

    @IBAction func dismissView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirm(_ sender: UIButton) {
        sendPushNotification(msg: "El negocio \(myBussinessName) con el \(myBussinessReg) ha leído su código QR 😀 cree una alianza ahora.")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // ***************************
    // MARK: Push Send Request
    // ***************************
    
    func sendPushNotification(msg: String) {
        /// Attach the device token to the user defaults
        var token = AppDelegate().globalToken
        UserDefaults.standard.set(token, forKey: "deviceTokenForSNS")

        /// Create a platform endpoint. In this case,  the endpoint is a
        /// device endpoint ARN
        let sns = AWSSNS.default()
        let request = AWSSNSPublishInput()
        request?.message = msg
        request?.targetArn = readARN
        print("THE TARGET ARN IS :: " + readARN)
        sns.publish(request!, completionHandler: nil)
        }
}
