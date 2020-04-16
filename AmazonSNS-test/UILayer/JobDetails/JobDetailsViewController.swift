//
//  JobDetailsViewController.swift
//  AmazonSNS-test
//
//  Created by Diego Graciano on 12/04/20.
//  Copyright © 2020 Diego Graciano. All rights reserved.
//

import UIKit
import AWSSNS

class JobDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let SNSPlatformApplicationArn = "arn:aws:sns:us-east-1:963459549399:app/APNS_SANDBOX/Amazon_SNS_Test_App"
    var jobs : [String] = []
    var locations : [String] = []
    var categoryDetail : String = ""
    @IBOutlet weak var jobsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.jobsTableView.rowHeight = 80.0
        navigationItem.title = categoryDetail
        generateJobs()
        
    }
    
    func generateJobs() {
        for i in 1...15 {
            let jobNumber = String(i)
            jobs.append("Trabajo" + " \(jobNumber)")
            locations.append("Ubicación" + " \(jobNumber)")
        }
    }
    
    // ***************************
    // MARK: Table View
    // ***************************

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell", for: indexPath) as! JobDetailTableViewCell
        cell.jobTitle.text = jobs[indexPath.row]
        cell.locationTitle.text = locations[indexPath.row]
        return cell
    }
    
    // ***************************
    // MARK: Alert View
    // ***************************

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var randomDouble = Double.random(in: 0000000...9999999)
        randomDouble = round(randomDouble)
        let alertView = UIAlertController(title: "Aplicación rápida", message: "¿Desea aplicar a este trabajo?, si desea hacerlo por favor escriba su número celular de contacto (10 dígitos)", preferredStyle: .alert)
        alertView.addTextField { (UITextField) in
            UITextField.keyboardType = .phonePad
        }
        alertView.addAction(UIAlertAction(title: "Aplicar", style: .default, handler: {(_: UIAlertAction!) in
            //self.sendConfirmationSMS(phoneNumber: alertView.textFields![0].text!)
            self.sendSMS(phoneNumber: alertView.textFields![0].text!, msg: "Éxito, ha aplicado correctamente al empleo \(self.jobs[indexPath.row]) ubicado en: \(self.locations[indexPath.row]) su número de folio para cualquier seguimiento es: \(randomDouble).")
        }))
        alertView.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        self.present(alertView, animated: true, completion: nil)
    }
    
    // ***************************
    // MARK: SMS Send Request
    // ***************************
    
    func sendSMS(phoneNumber: String, msg: String) {
        /// Attach the device token to the user defaults
        var token = AppDelegate().globalToken
        UserDefaults.standard.set(token, forKey: "deviceTokenForSNS")

        /// Create a platform endpoint. In this case,  the endpoint is a
        /// device endpoint ARN
        let sns = AWSSNS.default()
        let request = AWSSNSPublishInput()
        request?.message = msg
        request?.phoneNumber = "+521" + phoneNumber
        sns.publish(request!, completionHandler: nil)
        }
    
}
