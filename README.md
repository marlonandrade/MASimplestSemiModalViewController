# MASimplestSemiModelViewController

The simplest Semi Model View Controller possible.
Very, very simplified version based on [KNSemiModalViewController](https://github.com/kentnguyen/KNSemiModalViewController).

## Features (or lack of)

* iOS 6+
* No options configuration
* No callback completion blocks
* No UIViewController containment logic implemented
* No tests

## Usage

* Add `MASimplestSemiModelViewController` on your Podfile and install it
* `#import "UIViewController+MASimplestSemiModal.h"'`
* `[viewController presentSemiView:semiView];`

## Disclaimer

If you want a better, configurable and complex Semi Modal implementation you should go for 
[KNSemiModalViewController](https://github.com/kentnguyen/KNSemiModalViewController), 
[@kentnguyen](https://github.com/kentnguyen) and the other contributors made a great job on that project.
