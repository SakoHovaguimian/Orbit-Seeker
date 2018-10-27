//
//  PlanetCell.swift
//  Orbit Seeker
//
//  Created by Sako Hovaguimian on 9/16/18.
//  Copyright © 2018 Sako Hovaguimian. All rights reserved.
//

import UIKit

class PlanetCell: UITableViewCell {

    @IBOutlet weak var planetImage: UIImageView!
    @IBOutlet weak var planetLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        planetImage.layer.cornerRadius = 10
    }
    
    func configureCell(planet: String) {
        planetLabel.text = planet.capitalized
        planetImage.image = UIImage(named: planet)
    }

}
