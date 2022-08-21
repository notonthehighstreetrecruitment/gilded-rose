//
//  File.swift
//  
//
//  Created by Frank Thamel on 2022-08-19.
//

import Foundation

extension Item {
    
    /**
     Default `updateQuality` implementation for item types that are not listed and sub classed
    */
    @objc func updateQuality() {
        
        // Lowers sellIn value by 1 each day
        sellIn -= 1
        
        guard quality > 0 else { return }
        
        // Degrades quality by 1
        quality = quality - 1
        
        // Degrades quality by 1 only if sellIn day passed
        if sellIn < 0 {
            quality -= 1
        }
        
        // The Quality of an item is never negative
        if quality < 0 {
            quality = 0
        }
        
    }
}
