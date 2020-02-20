//
//  ServiceHelper.swift
//  NYTimesArticles
//
//  Created by Abhishek Verma on 2/20/20.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation

protocol ServiceHelperProtocol : class {
    func fetchArticles(_ completion: @escaping ((Result<ArticleData, ErrorResult>) -> Void))
}

final class ServiceHelper : RequestHandler, ServiceHelperProtocol {
    
    static let shared = ServiceHelper()
    let apiUrlStr = ARTICLE_API_URL
    var task : URLSessionTask?
    
    func fetchArticles(_ completion: @escaping ((Result<ArticleData, ErrorResult>) -> Void)) {
        //cancel previous request if already in-progress
        self.cancelFetchArticles()
        task = RequestService().loadData(urlString: apiUrlStr, completion: self.networkResult(completion: completion))
    }
    
    func cancelFetchArticles() {
        if let task = task {
            task.cancel()
        }
        task = nil
    }
    
}

