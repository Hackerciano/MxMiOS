//
//  Widget2.swift
//  AmazonSNS-test
//
//  Created by Diego Graciano on 12/04/20.
//  Copyright © 2020 Diego Graciano. All rights reserved.
//

import UIKit

class Widget2: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var qrView: UIImageView!
    override init(frame: CGRect) { //For using CustomView in Code
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { //For using CustomView in IB
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        // Erase this and do your stuff here
        Bundle.main.loadNibNamed("Widget2", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        let qrImage = generateQRCode(from: "https://mxm-web.com.mx")
        qrView.image = qrImage
        shadow()
    }
    
    func shadow() {
        self.contentView.layer.cornerRadius = 15
        self.contentView.layer.shadowRadius = 6
        if #available(iOS 13.0, *) {
            self.contentView.layer.shadowColor = UIColor.systemGray2.cgColor
            self.contentView.layer.shadowOpacity = 1.0
        } else {
            self.contentView.layer.shadowColor = UIColor.black.cgColor
            self.contentView.layer.shadowOpacity = 0.4
        }
        
        self.contentView.layer.shadowOffset = .zero
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

    @IBAction func goToWeb(_ sender: UIButton) {
        guard let url = URL(string: "https://mxm-web.com.mx") else { return }
        UIApplication.shared.open(url)
    }
}
