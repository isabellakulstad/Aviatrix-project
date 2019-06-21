//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    var running = false
    var author : String
    var location : String
    var data = AviatrixData()
    var distanceTravelled = 0
    var maxFuel = 5000.0
    var fuelUsed = 0.0
    var fuelRemaining = 5000.0
    var milesPerGallon = 0.4
    var fuelCost = 0.0
    var refAmt = 0.0
    
    init (authorName : String, locName : String)
    {
      author = authorName
      location = locName
      
    }
    
    func start() -> Bool {
        running = true
        return running
        }
    
    func refuel() -> Double {
        refAmt = maxFuel - fuelRemaining
    var singleCost = (maxFuel - fuelRemaining) * (data.fuelPrices[location]!)
     fuelRemaining = maxFuel
     fuelCost += singleCost
     return fuelCost
        
    }
    
    func flyTo(destination : String) {
      distanceTravelled += data.knownDistances[location]![destination]!
        fuelUsed = Double((distanceTravelled)) / milesPerGallon
        fuelRemaining = fuelRemaining - fuelUsed
       
        location = destination
        // add the value of the key flown to to your distance traveled
        
    }
    
    func distanceTo(target : String)-> Int {
        return data.knownDistances[location]![target]!
    }
    
    func knownDestinations() -> [String] {
        return ["St. Louis","Phoenix","Denver","SLC",]
    }
}
