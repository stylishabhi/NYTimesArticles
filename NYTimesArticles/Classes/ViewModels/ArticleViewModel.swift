//
//  ArticleViewModel.swift
//  NYTimesArticles
//
//  Created by Abhishek Verma on 2/20/20.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation

struct ArticleViewModel {
    
    weak var dataSource: GenericDataSource<ArticleCellViewModel>?
    weak var service: ServiceHelperProtocol?
    
    init(service: ServiceHelperProtocol = ServiceHelper.shared, dataSource : GenericDataSource<ArticleCellViewModel>?) {
        self.dataSource = dataSource
        self.service = service
    }
    
    func fetchArticles(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
        
        guard let service = service else {
            completion?(Result.failure(ErrorResult.custom(string: "Missing service")))
            return
        }
        
        service.fetchArticles() { result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let metaData) :
                    var articles = metaData.articles ?? []
                    
                    articles = articles.sorted(by: { $0.publishedDate > $1.publishedDate })
                    self.dataSource?.data.value = self.getArticleCellViewModelsWith(articles: articles)
                    completion?(Result.success(true))
                    break
                    
                case .failure(let error) :
                    debugPrint("Parser error \(error)")
                    completion?(Result.failure(error))
                    break
                }
            }
        }
    }
    
    func  getArticleCellViewModelsWith(articles:[Article]) -> [ArticleCellViewModel] {
        var articalCellVMList:[ArticleCellViewModel] = []
        for article in articles {
            let articleCellViewModel = ArticleCellViewModel(article: article)
            articalCellVMList.append(articleCellViewModel)
        }
        return articalCellVMList
    }
    
}
