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
    
    private func updateQualityHelper(name: String, sellIn: Int, quality: Int) -> String {
        let items = [Item(name: name, sellIn: sellIn, quality: quality)]
        let app = GildedRose(items: items);
        app.updateQuality();
        
        return app.items[0].description
    }
}
