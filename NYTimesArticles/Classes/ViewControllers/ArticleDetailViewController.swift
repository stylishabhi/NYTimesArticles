//
//  ArticleDetailViewController.swift
//  NYTimesArticles
//
//  Created by Abhishek Verma on 2/20/20.
//  Copyright © 2020 None. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleDetailViewController: UIViewController {
    
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var detailIcon: UIImageView!
    
    var articleCellViewModel: ArticleCellViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        detailTextView.text = articleCellViewModel?.details
        self.title = kArticleDetailTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadArticleImage()
    }
    
    deinit {
        articleCellViewModel = nil
    }
    
    func loadArticleImage() {
        if let urlStr = articleCellViewModel?.imageUrl {
            let url = URL(string: urlStr)
            detailIcon.sd_setShowActivityIndicatorView(true)
            detailIcon.sd_setIndicatorStyle(.gray)
            detailIcon.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "placeHolder.png"), options: SDWebImageOptions.delayPlaceholder, completed: nil)
        }
    }
    
}
