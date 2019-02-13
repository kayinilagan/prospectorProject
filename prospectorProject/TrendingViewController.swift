//
//  TrendingViewController.swift
//  prospectorProject
//
//  Created by period3 on 11/14/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit

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

}
