//
//  QRViewController.swift
//  AmazonSNS-test
//
//  Created by Diego Graciano on 13/04/20.
//  Copyright © 2020 Diego Graciano. All rights reserved.
//

import UIKit

class QRViewController: UIViewController {

    let delegate = UIApplication.shared.delegate as! AppDelegate
    var enabled: Bool = false
    var bussinessName: String = ""
    var businessReg: String = ""
    var qrInfo: String = ""
    var destinationARN: String = ""
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var qrImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = generateQRCode(from: "Sorry the read QR Code wasn`t enabled, please enable the QR code before reading it")
        qrImageView.image = image
        qrImageView.alpha = 0.5
        mySwitch.isOn = false
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGreen.cgColor
        destinationARN = AppDelegate().endpointARN
        qrInfo = "" + " @ " + ""
       
    }
    
    func setupQRInfo(title: String, reg: String, destinationArn: String){
        destinationARN = destinationArn
        bussinessName = title
        businessReg = reg
        qrInfo = title + " @ " + reg + " % " + delegate.endpointARN
    }
    
    @IBAction func enableSwitch(_ sender: UISwitch) {
        if enabled == true {
            mySwitch.isOn = false
            enabled = false
            let unabledImage = generateQRCode(from: "Sorry the read QR Code wasn`t enabled, please enable the QR code before reading it")
            qrImageView.image = unabledImage
            qrImageView.alpha = 0.5
        } else if enabled == false {
            mySwitch.isOn = true
            enabled = true
            let unabledImage = generateQRCode(from: String(qrInfo))
            qrImageView.image = unabledImage
            qrImageView.alpha = 1.0
        }
    }
    
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 5, y: 5)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }
    

    
    @IBAction func dissmissBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
