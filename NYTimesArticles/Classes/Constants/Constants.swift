//
//  Constants.swift
//  NYTimesArticles
//
//  Created by Abhishek Verma on 2/20/20.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation
import UIKit

//String constants
let kArticleTitle                       = "NY Times Most Popular"
let kArticleDetailTitle                 = "The New York Times"
let kOkButtonTitle                      = "OK"
let kNoNetworkErrorMessgae              = "Internet is not availble. please check your internet setting and try again."
let kAPIParseErrorMessgae               = "An error occurred while processing response!. Please check your internet setting and try again later"

// Color constants
let kPrimaryTextColor                   = UIColor.black
let kSecondryTextColor                  = UIColor.darkGray
let kPrimaryBackGroundColor             = UIColor.lightGray

//Storyboard ID's
let kArticleCellID                      = "ArticleCellID"
let kArticleDetailSegue                 = "articleDetailsSegue"

//API response keys
let kServerDataJSONKeyTitle             = "title"
let kServerDataJSONKeyByLine            = "byline"
let kServerDataJSONKeyPublishedDate     = "published_date"
let kServerDataJSONKeyMedia             = "media"
let kServerDataJSONKeyResult            = "results"
let kServerDataJSONKeyAbstract          = "abstract"
let kServerDataJSONKeyMediaMetaData     = "media-metadata"
let kServerDataJSONKeyImageURL          = "url"

//API URLS
let APIKey                              = "Oqmf1a37fGyvF28p6bC1DaTr7o4WPVmL"
let kAPIPeriods                         = 7
let kAPISections                        = ""
let API_BASE_URL                        = "http://api.nytimes.com/svc/mostpopular/v2/viewed/"

let ARTICLE_API_URL = API_BASE_URL + "\(kAPISections)" + "\(kAPIPeriods)" + ".json?api-key=\(APIKey)"

