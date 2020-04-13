//
//  ServicesViewController.swift
//  AmazonSNS-test
//
//  Created by Diego Graciano on 11/04/20.
//  Copyright © 2020 Diego Graciano. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController {
    
    var selectedService: String = ""

    @IBOutlet weak var service1: Service!
    @IBOutlet weak var service2: Service!
    @IBOutlet weak var service3: Service!
    @IBOutlet weak var service4: Service!
    @IBOutlet weak var service5: Service!
    @IBOutlet weak var service6: Service!
    @IBOutlet weak var service7: Service!
    @IBOutlet weak var service8: Service!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupServices()
        addTargets()
    }
    
    func addTargets() {
        self.service1.button.addTarget(self, action: #selector(serviceDetail(sender:)), for: .touchUpInside)
        self.service1.button.tag = 1
        self.service2.button.addTarget(self, action: #selector(serviceDetail(sender:)), for: .touchUpInside)
        self.service2.button.tag = 2
        self.service3.button.addTarget(self, action: #selector(serviceDetail(sender:)), for: .touchUpInside)
        self.service3.button.tag = 3
        self.service4.button.addTarget(self, action: #selector(serviceDetail(sender:)), for: .touchUpInside)
        self.service4.button.tag = 4
        self.service5.button.addTarget(self, action: #selector(serviceDetail(sender:)), for: .touchUpInside)
        self.service5.button.tag = 5
        self.service6.button.addTarget(self, action: #selector(serviceDetail(sender:)), for: .touchUpInside)
        self.service6.button.tag = 6
        self.service7.button.addTarget(self, action: #selector(serviceDetail(sender:)), for: .touchUpInside)
        self.service7.button.tag = 7
        self.service8.button.addTarget(self, action: #selector(serviceDetail(sender:)), for: .touchUpInside)
        self.service8.button.tag = 8
    }
    
    func setupServices() {
        service1.categoria.text = "Mecánico"
        service1.serviceImg.image = #imageLiteral(resourceName: "baseline_build_black_48dp.png")
        service1.serviceImg.tintColor = UIColor.systemGreen
        service2.categoria.text = "Plomero"
        service2.serviceImg.image = #imageLiteral(resourceName: "baseline_invert_colors_black_48dp.png")
        service2.serviceImg.tintColor = UIColor.systemGreen
        service3.categoria.text = "Electricista"
        service3.serviceImg.image = #imageLiteral(resourceName: "baseline_flash_on_black_48dp.png")
        service3.serviceImg.tintColor = UIColor.systemGreen
        service4.categoria.text = "Constructor"
        service4.serviceImg.image = #imageLiteral(resourceName: "baseline_home_work_black_48dp.png")
        service4.serviceImg.tintColor = UIColor.systemGreen
        service5.categoria.text = "Mensajero"
        service5.serviceImg.image = #imageLiteral(resourceName: "baseline_email_black_48dp.png")
        service5.serviceImg.tintColor = UIColor.systemGreen
        service6.categoria.text = "Instalador"
        service6.serviceImg.image = #imageLiteral(resourceName: "baseline_add_to_queue_black_48dp.png")
        service6.serviceImg.tintColor = UIColor.systemGreen
        service7.categoria.text = "Fontanero"
        service7.serviceImg.image = #imageLiteral(resourceName: "baseline_settings_input_hdmi_black_48dp.png")
        service7.serviceImg.tintColor = UIColor.systemGreen
        service8.categoria.text = "Soldador"
        service8.serviceImg.image = #imageLiteral(resourceName: "baseline_polymer_black_48dp.png")
        service8.serviceImg.tintColor = UIColor.systemGreen
    }
    
    @objc func serviceDetail(sender: UIButton!) {
        switch sender.tag {
        case 1:
            selectedService = "Mecánico"
            performSegue(withIdentifier: "servicesDetail", sender: self)
        case 2:
            selectedService = "Plomero"
            performSegue(withIdentifier: "servicesDetail", sender: self)
        case 3:
            selectedService = "Electricista"
            performSegue(withIdentifier: "servicesDetail", sender: self)
        case 4:
            selectedService = "Constructor"
            performSegue(withIdentifier: "servicesDetail", sender: self)
        case 5:
            selectedService = "Mensajero"
            performSegue(withIdentifier: "servicesDetail", sender: self)
        case 6:
            selectedService = "Instalador"
            performSegue(withIdentifier: "servicesDetail", sender: self)
        case 7:
            selectedService = "Fontanero"
            performSegue(withIdentifier: "servicesDetail", sender: self)
        case 8:
            selectedService = "Soldador"
            performSegue(withIdentifier: "servicesDetail", sender: self)
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "servicesDetail" {
            if let destination = segue.destination as? ServiceDetailViewController {
                destination.serviceTitle = selectedService

            }
        }
    }
    

}
