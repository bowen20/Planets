//
//  HomeViewController.swift
//  Planets
//
//  Created by Consultant on 12/25/19.
//  Copyright © 2019 mac. All rights reserved.
//


import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var planetTableView: UITableView!
    
    @IBOutlet weak var addButton: UIButton!
               
    let viewModel = ViewModel()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            setup()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        }
        
        private func setup() {
            planetTableView.dataSource = self
            planetTableView.delegate = self
            planetTableView.register(UINib(nibName: ListTableCellOne.identifier, bundle: Bundle.main), forCellReuseIdentifier: ListTableCellOne.identifier)
            planetTableView.tableFooterView = UIView(frame: .zero)
        }

    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let planetVC = storyboard?.instantiateViewController(withIdentifier: "PlanetViewController") as! PlanetViewController
        planetVC.viewModel = viewModel
        present(planetVC, animated: true, completion: nil)
    }
}
    
    extension HomeViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.filtered
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: ListTableCellOne.identifier, for: indexPath) as! ListTableCellOne
            var planet: Planet
            if (indexPath.row < 4) {
            var i = indexPath.row
            var j = 0
            planet = viewModel.planets[0]
            while i > 0 {
                if planet.numberOfMoons < 3 {
                    i -= 1
                }
                j += 1
                planet = viewModel.planets[j]
            }
            } else {
                planet = viewModel.planets[indexPath.row + 2]
            }
            cell.planet = planet
            if (indexPath.row % 2 == 0) {
                cell.backgroundColor = UIColor.red
            } else {
                cell.backgroundColor = UIColor.green
            }
            return cell
        }
    }

    extension HomeViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            var planet: Planet
            if (indexPath.row < 4) {
            var i = indexPath.row
            var j = 0
            planet = viewModel.planets[0]
            while i > 0 {
                if planet.numberOfMoons < 3 {
                    i -= 1
                }
                j += 1
                planet = viewModel.planets[j]
            }
            } else {
                planet = viewModel.planets[indexPath.row + 2]
            }
            if (planet.numberOfMoons < 3) {
            let alert = UIAlertController(title: "", message: "\(planet.name) has less than 3 moons", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "", message: "\(planet.name) has more than 3 moons", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                alert.addAction(alertAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }

    extension HomeViewController: ViewModelDelegate {
        
        func update() {
            DispatchQueue.main.async {
                self.planetTableView.reloadData()
            }
        }
    }
