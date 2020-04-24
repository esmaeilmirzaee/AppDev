#  iOS Development Course in Cornell University
> The current application is the app I developed and experenced when I took the course. Although each lecture has its own application, I developed a single application to move around to each lecture's app. (img/a--dev_mockup.gif)[img/appdev_mockup.gif] is the app graphical design by me using `Adobe Photoshop`, `Adobe illustrator`, `Sketch` and `Adobe after effects`.

In XCode 10, delete storyboard and remove its key-value from appplist. Then in `AppDelegate` {`func scene`} method.
```ruby
if let windowScene = scene as? UIWindowScene {
	let window = UIWindow(windowScene: windowScene)
	let viewController = UINavigationController(rootViewController: AppViewController())
	window.rootViewController = viewController
	self.window = window
	window.makeKeyAndVisible()
}```

### App's section and approaches
1. Lecture 1 is about the Swift programming language and starts teaching Swift using `playgrounds` in `Apple XCode`. 
2. The real iOS app development starts in _lecture 2_ by creating an application to show information about great *Bill Gates*.
3. Creating a single page application for iOS using NSLayoutConstraint to design and make the user interface. The Lecture 3 app is just a simple grocery list application. There are two types of user interface manager in iOS. First, `UINavigationController` which works like a stack and each user interface--`UIViewController`--pushes on it or pulls from it. Second, `ModalViewController` which moves upward from the bottom of the view and plays as an alert mode.
4. Lecture 4 is all about `UITableView`. It is useful to implement many user interface such as Messanger app to show the current user's email or messages. Simply put, to implement three steps should be accomplished. One, create a table view and setup the user interface's constraints. Two, extending the current view controller to use `UITableViewDataSource` and `UITableViewDelegate`. Three, implementing a cell in order to use it later in table view.
5. TODO: `UICollectionView` is another way to display a list of objects---music file, documents and so on. The implementation is consists of 4 steps which the first 3 steps are identical to `UITableView`. For step 4, create a `UILayout` and register the `UICollectionViewController` to use it.
