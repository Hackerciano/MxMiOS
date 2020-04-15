//
//  AlliesViewController.swift
//  AmazonSNS-test
//
//  Created by Diego Graciano on 11/04/20.
//  Copyright © 2020 Diego Graciano. All rights reserved.
//

import UIKit

class AlliesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, QRCodeScanned {

    var selectedBusiness: String = ""
    let bussinessName : String = "Tortas el Mares"
    let bussinessNumber: String = "Registro: NDS8W4TN23R"
    
    var avaliableBussiness = ["Florería Fleuristé", "Lonches Valle esperanza", "Botanas Guckoi", "Cafetería London", "Estética Yukon", "Abarrotes Chuy", "Pizzas Don Cheto", "Tintorería Rosita"]
    
    @IBOutlet weak var myCompany: UIView!
    @IBOutlet weak var myQR: UIView!
    @IBOutlet weak var seeQR: UIButton!
    @IBOutlet weak var bussinessTitle: UILabel!
    @IBOutlet weak var bussinessReg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bussinessTitle.text = bussinessName
        bussinessReg.text = bussinessNumber

        seeQR.layer.cornerRadius = 4
        shadow(view: myCompany)
        shadow(view: myQR)
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
    
    // ***************************
    // MARK: Did scanned QR Code
    // ***************************
    
    func didFoundScannedQRCode(code: String) {
        print("QR MODEL :: " + code)
        var firstPart = ""
        var secondPartTemp = ""
        var secondPart = ""
        var readARNEndpoint = ""
        let subscriptionVC = UIStoryboard(name: "ModalsSB", bundle: nil).instantiateViewController(withIdentifier: "subsVC") as! SubscriptionViewController

        self.present(subscriptionVC, animated: true, completion: nil)
        
        if let index = code.firstIndex(of: "@") {
            firstPart = String(code.prefix(upTo: index))
            secondPartTemp = String(code.suffix(from: index))
        }
        
        if let secondIndex = secondPartTemp.firstIndex(of: "%") {
            secondPart = String(secondPartTemp.prefix(upTo: secondIndex))
            readARNEndpoint = String(secondPartTemp.suffix(from: secondIndex))
        }
        
        for n in 1...2 {
            secondPart.removeFirst()
            readARNEndpoint.removeFirst()
        }
        subscriptionVC.setupView(title: String(firstPart), reg: String(secondPart), arn: readARNEndpoint)
    }
    
    // ***************************
    // MARK: See own QR code
    // ***************************

    @IBAction func seeQR(_ sender: UIButton) {
        let qrView = UIStoryboard(name: "ModalsSB", bundle: nil).instantiateViewController(withIdentifier: "QRViewController") as! QRViewController
        self.present(qrView, animated: true, completion: nil)
        qrView.setupQRInfo(title: bussinessName, reg: bussinessNumber, destinationArn: AppDelegate().endpointARN)
    }
    
    // ***************************
    // MARK: Table View
    // ***************************
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.avaliableBussiness.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bussinessCell", for: indexPath)
        cell.textLabel?.text = self.avaliableBussiness[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedBusiness = avaliableBussiness[indexPath.row]
        self.performSegue(withIdentifier: "businessDetails", sender: self)
    }
    
    // ***************************
    // MARK: Prepare for segue
    // ***************************
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "scanQR" {
            let vc : ScannerViewController = segue.destination as! ScannerViewController
            vc.delegate = self
        }
        
        if segue.identifier == "businessDetails" {
            if let destination = segue.destination as? AlliesBussinessViewController {
                destination.passedBussinessName = selectedBusiness
            }
        }
    }

}
