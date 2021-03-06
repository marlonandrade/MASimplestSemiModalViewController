# MASimplestSemiModalViewController

The simplest Semi Modal implementation possible.
Very, very simplified version based on [KNSemiModalViewController](https://github.com/kentnguyen/KNSemiModalViewController).

## Features (or lack of)

* iOS 6+
* No options configuration
* No callback completion blocks
* No UIViewController containment logic implemented
* No tests

## Usage

* Add `MASimplestSemiModalViewController` on your Podfile and install it
* `#import "UIViewController+MASimplestSemiModal.h"'`
* `[viewController presentSemiView:semiView];`

## Disclaimer

If you want a better, configurable and complex Semi Modal implementation you should go for 
[KNSemiModalViewController](https://github.com/kentnguyen/KNSemiModalViewController), 
[@kentnguyen](https://github.com/kentnguyen) and the other contributors made a great job on that project.
  
Even thought I said that it is the simplest Semi Modal implementation possible 
I know that it's not, so fell free to make it simpler.
