//
//  NewsViewController.swift
//  prospectorProject
//
//  Created by period3 on 3/1/19.
//  Copyright © 2019 period3. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var arrayofArticlesNews = [[String: String]]()
    
    @IBOutlet weak var newsTableView: UITableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayofArticlesNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        let article = arrayofArticlesNews[indexPath.row]
        cell?.textLabel?.text = article["title"]
        
        return cell!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let nvc = segue.destination as! SpecificArticleViewController
        let index = newsTableView.indexPathForSelectedRow?.row
        nvc.specificArticle = arrayofArticlesNews
        nvc.content0 = arrayofArticlesNews[index!]["content"]!
    }
}
