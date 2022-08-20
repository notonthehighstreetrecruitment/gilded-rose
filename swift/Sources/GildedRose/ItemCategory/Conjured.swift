//
//  Conjured.swift
//  
//
//  Created by Frank Thamel on 2022-08-19.
//

import Foundation

class Conjured: Item {
    override func updateQuality() {
        degradeQuality()
        sellIn = sellIn - 1
    
        guard sellIn < 0 else { return }
        
        degradeQuality()
    }
    
    private func degradeQuality() {
        guard quality > 1 else {
            quality = 0
            return
        }
 
        quality = quality - 2
    }
}
