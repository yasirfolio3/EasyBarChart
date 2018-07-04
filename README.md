
# EasyBarChart

[![CI Status](https://img.shields.io/travis/yasirfolio3/EasyBarChart.svg?style=flat)](https://travis-ci.org/yasirfolio3/EasyBarChart)
[![Version](https://img.shields.io/cocoapods/v/EasyBarChart.svg?style=flat)](https://cocoapods.org/pods/EasyBarChart)
[![License](https://img.shields.io/cocoapods/l/EasyBarChart.svg?style=flat)](https://cocoapods.org/pods/EasyBarChart)
[![Platform](https://img.shields.io/cocoapods/p/EasyBarChart.svg?style=flat)](https://cocoapods.org/pods/EasyBarChart)
![EasyBarChart hero](https://github.com/yasirfolio3/EasyBarChart/blob/2b76a2ded136013c60be2bdd1849c0dcab05b18b/iphone_portrait.png)
![EasyBarChart hero](https://github.com/yasirfolio3/EasyBarChart/blob/2b76a2ded136013c60be2bdd1849c0dcab05b18b/iphone_landscape.png)
![EasyBarChart hero](https://github.com/yasirfolio3/EasyBarChart/blob/2b76a2ded136013c60be2bdd1849c0dcab05b18b/ipad_portrait.png)
![EasyBarChart hero](https://github.com/yasirfolio3/EasyBarChart/blob/2b76a2ded136013c60be2bdd1849c0dcab05b18b/ipad_landscape.png)

## Features

1.  This pod allows you to create multiple bar charts
2.  Ease of use has been the utmost priority as seen by the example.
3.  It supports both iPad and iPhone resolutions and in all orientations
4.  Please follow the example project for proper implementation especially for orientation changes.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Use this code to generate Charts:
```
@IBOutlet weak var collectionView: UICollectionView!
var items = [BarDataModel]()
var barDataSource: BarDataSource!

override func viewDidLoad() {
    super.viewDidLoad()

    self.populateTemporaryItems() 
    barDataSource = BarDataSource(items: items, collectionView: collectionView, cellHeightToWidthRatio: 5)
    collectionView.dataSource = barDataSource
    collectionView.reloadData()
}

//Method to fill items Array
func populateTemporaryItems() {
    for n in 0...20{
        let barModel = BarDataModel()
        barModel.showArrow = (n % 2 == 0)
        barModel.barSize = 50
        barModel.backgroundImage = UIImage(named: "paper")!
        barModel.separatorColor = UIColor.red
        barModel.categoryImage = UIImage(named: "png")!
        barModel.topLabelText = "50"
        barModel.topLabelTextColor = UIColor.white
        barModel.topLabelBackgroundColor = UIColor.red
        barModel.bottomLabelText = "Title"

        self.items.append(barModel)
    }
}
```

Use these methods in your viewcontroller to handle orientation and device changes:

```ruby
override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    barDataSource.recalculateCellSizes()
}

override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    barDataSource.recalculateCellSizes()
}
```

## Requirements

```ruby
Swift 4.1
XCode 9.3
```

## Installation

EasyBarChart is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EasyBarChart'
```

## Author

yasirfolio3, yali@folio3.com

## License

EasyBarChart is available under the MIT license. See the LICENSE file for more info.
