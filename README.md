# SpaceX Viper

Welcome to SpaceX Viper, a iOS app developed using the VIPER architecture. This project doesn't use Storyboard and aims to be a good example of a clean code project.

## Overview

SpaceX Viper is an app that communicates with the SpaceX API to provide the following features:

- Launch List: List of all SpaceX launches. You can filter the list by launch year through a picker.
- Launch Details: Detailed information about each launch, accessible by tapping on a launch from the list.

## Architecture

This project is implemented using the VIPER architecture. VIPER is a derivative of the Clean Architecture which stands for View, Interactor, Presenter, Entity, and Routing. The main advantages of using VIPER is that it enforces the Single Responsibility Principle and it separates concerns well.

## Installation

1. Clone this repository.
3. Open SpaceX-Viper.xcodeproj file with Xcode.
4. Build and run the app using Xcode.

## Libraries

An effort has been made to use as few libraries as possible, but only the - KingFisher library has been used for both an example of Swift package dependency usage and for image loading and caching tasks.


## Requirements

- iOS 16.2+

## Contact

You can contact me at oguzhankabul@gmail.com if you have any questions or suggestions regarding this project.
