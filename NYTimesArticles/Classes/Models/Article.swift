//
//  Article.swift
//  NYTimesArticles
//
//  Created by Abhishek Verma on 2/20/20.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation

struct ArticleData {
    var articles: [Article]?
}

extension ArticleData: Parceable {
    static func parseObject(dictionary: [String : Any]) -> Result<ArticleData, ErrorResult> {
        if let results = dictionary["results"] as? [[String: Any]] {
            let articles = results.map({ Article(articleDict: $0)}).compactMap{$0}
            let meta = ArticleData(articles: articles)
            return Result.success(meta)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse API response"))
        }
    }
}

struct Article
{
    var name: String!
    var imageUrl: String?
    var publishedDate: Date!
    var writer: String?
    var details: String?
    
    init?(articleDict: Dictionary<String,Any>) {
        guard let _ = articleDict["title"] as? String else {
            return nil
        }
        self.name = articleDict[kServerDataJSONKeyTitle] as? String
        self.writer = articleDict[kServerDataJSONKeyByLine] as? String
        self.details = articleDict[kServerDataJSONKeyAbstract] as? String
        
        if let dateString = articleDict[kServerDataJSONKeyPublishedDate] as? String {
            self.publishedDate = Utility.getDateFromString(dateString: dateString)! as Date
        }
        if let media = articleDict[kServerDataJSONKeyMedia] as? [Dictionary<String,Any>] {
            if let media_metaData = media.first?[kServerDataJSONKeyMediaMetaData] as? [Dictionary<String,Any>] {
                self.imageUrl = media_metaData.first?[kServerDataJSONKeyImageURL] as? String
            }
        }
    }
    
}

