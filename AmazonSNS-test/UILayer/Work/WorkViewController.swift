//
//  WorkViewController.swift
//  AmazonSNS-test
//
//  Created by Diego Graciano on 11/04/20.
//  Copyright © 2020 Diego Graciano. All rights reserved.
//

import UIKit

class WorkViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var selectedCategory : String = ""
    let categories = ["Construcción", "Mantenimiento", "Administrativo", "Computación", "Ventas", "Servicio al Cliente", "Salud", "Inmobiliaria", "Trabajo por internet", "Hostelería y turismo", "Educación", "Marketing", "Medios gráficos", "Recursos Humanos"]
    @IBOutlet weak var appliancesView: UIView!
    @IBOutlet weak var cvView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shadow(view: appliancesView)
        shadow(view: cvView)
        navigationController?.title = "Trabajo"
    }
    
    

    func shadow(view: UIView) {
        self.view.layer.cornerRadius = 2
        self.view.layer.shadowRadius = 2
        if #available(iOS 13.0, *) {
            self.view.layer.shadowColor = UIColor.systemGray2.cgColor
            self.view.layer.shadowOpacity = 1.0
        } else {
            self.view.layer.shadowColor = UIColor.black.cgColor
            self.view.layer.shadowOpacity = 0.4
        }

        self.view.layer.shadowOffset = .zero
    }
    
    // ***************************
    // MARK: Table View
    // ***************************
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workCategoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.selectedCategory = categories[indexPath.row]
        self.performSegue(withIdentifier: "categoriesToDetail", sender: self)
    }
    
    // ***************************
    // MARK: Buttons
    // ***************************

    @IBAction func showAppliances(_ sender: UIButton) {
        let appliancesVC = storyboard?.instantiateViewController(withIdentifier: "AppliancesViewController") as! AppliancesViewController
        self.present(appliancesVC, animated: true, completion: nil)
    }
    
    // ***************************
    // MARK: Prepare for segue
    // ***************************
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "categoriesToDetail" {
            if let destination = segue.destination as? JobDetailsViewController {
                destination.categoryDetail = selectedCategory

            }
        }
    }
    
}
