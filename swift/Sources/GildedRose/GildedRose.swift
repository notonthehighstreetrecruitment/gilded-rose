
public class GildedRose {
    var items: [Item]
    
    public required init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {
        for item in items {
            let itemWithType = ItemWithType(item: item)
            itemWithType.updateQuality()
        }
    }
}
