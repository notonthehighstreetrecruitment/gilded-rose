//
//  ConjuredItemTests.swift
//  
//
//  Created by Frank Thamel on 2022-08-21.
//

import Foundation
import XCTest
import ApprovalTests_Swift

@testable import GildedRose

class ConjuredItemTests: XCTestCase {

    func testConjuredItem_updateQuality_forPositiveSellIn() {
        let name = ItemType.conjured.name
        let sellIn = 2
        let quality = 10
        
        let expectedQualityAfterDegrade = quality - 2
        
        let itemQuality = TestHelper.updateItemQualityHelper(name: name,
                                              sellIn: sellIn,
                                              quality: quality)
        
        XCTAssertEqual(itemQuality, expectedQualityAfterDegrade)
    }
    
    func testConjuredItem_updateQuality_forZeroSellIn() {
        let name = ItemType.conjured.name
        let sellIn = 0
        let quality = 10
        
        let expectedQualityAfterDegrade = quality - 4
        
        let itemQuality = TestHelper.updateItemQualityHelper(name: name,
                                              sellIn: sellIn,
                                              quality: quality)
        
        XCTAssertEqual(itemQuality, expectedQualityAfterDegrade)
    }
    
    func testConjuredItem_updateQuality_forNegativeSellIn() {
        let name = ItemType.conjured.name
        let sellIn = -1
        let quality = 10
        
        let expectedQualityAfterDegrade = quality - 4
        
        let itemQuality = TestHelper.updateItemQualityHelper(name: name,
                                              sellIn: sellIn,
                                              quality: quality)
        
        XCTAssertEqual(itemQuality, expectedQualityAfterDegrade)
    }
    
    func testConjuredItem_forNegativeQualityValues_forNegativeSellIn() {
        let name = ItemType.conjured.name
        let sellIn = -1
        let quality = 1
        
        let expectedQualityAfterDegrade = 0
        
        let itemQuality = TestHelper.updateItemQualityHelper(name: name,
                                              sellIn: sellIn,
                                              quality: quality)
        
        XCTAssertEqual(itemQuality, expectedQualityAfterDegrade)
    }
    
    func testConjuredItem_updateQuality() throws {
        
        let names = [
            "Conjured Mana Cake"
        ]
        
        let sellIn = [-1, 0, 2]
        let quality = [0, 1, 2, 3, 4, 50]
        
        try CombinationApprovals.verifyAllCombinations(
            TestHelper.updateQualityHelper,
            names,
            sellIn,
            quality
        )
    }
}
