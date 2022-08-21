//
//  AgedBrie.swift
//  
//
//  Created by Frank Thamel on 2022-08-19.
//

import Foundation

class AgedBrie: Item {
    
    /**
     Override `updateQuality` to provide  the correct implementation for the `AgedBrie` type.
     */
    override func updateQuality() {
        
        // Lowers sellIn value by 1 each day
        sellIn -= 1
        
        // Maximum quality for an item is 50
        guard quality < 50 else { return }
        
        // "Aged Brie" increases in Quality the older it gets
        quality += 1
        
        // Maximum quality for an item is 50
        guard quality < 50 else { return }
        
        // Quality increases twice as fast when passed SellIn date
        guard sellIn < 0 else { return }
        
        quality += 1
        
    }
}
