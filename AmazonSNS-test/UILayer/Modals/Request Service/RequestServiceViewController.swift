//
//  RequestServiceViewController.swift
//  AmazonSNS-test
//
//  Created by Diego Graciano on 15/04/20.
//  Copyright © 2020 Diego Graciano. All rights reserved.
//

import UIKit

class RequestServiceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var passedContractorPic: UIImage?
    var passedContractorName: String = ""
    var parametros : [String] = ["Incluye traslado", "Inlcuye materiales", "Precio Base", "Disponible suscripción", "Calificación"]
    var valoresParamteros : [String] = ["Si", "No", "$300", "Si", "5.0"]
    
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contractorPic: UIImageView!
    @IBOutlet weak var contractorName: UILabel!
    @IBOutlet weak var suscriptionButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.backgroundColor = UIColor.systemBackground
        shadow(view: suscriptionButton)
        shadow(view: contentView)
        contractorName.text = passedContractorName
        contractorPic.image = passedContractorPic
        makeRounded()
    }
    
    @IBAction func dismissView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func makeRounded() {
        contractorPic.layer.masksToBounds = false
        contractorPic.layer.cornerRadius = contractorPic.frame.height/2
        contractorPic.clipsToBounds = true
    }
    
    func shadow(view: UIView) {
        view.layer.cornerRadius = 12
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
    // MARK: Table View
    // ***************************
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parametros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "serviceDetailCell", for: indexPath)
        cell.textLabel?.text = parametros[indexPath.row]
        cell.detailTextLabel?.text = valoresParamteros[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func dismiss(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
