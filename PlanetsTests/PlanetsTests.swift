//
//  PlanetsTests.swift
//  PlanetsTests
//
//  Created by Consultant on 12/28/19.
//  Copyright © 2019 mac. All rights reserved.
//

import XCTest
@testable import Planets

class PlanetsTests: XCTestCase {

    var viewModel: ViewModel!
    
    override func setUp() {
        viewModel = ViewModel()
    }

    override func tearDown() {
        viewModel = nil
    }

    func testPlanets() {
        let planets = viewModel.planets
        XCTAssert(planets[0].name == "Mercury")
        XCTAssert(planets[0].numberOfMoons == 0)
        XCTAssert(planets[1].name == "Venus")
        XCTAssert(planets[1].numberOfMoons == 0)
        XCTAssert(planets[2].name == "Earth")
        XCTAssert(planets[2].numberOfMoons == 1)
        XCTAssert(planets[3].name == "Mars")
        XCTAssert(planets[3].numberOfMoons == 2)
        XCTAssert(planets[4].name == "Jupiter")
        XCTAssert(planets[4].numberOfMoons == 67)
        XCTAssert(planets[5].name == "Neptune")
        XCTAssert(planets[5].numberOfMoons == 13)
    }

    func testAddPlanet() {
        let Pluto = Planet(name: "Pluto", moons: 5)
        CoreManager.shared.save(Pluto)
        viewModel = ViewModel()
        let planets = viewModel.planets
        XCTAssert(planets[planets.count - 1].name == "Pluto")
        XCTAssert(planets[planets.count - 1].numberOfMoons == 5)
    }
    
    func testNegativeMoons() {
        let Test = Planet(name: "Test", moons: -1)
        CoreManager.shared.save(Test)
        viewModel = ViewModel()
        let planets = viewModel.planets
        XCTAssert(planets[planets.count - 1].name != "Test")
        XCTAssert(planets[planets.count - 1].numberOfMoons != -1)
    }

}
