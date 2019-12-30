//
//  PlanetViewController.swift
//  Planets
//
//  Created by Consultant on 12/26/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import UIKit

class PlanetViewController: UIViewController {
    
    var viewModel: ViewModel!
    
    @IBOutlet weak var planetName: UITextField!
    
    @IBOutlet weak var planetMoons: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func returnHome() {
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        present(homeVC, animated: true, completion: nil)
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        if (planetName.text != "" && planetMoons.text != "" && Int(planetMoons.text!) != nil && Int(planetMoons.text!)! > -1) {
        let planet = Planet(name: planetName.text!, moons: Int64(planetMoons.text!)!)
        CoreManager.shared.save(planet)
        returnHome()
        } else {
            let alert = UIAlertController(title: "", message: "Please enter correct values into both fields", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        returnHome()
    }
}
