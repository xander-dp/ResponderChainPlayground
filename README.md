This is a plaground project for discovering of `UITouch` disptaching through the *View Hierarchy* and *Responder Chain* specifics.

Here you can find inherrited `UIResponders` for whole hierarchy, starting with `UIApplication` and `UIWindow` ending up with Subview.
One of the peculiarities in this mechanism is a work of Gesture Recognizers. Touches goes through *Responder Chain* from one `UIResponder` to another,
untill the iheritor of `UIGestureRecognizer` appears.

There is many phases of processing users Touch in iOS, in particular there is a phase, when the system detect the Touch and determined that it is
related to our Application (you can see the sequence by looking through the order of calls to `UIResponder` methods, overwritten for each class in the app,
when you tapping on different places of the screen), but still didn't dispatch the `UIEvent` to the App. At this moment you we can investigate how system determines,
whether there is any Gesture Recognizers. And that's how:

1. First of all pay attention to `func sendEvent(_ event: UIEvent)` in `CustomWindow`. It is called right after sendEvent in `CustomApplication` class,
which is an entry point for `UIEvent`. Here you can explore, that `UIEvent` already has information about all potentially affected instances.
That means that iOS already collected information through the Hit Test.

2. Now let's see what's going on before our App getting notified about the user's interaction.
Take a quick look on `func hitTest(_ point: CGPoint, with event: UIEvent?)` and `func point(inside point: CGPoint, with event: UIEvent?)`
in `UIViewWithRecognizer` and `UIViewSubview`. Here you can hit the Breakpoints and evaluate how system forming the *Responder Chain*
before dispatch an event to our `CustomApplication` class.

3. Right after hitTest, take a look at UIView's property called `var gestureRecognizers: [UIGestureRecognizer]?`
This property is overwritten in `UIViewWithGestureRecognizer` (you can also overwrite this property for each class related to UIView
in the project to check the sequence). If you will hit the Breakpoint in getter and discover the Call Stack,
you will see that the system collecting all Gesture Recognizers presented in *Responder Chain*:

   <img width="536" alt="image" src="https://github.com/user-attachments/assets/04e25b33-af01-4577-ba32-b62dbb6cf7a1">

4. As a final pache of puzzle, add a Breakpoints to func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) of CustomGestureRecognizer
and UIViewWrapper. Try to interract with different Views and compare the Call Stack, you'll see that it differs from UIWindow.sendEvent.
Because `UIWindow` is a first `UIView` instance in the hierarchy (as an inheritor) and its checking whether there are some Gesture Recognizers
confirmed to receive the actual UIEvent.

P.S. Of course there is a lot another things to explore, such as `func shouldReceive(_ event: UIEvent)` where GRs getting notified about upcomming
events, evaluation of several GRs simultaneous processing on the same `UIEvent`, intersection of gestures between Views in the same hierarchy
and many more. Thats why I invite you to collaborate and extend this project to explore other specifics of Handling the User's Interaction.

P.P.S I've also added some //MARK: tags with short description for easier navigation through the code.

   <img width="351" alt="image" src="https://github.com/user-attachments/assets/b88db32c-ab62-4cb8-9286-d07961779119">

