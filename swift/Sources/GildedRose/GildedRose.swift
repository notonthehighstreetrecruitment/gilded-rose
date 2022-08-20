
public class GildedRose {
    public var items: [Item]
    
    public required init(items:[Item]) {
        self.items = items.map { item in
            item.toSubType()
        }
    }
    
    public func updateQuality() {
        for i in 0..<items.count {
            let item = items[i]
            item.updateQuality()
        }
    }
}
