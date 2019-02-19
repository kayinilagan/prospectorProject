//
//  OpinionViewController.swift
//  prospectorProject
//
//  Created by period3 on 11/14/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit

// Does not work atm

class OpinionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    var arrayofArticlesOpinions = [[String: String]]()

    @IBOutlet weak var opinionTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayofArticlesOpinions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        let article = arrayofArticlesOpinions[indexPath.row]
        cell?.textLabel?.text = article["title"]
        return cell!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let nvc = segue.destination as! SpecificArticleViewController
        nvc.specificArticle = arrayofArticlesOpinions
    }

}
