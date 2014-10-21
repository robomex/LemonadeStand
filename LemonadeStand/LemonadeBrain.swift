//
//  LemonadeBrain.swift
//  LemonadeStand
//
//  Created by Tony Morales on 10/21/14.
//  Copyright (c) 2014 Tony Morales. All rights reserved.
//

import Foundation

class LemonadeBrain {
    class func determineSales (customers: [Float], mix: Float) -> Int {
        var sales = 0
        
        for var index = 0; index < customers.count; index++ {
            if customers[index] <= 0.4 && mix <= 0.4 {
                sales += 1
            } else if customers[index] <= 0.6 && customers[index] > 0.4 && mix <= 0.6 && mix > 0.4 {
                sales += 1
            } else if customers[index] > 0.6 && mix > 0.6 {
                sales += 1
            }
        }
        return sales
    }
}