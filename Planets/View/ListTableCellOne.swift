//
//  ListTableCellOne.swift
//  Planets
//
//  Created by Consultant on 12/25/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ListTableCellOne: UITableViewCell {

    @IBOutlet weak var planetName: UILabel!
    
    @IBOutlet weak var planetMoons: UILabel!
    
    static let identifier = "ListTableCellOne"

    var planet: Planet! {
        didSet {
            planetName.text = planet.name
            planetMoons.text = String(planet.numberOfMoons)
        }
    }
}
