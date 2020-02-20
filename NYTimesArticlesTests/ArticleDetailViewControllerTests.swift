//
//  ArticleDetailViewControllerTests.swift
//  NYTimesArticlesTests
//
//  Created by Abhishek Verma on 2/20/20.
//  Copyright © 2020 None. All rights reserved.
//

import XCTest

@testable import NYTimesArticles

class ArticleDetailViewControllerTests: XCTestCase  {
    
    var articleDetailViewController: ArticleDetailViewController!
    
    var articleCellViewMode: ArticleCellViewModel?
    
    var navigation: UINavigationController!
    var controller : ArticleDetailViewController!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        
        mockupArticleDetailsData()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func mockupArticleDetailsData() {
        articleCellViewMode?.details = "Dummy Article Details"
        articleCellViewMode?.imageUrl = "https://static01.nyt.com/images/2019/03/27/science/27xp-nopain/27xp-nopain-square320.jpg"
    }
    
    func testArticleDetailViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        articleDetailViewController = storyboard.instantiateViewController(withIdentifier:String(describing: "ArticleDetailViewController")) as? ArticleDetailViewController
        
        print("articleDetailViewController",articleDetailViewController)
        XCTAssertNotNil(articleDetailViewController)
        
        articleDetailViewController.articleCellViewModel = articleCellViewMode
        
        let detailLabel = UITextView()
        articleDetailViewController.detailTextView = detailLabel
        
        let articleDetailIcon = UIImageView()
        articleDetailViewController.detailIcon = articleDetailIcon
        
        articleDetailViewController.viewDidLoad()
        articleDetailViewController.viewWillAppear(true)
        articleDetailViewController.loadArticleImage()
    }
    
}

