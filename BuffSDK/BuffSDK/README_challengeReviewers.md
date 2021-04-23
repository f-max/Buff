##  Implementation details

### Structure

The SDK has been structured to allow adding support for any UI framework in a (hopefully) rather straightforward fashion. 

All the new supported type will have to do is adding conformance to `Buffable` and implementing two simple methods from `QuizShowable` protocol:

`func show(quiz: Quiz, timeToShow: TimeInterval, completion: @escaping (Bool) -> Void)`
`func dismissQuiz(completion: @escaping (Bool) -> Void)`

In this exercise imlementation has been provided just to support UIView, while UIViewController and SwiftUI.View have empty implementations.

### Host app feedback and control

The only feedback the SDK provides is about quiz getting shown and dismissed, no other information is made available to the host app. Obviously this can be changed as per different requirements. 

### Tests

A few unit tests have been provided as an example.

### UI layout and styling

The appearance has not been refined to completely match the design due to lack of time. Anyway most of the elements and all the required information is there.


