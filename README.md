# FooterLinker

[![Version](https://img.shields.io/cocoapods/v/FooterLinker.svg?style=flat)](https://cocoapods.org/pods/FooterLinker)
[![License](https://img.shields.io/cocoapods/l/FooterLinker.svg?style=flat)](https://cocoapods.org/pods/FooterLinker)
[![Platform](https://img.shields.io/cocoapods/p/FooterLinker.svg?style=flat)](https://cocoapods.org/pods/FooterLinker)

The footer comes at the end of all the table contents and will still sticky even if if the contents are less than the height of the view.

## Demo

![FooterLinkerMore demo](https://raw.githubusercontent.com/aly23/FooterLinker/master/Resources/FooterLinkerMore.gif)
![FooterLinkerLess demo](https://raw.githubusercontent.com/aly23/FooterLinker/master/Resources/FooterLinkerLess.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 9.0, Swift 4.

## Installation

FooterLinker is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FooterLinker'
```

## Usage

1. Create a table view and a footer view in your view controller storyboard.
2. The bottom constraint of the footer and the table view must be linked.

![FooterLinker storyboard example](https://raw.githubusercontent.com/aly23/FooterLinker/master/Resources/StoryboardExample.png)

3. FooterLinker must be strong retained by the view controller. To initialize and setup it just use this simple line of code:

```swift
FooterLinker(scrollView: tableView, footerView: footerView)
```

## Author

Alice Migliorati, alice.migliorati@outlook.it

## License

FooterLinker is available under the MIT license. See the LICENSE file for more info.
