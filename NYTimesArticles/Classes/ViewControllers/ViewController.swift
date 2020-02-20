//
//  ViewController.swift
//  NYTimesArticles
//
//  Created by Abhishek Verma on 2/20/20.
//  Copyright © 2020 None. All rights reserved.
//

import UIKit

let kEstimatedArticleRableRowHeight:CGFloat = 100.0

class ViewController: BaseViewController {
    
    @IBOutlet weak var articleTableView: UITableView!
    @IBOutlet weak var waitIndicator: UIActivityIndicatorView!
    
    var dataSource = ArticleDataSource()
    
    lazy var viewModel : ArticleViewModel = {
        let viewModel = ArticleViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpIntials()
    }
    
    //MARK:- UI setu methods
    func setUpIntials() {
        //Setup UI
        self.title = kArticleTitle
        self.waitIndicator.stopAnimating()
        
        self.articleTableView.rowHeight = UITableView.automaticDimension
        self.articleTableView.estimatedRowHeight = kEstimatedArticleRableRowHeight
        
        self.articleTableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleCellID")
        
        //Setup datasource
        self.articleTableView.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.articleTableView.reloadData()
        }
        // Fetch article if network available
        //Utility.isConnectedToNetwork() ? fetchArticle() : showAlertWithMessgae(message: kNoNetworkErrorMessgae)
        fetchArticle()
    }
    
    func fetchArticle() {
        self.waitIndicator.startAnimating()
        self.viewModel.fetchArticles({[weak self] result in
            
            self?.waitIndicator.stopAnimating()
            
            switch result{
            case .failure(let error):
                self?.showAlertWithMessgae(message: error.localizedDescription)
                
            default:
                NSLog("sucess")
            }
        })
    }
    
    //MARK:- Alert
    func showAlertWithMessgae(message:String) {
        let alertView = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
        let action = UIAlertAction(title: kOkButtonTitle, style: .default, handler: nil)
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }
}

//MARK:- Extension for TableViewDelegate handling
extension ViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        self.performSegue(withIdentifier: kArticleDetailSegue, sender: self.dataSource.data.value[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kArticleDetailSegue {
            let articleDetailVC = segue.destination as? ArticleDetailViewController
            articleDetailVC?.articleCellViewModel = sender as? ArticleCellViewModel
        }
    }
    
}


