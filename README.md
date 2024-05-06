# SwiftUITemplate

## Introduction

This template is intended to demonstrate the main parts of an iOS app written in SwiftUI. It can either be used as a template for starting a new app or as reference for implementing good architecture patterns in existing codebases.

The template does not account for very complex projects so some form of modularisation would need to happen when getting to that stage depending on the specific project requirements.

The main parts so far are the MVVM-C, unit testing and snapshot UI testing. The implementation is a take on Clean Architecture and I generally follow SOLID and Clean Code principles.

I generally prefer to keep the code simple and minimise external frameworks dependencies to reduce the learning curve for any developer coming on board or taking over the projects I work on so there is only one external dependency to facilitate snapshot testing.

There is a sister project for UIKit that does the same thing [here](https://github.com/igorest7/UIKitTemplate). 

## Architecture overview

### MVVM-C

Navigation logic is designed to be isolated from the views and viewModels. This is achieved by containing it in the Coordinators. Usually apps are split into separate user journeys that can contain any number of screens. Coordinators follow that structure except for the first one. That is the DeeplinkCoordinator to facilitate navigating to arbitrary screens after opening deeplinks. 

In this app the MainMenuCoordinator is a single view coordinator but the DetailsCoordinator contains two different views with navigation happening both between individual screens and different user journeys.

SwiftUI NavigationPath allows us to setup arbitrary path items so each coordinator can define its own and navigate between them as needed. However that flexibility means that we can't inspect the path to find the exact view so for now popping to root of the coordinator user journey requires us to keep count of the added views.

Routers are separate from Coordinators to remove UI code references from the ViewModel.

### Dependency injection

ViewModelFactory is injected into the cooordinators to create the viewModels as needed. It is extended along with each view to provide new viewModels. Concrete implementation contains the AppDependencyProvider that has all the services that might be needed by the viewModels in one place.

## Tests

There are unit test examples for the ConcreteMainMenuViewModel as well as the RemoteTodoService. There are also ui tests within the unit test target. 

I am using the swift snapshot testing package for that as it provides a fast and convenient way to write unit tests by setting up screens for different devices and states. Example tests are in the MainMenuViewTests.

UI tests also use the preview content mocks and builders. To avoid code duplication the tests have a reference to the same files but pointing to the original ones in the preview content folder. The only note here is that the testable import has to be omitted for non test builds to avoid compilation warnings.

## Localisation

This is done through the usual strings catalogue with the additional Localizable struct to keep the actual strings names in one place.

## Theming

Fonts are setup in the Font extension to support a common approach to the design system and to allow easy app wide customisation of fonts and sizes.

Colours are set through the Colors asset catalogue and the Color extension to also keep the string names in one place. 
