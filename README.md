
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
2.  Bar properties can be customized in the following delegate

```
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
let cell : BarCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BarCollectionViewCell", for: indexPath) as! BarCollectionViewCell

cell.showArrow = (indexPath.row % 2 == 0)
cell.barSize = 50
cell.backgroundImage = UIImage(named: "paper")
cell.separatorColor = UIColor.red
cell.categoryImage = UIImage(named: "png")
cell.topLabel.text = "50"
cell.topLabel.textColor = UIColor.white
cell.topLabel.backgroundColor = UIColor.red
cell.bottomLabel.text = "Title"
cell.bottomLabel.textColor = UIColor.red
cell.barBackgroundColor = UIColor.darkGray
return cell
}
```

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
