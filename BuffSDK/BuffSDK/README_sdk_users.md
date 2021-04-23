# BuffSDK
The SDK of SportsBuff

##Usage
In order to use the SDK, you have to initialise it first:

`BuffSDK.initialise()`

Then define the area where you want the popoup to be shown, the area will be represented by an instance of:

- UIKit.UIView
- UIKit.UIViewController 
- SwiftUI.View 

and then call two simple methods

`myArea.startBuffing()`
`myArea.stopBuffing()`

you can optionally set a delegate to receive feedback on what is going on 

`BuffSDK.shared.delegate = someDelegate`

That's it.

