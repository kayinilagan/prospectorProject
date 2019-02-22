//
//  TrendingViewController.swift
//  prospectorProject
//
//  Created by period3 on 11/14/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit

// Does not work atm

class TrendingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var arrayofArticlesNews = [[String: String]]()


    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    

    @IBOutlet weak var trendingTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayofArticlesNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        let article = arrayofArticlesNews[indexPath.row]
        print(article)
        cell?.textLabel?.text = article["title"]
        print(cell?.textLabel?.text)
        return cell!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let nvc = segue.destination as! SpecificArticleViewController
        let index = trendingTableView.indexPathForSelectedRow?.row
        nvc.specificArticle = arrayofArticlesNews
        nvc.content0 = arrayofArticlesNews[index!]["content"]!    }
}


