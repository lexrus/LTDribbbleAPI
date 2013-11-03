# LTDribbbleAPI

Yet another Dribbble API client based on AFNetworking 2.0.


## Installation

```pod 'LTDribbbleAPI', '~> 0.0.1'```

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

## Tests

```brew uninstall xctool && brew install xctool --HEAD```

```rake test```


## License

Copyright (C) 2013 LexTang.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.