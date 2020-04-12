//
//  ServicesViewController.swift
//  AmazonSNS-test
//
//  Created by Diego Graciano on 11/04/20.
//  Copyright © 2020 Diego Graciano. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController {

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
        // Do any additional setup after loading the view.
    }
    
    func setupServices() {
        service1.categoria.text = "Mecánico"
        service1.serviceImg.image = #imageLiteral(resourceName: "baseline_build_black_48dp.png")
        service1.serviceImg.tintColor = UIColor.green
        service2.categoria.text = "Plomero"
        service2.serviceImg.image = #imageLiteral(resourceName: "baseline_invert_colors_black_48dp.png")
        service2.serviceImg.tintColor = UIColor.green
        service3.categoria.text = "Electricista"
        service3.serviceImg.image = #imageLiteral(resourceName: "baseline_flash_on_black_48dp.png")
        service3.serviceImg.tintColor = UIColor.green
        service4.categoria.text = "Constructor"
        service4.serviceImg.image = #imageLiteral(resourceName: "baseline_home_work_black_48dp.png")
        service4.serviceImg.tintColor = UIColor.green
        service5.categoria.text = "Mensajero"
        service5.serviceImg.image = #imageLiteral(resourceName: "baseline_email_black_48dp.png")
        service5.serviceImg.tintColor = UIColor.green
        service6.categoria.text = "Instalador"
        service6.serviceImg.image = #imageLiteral(resourceName: "baseline_add_to_queue_black_48dp.png")
        service6.serviceImg.tintColor = UIColor.green
        service7.categoria.text = "Fontanero"
        service7.serviceImg.image = #imageLiteral(resourceName: "baseline_settings_input_hdmi_black_48dp.png")
        service7.serviceImg.tintColor = UIColor.green
        service8.categoria.text = "Soldador"
        service8.serviceImg.image = #imageLiteral(resourceName: "baseline_polymer_black_48dp.png")
        service8.serviceImg.tintColor = UIColor.green
    }
    

}
