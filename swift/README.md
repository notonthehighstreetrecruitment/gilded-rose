# Gilded Rose (Swift)

## Running Swift

To build and run:

    git clone https://github.com/notonthehighstreet/gilded-rose.git
    cd gilded-rose/swift/
    swift run
    
To adjust number of days:

    swift run GildedRoseApp 5
    
<sup>Replace 5 with your value</sup>

To build and run tests:

    swift test

### Install Swift

https://swift.org/getting-started/#installing-swift

## Using Xcode

You can open the `Package.swift` file in Xcode to build and run the project if you prefer. When running the application from Xcode it will default to printing the first 2 days in the console. To adjust this add an Integer environmental variable to the `GildedRose` build scheme:

<img width="773" alt="Screenshot 2021-05-21 at 11 05 33" src="https://user-images.githubusercontent.com/630601/119180032-9fc7c780-ba67-11eb-849c-78e0bf691fd9.png">

## Approach

### Step 1

The task is to add the new feature to the system so that it supports "Conjured" items. It's going to be a simple change to the code. However, problems arise when considering the readability and the scalability of the "updateQuality" method. Surely this needs a refactor before adding the new feature. However, the existing code is a work in progress. Therefore, we need to guarantee that the current behavior remains unchanged throughout the refactoring process. As always the first thing that comes to mind is unit tests. Luckily, we are given a unit test to start the process. So let's start making it pass first and then do some refactoring to make it more readable and precise.

### Step 2

Apart from the name, the "Item" class contains two other properties, "sellIn" and "quality." Now it's time to make the unit test more meaningful by covering other properties. We can confirm the item class to the equatable protocol and use the "XCTAssertEqual." However, we can use the description computed property easily to match items. Further, to improve the stability, we need to compare multiple items with different configurations. So we need to add more and more unit tests. But there should be a better approach. This is the place where ApprovalTests comes into the picture. To use ApprovalTests, we need to add the package dependency. And then, we can start refactoring the unit test.

### Step 3

Now, we have one approval test. But we need more to validate the current behavior before starting the refactoring. To guarantee that the current implementation is fully covered, we can utilize the Xcodes' built-in test coverage option. After enabling the test coverage option, it clearly shows the sections that are not covered, in highlighted red. Now we need more tests. Instead of writing more and more test cases, "ApprovalTests" comes with a cool feature called "CombinationApprovals." The concept is called "Characterization Tests." So let's use this cool feature to populate test cases. Further, when approving the received approval test cases, we don't even need to think about that. As this is legacy code and currently in production, its current behavior is correct. 

By adding multiple inputs for name, sellIn, and quality we could create 80 test cases to fully cover the current code. However, always it's a good practice to do some mutations on the code and rerun unit tests to catch edge cases.

### Step 4

Now the code is fully covered. So that it's time for the refactoring. As the requirement to add a new item type "Conjured" item, it's better to group the logic based on the item type. So that adding a new type will become easier. Firstly, extract the entire logic to a separate method. This made the "updateQuality" method more simple and readable. Further, TDD is the key to keeping the existing behavior without breaking the existing functionality.

### Step 5

Now the entire condition is grouped based on the item name. Adding a new item type is much easier. But we can further refactor this. It's better to convert this to an enum so that string comparisons can be removed from the condition.

### Step 6

As always there can be a better way to optimize this. Adding a new type requires modifications to the updateQuality method, which violates the open-close principle. So that we can move the "updateQuality" method to the item class and create sub-classes from it. And then can override the behavior depending on the item type. However, it is mentioned not to alter the "Item" class. In Swift, we can use an extension to overcome this condition.

### Step 7

Now the code is much cleaner and it follows the open-close principle. Each item type contains its conditions for the 'updateQuality' method. Now it's time to add the new feature. Here we can add new test cases to validate and cover the "Conjured" items' "updateQuality" method.  


