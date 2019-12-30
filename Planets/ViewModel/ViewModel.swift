//
//  ViewModel.swift
//  Planets
//
//  Created by Consultant on 12/26/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import CoreData

protocol ViewModelDelegate: class {
    func update()
}

class ViewModel {
    
    weak var delegate: ViewModelDelegate?
    
    var filtered = 0
    
    var planets = [Planet]() {
        didSet {
            delegate?.update()
        }
    }
    
    init() {
        let Mercury = Planet(name: "Mercury", moons: 0)
        let Venus = Planet(name: "Venus", moons: 0)
        let Earth = Planet(name: "Earth", moons: 1)
        let Mars = Planet(name: "Mars", moons: 2)
        let Jupiter = Planet(name: "Jupiter", moons: 67)
        let Neptune = Planet(name: "Neptune", moons: 13)
        planets.append(Mercury)
        planets.append(Venus)
        planets.append(Earth)
        planets.append(Mars)
        planets.append(Jupiter)
        planets.append(Neptune)
        filter()
    }
    
    public func filter() {
        for planet in planets {
            if planet.numberOfMoons < 3 {
                filtered += 1
            }
        }
        let addPlanets = CoreManager.shared.load()
        for planet in addPlanets {
            planets.append(planet)
            filtered += 1
        }
    }
 
    
}
