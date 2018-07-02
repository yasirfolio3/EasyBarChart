
# EasyBarChart

[![CI Status](https://img.shields.io/travis/yasirfolio3/EasyBarChart.svg?style=flat)](https://travis-ci.org/yasirfolio3/EasyBarChart)
[![Version](https://img.shields.io/cocoapods/v/EasyBarChart.svg?style=flat)](https://cocoapods.org/pods/EasyBarChart)
[![License](https://img.shields.io/cocoapods/l/EasyBarChart.svg?style=flat)](https://cocoapods.org/pods/EasyBarChart)
[![Platform](https://img.shields.io/cocoapods/p/EasyBarChart.svg?style=flat)](https://cocoapods.org/pods/EasyBarChart)
![EasyBarChart hero](https://github.com/yasirfolio3/EasyBarChart/blob/72ffcee1f310f29cf943fd81df67a69d784f0f3b/iphone_portrait.png)
![EasyBarChart hero](https://github.com/yasirfolio3/EasyBarChart/blob/72ffcee1f310f29cf943fd81df67a69d784f0f3b/iphone_lanscape.png)
![EasyBarChart hero](https://github.com/yasirfolio3/EasyBarChart/blob/72ffcee1f310f29cf943fd81df67a69d784f0f3b/ipad_portrait.png)
![EasyBarChart hero](https://github.com/yasirfolio3/EasyBarChart/blob/72ffcee1f310f29cf943fd81df67a69d784f0f3b/ipad_landscape.png)

## Features

1.  This pod allows you to create multiple bar charts
2.  Bar properties can be customized in the following delegate

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
let cell : BarCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BarCollectionViewCell", for: indexPath) as! BarCollectionViewCell

cell.showArrow = (indexPath.row % 2 == 0)
cell.barValue = 50
cell.barSize = 50
cell.backgroundImage = UIImage(named: "paper")
cell.separatorColor = UIColor.darkGray
cell.categoryImage = UIImage(named: "fruit")
cell.categoryName = "NUTRITION"
cell.themeColor = UIColor.purple
return cell
}

3. It supports both iPad and iPhone resolutions and in all orientations
4. Please follow the example project for proper implementation especially for orientation changes.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

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
