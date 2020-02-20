//
//  ArticleDataTests.swift
//  NYTimesArticlesTests
//
//  Created by Abhishek Verma on 2/20/20.
//  Copyright © 2020 None. All rights reserved.
//

import XCTest

@testable import NYTimesArticles

let kSampleArticleTitle = "At 71, She’s Never Felt Pain or Anxiety. Now Scientists Know Why."
let kSampleArticleCount = 20
let kSampleArticlePubDate = "2019-03-28"

class ArticleDataTests: XCTestCase {
    
    func testParseEmptyArticleData() {
        
        // giving empty data
        let data = Data()
        
        // giving completion after parsing
        // expected valid ArticleData with   valid Article data
        let completion : ((Result<ArticleData, ErrorResult>) -> Void) = { result in
            switch result {
            case .success(_):
                XCTAssert(false, "Expected failure when no data")
            default:
                break
            }
        }
        
        ParserHelper.parse(data: data, completion: completion)
    }
    
    func testParseArticleData() {
        
        // giving a sample json file
        guard let data = FileManager.readJson(forResource: "articlesResponse") else {
            XCTAssert(false, "Can't get data from sample.json")
            return
        }
        
        // giving completion after parsing
        // expected valid converter with valid data
        let completion : ((Result<ArticleData, ErrorResult>) -> Void) = { result in
            switch result {
                
            case .failure(_):
                XCTAssert(false, "Expected valid Article Data")
            case .success(let articleData):
                XCTAssertEqual(articleData.articles?.count, kSampleArticleCount, "Expected \(kSampleArticleCount)")
                XCTAssertEqual(articleData.articles?.first?.name, kSampleArticleTitle, "Expected \(kSampleArticleTitle)")
                if let date = articleData.articles?.first?.publishedDate
                {
                    XCTAssertEqual(Utility.getStringFromDate(date: date), kSampleArticlePubDate, "Expected \(kSampleArticlePubDate)")
                }
            }
        }
        
        ParserHelper.parse(data: data, completion: completion)
    }
    
    func testWrongKeyArticleData() {
        // giving a wrong dictionary
        let dictionary = ["test" : 123 as AnyObject]
        
        // expected to return error of Article Data
        let result = ArticleData.parseObject(dictionary: dictionary)
        
        switch result {
        case .success(_):
            XCTAssert(false, "Expected failure when wrong data")
        default:
            return
        }
    }
    
}

extension FileManager {
    
    static func readJson(forResource fileName: String ) -> Data? {
        
        let bundle = Bundle(for: ArticleDataTests.self)
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                // handle error
            }
        }
        
        return nil
    }
    
}


