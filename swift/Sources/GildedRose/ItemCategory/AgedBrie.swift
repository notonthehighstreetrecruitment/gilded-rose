//
//  AgedBrie.swift
//  
//
//  Created by Frank Thamel on 2022-08-19.
//

import Foundation

class AgedBrie: Item {
    override func updateQuality() {
        if (quality < 50) {
            quality = quality + 1
        }
        
        sellIn = sellIn - 1
        
        if (sellIn < 0) && (quality < 50) {
            quality = quality + 1
        }
    }
}
