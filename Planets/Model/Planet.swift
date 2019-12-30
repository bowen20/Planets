//
//  Planet.swift
//  Planets
//
//  Created by Consultant on 12/25/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

class Planet {
    var name: String
    var numberOfMoons: Int64
    
    init(name: String, moons: Int64) {
        self.name = name
        self.numberOfMoons = moons
    }

    init(_ core: CorePlanet) {
        self.name = core.name!
        self.numberOfMoons = core.moons
    }
    
}
