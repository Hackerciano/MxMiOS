//
//  Widget6.swift
//  AmazonSNS-test
//
//  Created by Diego Graciano on 12/04/20.
//  Copyright © 2020 Diego Graciano. All rights reserved.
//

import UIKit

class Widget6: UIView {
    
    @IBOutlet var contentView: UIView!
    
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
        Bundle.main.loadNibNamed("Widget6", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
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

}
