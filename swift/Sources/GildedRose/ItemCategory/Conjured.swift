//
//  Conjured.swift
//  
//
//  Created by Frank Thamel on 2022-08-19.
//

import Foundation

class Conjured: Item {
    override func updateQuality() {
        
        // Lowers sellIn value by 1 each day
        sellIn -= 1
        
        guard quality > 0 else { return }
        
        // Degrades quality by 2
        quality -= 2
        
        // Degrades quality by 2 only if sellIn day passed
        if sellIn < 0 {
            quality -= 2
        }
        
        // The Quality of an item is never negative
        if quality < 0 {
            quality = 0
        }
        
    }
}
