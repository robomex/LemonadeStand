//
//  Factory.swift
//  LemonadeStand
//
//  Created by Tony Morales on 10/21/14.
//  Copyright (c) 2014 Tony Morales. All rights reserved.
//

import Foundation
import UIKit

class Factory {
    class func createCustomers () -> (customers: [Float]!, weather: Weather!) {
        
        var kNumberOfCustomers = Int(arc4random_uniform(UInt32(11)))
        var customers: [Float] = []
        var weather: Weather
        
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        switch randomNumber {
        case 0:
            weather = Weather(image: UIImage(named: "Cold"))
            kNumberOfCustomers -= 3
        case 1:
            weather = Weather(image: UIImage(named: "Mild"))
        case 2:
            weather = Weather(image: UIImage(named: "Warm"))
            kNumberOfCustomers += 4
        default:
            weather = Weather(image: UIImage(named: "Mild"))
        }
        
        if kNumberOfCustomers < 0 {
            kNumberOfCustomers = 0
        }
        
        for var customerNumber = 0; customerNumber < kNumberOfCustomers; customerNumber++ {
            var preference: Float
            preference = Float(arc4random_uniform(UInt32(10))) / 10
            customers.append(preference)
        }
        
        return (customers, weather)
    }
}