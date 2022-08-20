//
//  BackstagePass.swift
//  
//
//  Created by Frank Thamel on 2022-08-19.
//

import Foundation

class BackstagePass: Item {
    override func updateQuality() {
        
        // Maximum quality for an item is 50
        // Increases in Quality as its SellIn value approaches
        if quality < 50 {
            quality += 1
        }
        
        // Maximum quality for an item is 50
        // Quality increases by 2 when there are 10 days or less
        if sellIn < 11 && quality < 50 {
            quality += 1
        }
        
        // Maximum quality for an item is 50
        // Quality increases by 3 when there are 5 days or less
        if sellIn < 6 && quality < 50 {
            quality += 1
        }
        
        // Lowers sellIn value by 1 each day
        sellIn -= 1
        
        // Quality drops to 0 after the concert
        if sellIn < 0 {
            quality = 0
        }
    
    }
}
