//
//  ServiceHelperTests.swift
//  NYTimesArticlesTests
//
//  Created by Abhishek Verma on 2/20/20.
//  Copyright © 2020 None. All rights reserved.
//

import XCTest

@testable import NYTimesArticles

class ServiceHelperTests: XCTestCase {
    
    func testCancelRequest() {
        
        ServiceHelper.shared.fetchArticles { (_) in
            // ignore call
        }
        ServiceHelper.shared.cancelFetchArticles()
        XCTAssertNil(ServiceHelper.shared.task, "Expected task nil")
    }
    
}

