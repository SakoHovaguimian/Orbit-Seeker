//
//  PlanetSelectorViewController.swift
//  Orbit Seeker
//
//  Created by Sako Hovaguimian on 9/16/18.
//  Copyright © 2018 Sako Hovaguimian. All rights reserved.
//

import UIKit

class PlanetSelectorViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var planets = ["Moon", "Jupiter", "Mars", "Mercury", "Venus", "Neptune", "Saturn", "Stars",
                   "Sun", "Earth Day", "Earth Night"]
    var planetToPass: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        
    }
    
    func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
}

extension PlanetSelectorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PlanetCell {
            cell.configureCell(planet: planets[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        planetToPass = planets[indexPath.row]
        performSegue(withIdentifier: "toPlanet", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let planetVC = segue.destination as? PlanetViewerViewController {
            planetVC.planetName = planetToPass
        }
    }
    
}
