# KBTU-Mobile
## Architecture

For this project, you’ll use Model-View-View Model, or MVVM, to architect the app’s components.

MVVM is a structural design pattern that separates the elements that compose the app into Views, View Models and Models. This design pattern helps developers separate business logic from the view and maintain the necessary separation of concerns to keep views and models agnostic from data sources and business logic.

Since you’ll use Cloud Firestore for data persistence, you’ll add a layer that handles the logic required to interact with the data source. For this project, you’ll use the repository pattern. This diagram shows the final representation of the app architecture:

![alt text](https://koenig-media.raywenderlich.com/uploads/2020/07/mvvm-diagram.png)

- Models hold app data. They’re a representation of the entities your app needs to manage.
- Views constitute the visual elements that make up your app and are responsible for displaying the data in your models.
- View Model makes the relationship between your models and your views possible by transforming the data in your models so it can be displayed in your views.
- Repository represents the abstraction that handles the data source communication. In this case, the data source is Cloud Firestore. The View Model communicates with the Repository when it needs to do any operation with the data, and also notifies views about changes in the data.

## Design Patterns
https://refactoring.guru/ru/design-patterns
### Coordinator
https://habr.com/en/company/umbrellaitcom/blog/426507/

### Factory
https://levelup.gitconnected.com/factory-method-pattern-in-swift-1f1b73488072

## Libraries
### SnapKit
SnapKit is a DSL to make Auto Layout easy on both iOS and OS X. It's simple and expressive at chaining DSL and allows building constraints with minimal amounts of code while ensuring they are easy to read and understand.
https://github.com/SnapKit/SnapKit

### Firebase
- Firebase Auth - provides backend services, easy-to-use SDKs, and ready-made UI libraries to authenticate users to your app. It supports authentication using passwords, phone numbers, popular federated identity providers like Google, Facebook and Twitter, and more.

- Firebase Firestore - database for mobile app development. It builds on the successes of the Realtime Database with a new, more intuitive data model. 
