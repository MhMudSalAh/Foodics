# Foodics

### Overview:
iOS Swift (resturant) Application using VIPER Architecture, and RxCocoa.
This is a simple resturant application using VIPER architecture, RxCocoa and CoreData, I prefer using Delegate Protocols rather than Third Party Library such as Rx but at this project I make it as an example on how to using VIPER with Rx.The application also support localization and I save the categories at CoreData.

### VIPER
VIPER is an application of Clean Architecture. The word VIPER is a backronym for View, Interactor, Presenter, Entity, and Routing (And I use another component called Contrcat). Clean Architecture divides an app’s logical structure into distinct layers of responsibility. This makes it easier to isolate dependencies (e.g. your database) and to test the interactions at the boundaries between layers.

## Key Features
- VIPER Architecture
- RxCocoa
- Splash Screen
- Localization
- CoreData
- Caching at UserDefaults
- Extensions (UITableView, UICollectionView)
- Extensions (UITableViewCell, UICollectionViewCell)
- Extensions for UI
- Storyboards for UI

### App Structure
- App

- Extenions -- Swift -- UIKit

- Local -- CoreDate -- Caching -- Models

- Modules -- Base -- Main -- Splash -- Root -- Navbar

- ReusableViews -- AlertController -- EmptyScreenController -- LoadingController

- Resources

- Utilities

### Author
Created by Mahmoud Salah on 2020. Copyright © 2020 Mahmoud Salah [LinkedIn](https://www.linkedin.com/in/mahmoud-salah-a40465149/).<br/>
Please don't hesitate to ask any clarifying questions about the project if you have any.
