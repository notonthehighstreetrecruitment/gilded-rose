import Foundation
import XCTest
import ApprovalTests_Swift

@testable import GildedRose

class GildedRoseTests: XCTestCase {

    func testGildedRose_updateQuality() throws {
        let items = [Item(name: "Aged Brie", sellIn: 2, quality: 0)]
        let app = GildedRose(items: items);
        app.updateQuality();
        
        try Approvals.verify(app.items[0].description)
    }
}
