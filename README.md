# LTDribbbleAPI

Yet another [Dribbble API](http://dribbble.com/api) client for iOS 6.0+ and Mac OS X 10.8+ based on [AFNetworking 2.0](https://github.com/AFNetworking/AFNetworking).


## Installation with CocoaPods

[CocoaPods](http://cocoapods.org/) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like AFNetworking in your projects. See the ["Getting Started" guide for more information](https://github.com/AFNetworking/AFNetworking/wiki/Getting-Started-with-AFNetworking).

#### Podfile

``` ruby
platform :ios, '7.0'
pod 'LTDribbbleAPI', '~> 0.0.1'
```

## Usage

```
#import <LTDribbbleAPI/LTDribbbleAPI.h>
```

``` objc
[[LTDribbbleAPI shared] shotsOfPlayer:@"simplebits" page:1 :^(LTDribbbleResults *results, NSError *error) {
    if (noErr == error.code) {
        NSLog(@"%i", results.pagination.pages);
        NSLog(@"%@", [(LTShot*)results.items.lastObject title]);
    }
}];

```

## Unit Tests

#### Xcode 5

Hit command + u in Xcode 5 to start XCTest.

#### xctool
I recommend you [xctool](https://github.com/facebook/xctool) if you prefer command line tests:

* ```brew update```
* ```brew uninstall xctool && brew install xctool --HEAD```
* ```rake test```


## Credits

LTDribbbleAPI was originally created by [Lex Tang](http://lextang.com/)([@lexrus](https://twitter.com/lexrus)) in the development of Drafffted for iPhone (N/A yet).


## License

Copyright (C) 2013 LexTang.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.