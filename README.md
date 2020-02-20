# NYTimes-MostPopular-Articles-App
    A simple app to hit the NY Times Most Popular Articles API and:
    * Display articles in list.
    * Display article details. 
    * Without network suppor.
    
    We are using the most viewed section of this API.
    http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?apikey= sample-key 
    To test this API,we used 
    * all-sections for the section path component in the URL.
    * 7 for period.
    
    This is configurable in Constants.Swift file in Project. 
    
    
## Tools  Used
- [CocoaPods](https://cocoapods.org/) - CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 59 thousand libraries and is used in over 3 million apps. CocoaPods can help you scale your projects elegantly.

## Library Used
- [SDWebImage](https://github.com/rs/SDWebImage) - This library provides an async image downloader with cache support.
- [ReachabilitySwift ](https://github.com/ashleymills/Reachability.swift) - Reachability.swift is a replacement for Apple's Reachability sample, re-written in Swift with closures.

# Installation:
Follow the steps for install and  run:
* Installation by cloning the repository.
* Open terminal in pc.
* Set your project path on terminal.
* Command : Pod install.
* Open xcworkspace  file.
* Use command + B or Product -> Build to build the project.
* Incase of build fail due to dependency SDWebImageView, install SDWebImageView using CocoaPods.
* Incase of build fail due to dependency ReachabilitySwift, install ReachabilitySwift using CocoaPods.
* Press run icon in Xcode or command + R to run the project on Simulator.

## Running The Tests Manually 

Follow the steps to get test case reports:
* Enable coverage Data under test schema section:
* Select the Test Icon by pressing and holding Xcode Run Icon OR press `Command+Control+U`.
* In the Project Navigator under Test Navigator tab, check test status and coverage .

# Architecture
We used MVVM :

&nbsp; 
&nbsp; 

<kbd >
<img src="https://raw.githubusercontent.com/jorgemht/Xamarin/master/img/MVVM.png" width="80%" height="80%">
</kbd>

</br>
</br>
