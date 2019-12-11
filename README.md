# AnyCoordinatable or Generic Navigation Abstractions

Navigation between views was never easy, especially in iOS applications world. Massive view controllers, spagetti code, storyboard segues, you know all this pain. Application coordinator pattern helps a lot, but if you have really big app with tens and maybe hundreds of screens - most likely you are also in trouble with massive or at least strongly coupled coordinators. 
I hope my approach helps you to solve this problem.

## Example

So let's imagine you have some kind of social app. It has swipe-menu, feed, profile screen, and messages flows. Coordinator pattern is already used, so no navigation logic in screen modules (please note, when I’m saying ‘screen module’ I does not mean some kind of its architecture). Every flow has it owns coordinator.

![spagetti-coordinators](https://github.com/migonin/AnyCoordinatable/blob/master/Images/example.png?raw=true)

And since user can navigate from one flow to another by tapping on other user profile in feed, then by tapping  messaging button on user profile and so on in a loop, every coordinator should know about all others to instantiate it some way and run.

```
func userSelected(_ user: User) {
	let coordinator = UserCoordinator(user, navigationController: self.navigationController)
	coordinator.start()
}
```

Or not?

## Using coordinators fabric

First step you can do - to instantiate coordinators with some fabric, enclose it all with protocols and inject concrete fabric implementation by some way.

```
let coordinatorFactory: CoorinatorFactoring

…

func userSelected(_ user: User) {
	let coordinator = factory.makeUserCoordinator(user, navigationController: self.navigationController)
	coordinator.start()
}
```

Much better, but not perfect. You should create protocol for each coordinator since it has different instantiating options and result parameters. Let’s make it more generic.

## Protocols with associated type

>If you are not familiar with PAT concept, I recommend you to start with [WWDC 2015 session 408](https://developer.apple.com/videos/play/wwdc2015/408/) , and then check these [speech by Alexis Gallagher](https://www.youtube.com/watch?v=XWoNjiSPqI8) and this [post from Russ Bishop](http://www.russbishop.net/swift-associated-types).

So let’s declare protocol `Coordinatable` like this:
```
protocol Coordinatable: class {
    associatedtype InputType
    associatedtype OutputType

    func start(with option: InputType)
    var completion: ((OutputType) -> Void)? {get set}
}
```
Now you can specify, what you want to pass to coordinator on start and what you will wait at completion. But here we get to ugly point: to use it you need to erase its type:
```
final class AnyCoordinatable<InputType, OutputType>: Coordinatable {
    …

    public init<T: Coordinatable>(_ coordionator: T) where T.InputType == InputType, T.OutputType == OutputType {
        …
    }
}
```
## Abstract fabric of generic coordinators

So let’s refine our fabric protocol with `AnyCoordinatable`:

```
protocol CoordinatorFactoring {
    func makeUserCoordinator(navigationController: UINavigationController?) ->
        (coordinator: AnyCoordinatable<InputType, OutputType>, viewController: UIViewController)
}
```

## Use cases

### Modularization
Since your coordinators shouldn't know something about each other but only about their input and output types, you can place it somewhere below and put separate flows to separate modules (or frameworks):

![frameworks](https://github.com/migonin/AnyCoordinatable/blob/master/Images/frameworks.png?raw=true)

### Stubbing
Now your coordinator logic is finely enclosed with protocol, so you can stub every coordinator you need with some simple blank UI, e.g. `UIAlertController`. It's usefull when other coordinator is not ready or when you building test application for particular flow and other coordinators implementation is not needed. You can also stub output action from stubbed coordinator.

<img src="https://github.com/migonin/AnyCoordinatable/blob/master/Images/screenshot.png?raw=true" width="400">

### A/B testing
Sometimes you need to vary user path in application based on some variable in remote config. So now you can have two (or more) different coordinators with same input and output types and easily change which you want to use.

### Where to go from here
You can enclose screen module with same approach. I'll add

### Sample code
Code in this repo contains simple example of this approach.
