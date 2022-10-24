# MoviesApp

I used the Viper architecture pattern and the Unit Testing.

VIPER is an architectural pattern like MVC or MVVM, but it separates the code further by single responsibility. Apple-style MVC motivates developers to put all logic into a UIViewController subclass. VIPER, like MVVM before it, seeks to fix this problem.

Each of the letters in VIPER is a component of the architecture: View, Interactor, Presenter, Entity and Router.


- The View is the user interface.
- The Interactor is a class that mediates between the presenter and the data. It takes direction from the presenter.
- The Presenter is the “traffic cop” of the architecture, directing data between the view and interactor, taking user actions and calling to the router to move the user between views.
- An Entity represents application data.
- The Router handles navigation between screens.




![viper](https://user-images.githubusercontent.com/13080678/197004974-4eb28d59-b518-48b5-ad3d-21166297822d.png)
