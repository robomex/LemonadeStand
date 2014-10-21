//
//  Factory.swift
//  LemonadeStand
//
//  Created by Tony Morales on 10/21/14.
//  Copyright (c) 2014 Tony Morales. All rights reserved.
//

import Foundation

class Factory {
    class func createCustomers () -> [Float] {
        
        let kNumberOfCustomers = Int(arc4random_uniform(UInt32(10)))
        var customers: [Float] = []
        
        for var customerNumber = 0; customerNumber <= kNumberOfCustomers; customerNumber++ {
            var preference: Float
            preference = Float(arc4random_uniform(UInt32(10))) / 10
            customers.append(preference)
        }
        
        return customers
    }
}