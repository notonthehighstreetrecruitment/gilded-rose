
public class GildedRose {
    public var items: [Item]
    
    public required init(items: [Item]) {
        
        // Transforming items to its sub-types
        self.items = items.map(ItemFactory.makeSubItem(for:))
    }
    
    public func updateQuality() {
        for item in items {
            item.updateQuality()
        }
    }
}
