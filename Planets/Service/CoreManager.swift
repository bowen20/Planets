//
//  CoreManager.swift
//  Planets
//
//  Created by Consultant on 12/27/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import CoreData

final class CoreManager {
    
    static let shared = CoreManager()
    private init() {}
    
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Planets")
        
        container.loadPersistentStores { (storeDescrip, err) in
            if let error = err {
                fatalError(error.localizedDescription)
            }
        }
        
        return container
    }()
    
    func save(_ planet: Planet) {
        if (planet.numberOfMoons >= 0) {
        let entity = NSEntityDescription.entity(forEntityName: "CorePlanet", in: context)!
        let corePlanet = CorePlanet(entity: entity, insertInto: context)
        corePlanet.name = planet.name
        corePlanet.moons = planet.numberOfMoons
        saveContext()
        }
    }
    
    //MARK: Load
    
    func load() -> [Planet] {
        let fetch = NSFetchRequest<CorePlanet>(entityName: "CorePlanet")
        var planets = [Planet]()
        
        do {
            let corePlanets = try context.fetch(fetch)
            for core in corePlanets {
                let planet = Planet(core)
                planets.append(planet)
            }
        } catch {
            print("Couldn't Fetch Planets: \(error.localizedDescription)")
        }
        
        return planets
    }
    
    //MARK: Helper
    func saveContext() {
        do {
            try context.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    
}
