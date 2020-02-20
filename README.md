# NYTimesArticles
NYTimes-MostPopular-Articles-App

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
