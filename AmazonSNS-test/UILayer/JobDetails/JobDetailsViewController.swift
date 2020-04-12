//
//  JobDetailsViewController.swift
//  AmazonSNS-test
//
//  Created by Diego Graciano on 12/04/20.
//  Copyright © 2020 Diego Graciano. All rights reserved.
//

import UIKit

class JobDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alertView = UIAlertController(title: "Aplicación rápida", message: "¿Desea aplicar a este trabajo?", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Sí", style: .default, handler: nil))
        alertView.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alertView, animated: true, completion: nil)
    }

}
