import Foundation
import XCTest
import ApprovalTests_Swift

@testable import GildedRose

class GildedRoseTests: XCTestCase {
    
    func testGildedRose_updateQuality() throws {
        
        let names = [
            "foo", // To represent other item types
            "Aged Brie",
            "Backstage passes to a TAFKAL80ETC concert",
            "Sulfuras, Hand of Ragnaros"
        ]
        
        let sellIn = [-1, 0, 2, 6, 11]
        let quality = [0, 10, 49, 50]
        
        try CombinationApprovals.verifyAllCombinations(
            updateQualityHelper,
            names,
            sellIn,
            quality
        )
    }
    
    func testConjuredItem_updateQuality_forPositiveSellIn() {
        let name = ItemType.conjured.name
        let sellIn = 2
        let quality = 10
        
        let expectedQualityAfterDegrade = quality - 2
        
        let itemQuality = updateItemQualityHelper(name: name,
                                              sellIn: sellIn,
                                              quality: quality)
        
        XCTAssertEqual(itemQuality, expectedQualityAfterDegrade)
    }
    
    func testConjuredItem_updateQuality_forZeroSellIn() {
        let name = ItemType.conjured.name
        let sellIn = 0
        let quality = 10
        
        let expectedQualityAfterDegrade = quality - 4
        
        let itemQuality = updateItemQualityHelper(name: name,
                                              sellIn: sellIn,
                                              quality: quality)
        
        XCTAssertEqual(itemQuality, expectedQualityAfterDegrade)
    }
    
    func testConjuredItem_updateQuality_forNegativeSellIn() {
        let name = ItemType.conjured.name
        let sellIn = -1
        let quality = 10
        
        let expectedQualityAfterDegrade = quality - 4
        
        let itemQuality = updateItemQualityHelper(name: name,
                                              sellIn: sellIn,
                                              quality: quality)
        
        XCTAssertEqual(itemQuality, expectedQualityAfterDegrade)
    }
    
    func testConjuredItem_forNegativeQualityValues_forNegativeSellIn() {
        let name = ItemType.conjured.name
        let sellIn = -1
        let quality = 1
        
        let expectedQualityAfterDegrade = 0
        
        let itemQuality = updateItemQualityHelper(name: name,
                                              sellIn: sellIn,
                                              quality: quality)
        
        XCTAssertEqual(itemQuality, expectedQualityAfterDegrade)
    }
    
    func testGildedRose_conjuredItem_updateQuality() throws {
        
        let names = [
            "Conjured Mana Cake"
        ]
        
        let sellIn = [-1, 0, 2]
        let quality = [0, 1, 2, 3, 4, 50]
        
        try CombinationApprovals.verifyAllCombinations(
            updateQualityHelper,
            names,
            sellIn,
            quality
        )
    }
    
    private func updateQualityHelper(name: String, sellIn: Int, quality: Int) -> String {
        let items = [Item(name: name, sellIn: sellIn, quality: quality)]
        let app = GildedRose(items: items);
        app.updateQuality();
        
        return app.items[0].description
    }
    
    private func updateItemQualityHelper(name: String, sellIn: Int, quality: Int) -> Int {
        let items = [Item(name: name, sellIn: sellIn, quality: quality)]
        let app = GildedRose(items: items);
        app.updateQuality();
        
        return app.items[0].quality
    }
    
}
