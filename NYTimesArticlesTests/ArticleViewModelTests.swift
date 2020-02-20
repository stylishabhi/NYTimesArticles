//
//  ArticleViewModelTests.swift
//  NYTimesArticlesTests
//
//  Created by Abhishek Verma on 2/20/20.
//  Copyright © 2020 None. All rights reserved.
//

import XCTest

@testable import NYTimesArticles

class ArticleViewModelTests: XCTestCase {
    
    var viewModel: ArticleViewModel!
    var dataSource: GenericDataSource<ArticleCellViewModel>!
    fileprivate var service: MockServiceHelper!
    var viewModelWithArticles: ArticleViewModel!
    fileprivate var serviceWithArticle: MockServiceHelperWithArticle!
    
    override func setUp() {
        super.setUp()
        self.service = MockServiceHelper()
        self.serviceWithArticle = MockServiceHelperWithArticle()
        self.dataSource = GenericDataSource<ArticleCellViewModel>()
        self.viewModel = ArticleViewModel(service: service, dataSource: dataSource)
        self.viewModelWithArticles = ArticleViewModel(service: serviceWithArticle, dataSource: dataSource)
    }
    
    override func tearDown() {
        self.viewModel = nil
        self.dataSource = nil
        self.service = nil
        super.tearDown()
    }
    
    func testFetchWithNoService() {
        // giving no service to a view model
        viewModel.service = nil
        
        // expected to not be able to fetch article
        viewModel.fetchArticles{ result in
            switch result {
            case .success(_) :
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            default:
                break
            }
        }
    }
    
    func testFetchArticles() {
        // expected completion to succeed
        viewModelWithArticles.fetchArticles { result in
            switch result {
            case .failure(_) :
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            default:
                break
            }
        }
    }
    
    func testFetchNoArticles() {
        // expected completion to fail
        viewModel.fetchArticles { result in
            switch result {
            case .success(_) :
                XCTAssert(false, "ViewModel should not be able to fetch ")
            default:
                break
            }
        }
    }
}

fileprivate class MockServiceHelper : ServiceHelperProtocol {
    var articleData: ArticleData?
    func fetchArticles(_ completion: @escaping ((Result<ArticleData, ErrorResult>) -> Void)) {
        if let articleData = articleData {
            completion(Result.success(articleData))
        } else {
            completion(Result.failure(ErrorResult.custom(string: "No Article Data")))
        }
    }
}

fileprivate class MockServiceHelperWithArticle : ServiceHelperProtocol {
    var articleData: ArticleData? = ArticleData(articles: [Article(articleDict: ["title":"Dummy Article"])!])
    func fetchArticles(_ completion: @escaping ((Result<ArticleData, ErrorResult>) -> Void)) {
        if let articleData = articleData {
            completion(Result.success(articleData))
        } else {
            completion(Result.failure(ErrorResult.custom(string: "No Article Data")))
        }
    }
    
}


