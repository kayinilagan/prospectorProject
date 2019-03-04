//
//  OtherViewController.swift
//  prospectorProject
//
//  Created by period3 on 11/14/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit

// Does not work atm

class OtherViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var arrayofArticlesOther = [[String: String]]()


    override func viewDidLoad()
    {
        super.viewDidLoad()

        
      
    }
    
    @IBOutlet weak var otherTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayofArticlesOther.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        let article = arrayofArticlesOther[indexPath.row]
        if article.isEmpty == true
        {
            cell?.textLabel?.text = "No Articles at This Time"
        }
        else
        {
        cell?.textLabel?.text = article["title"]
        }
        return cell!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let nvc = segue.destination as! SpecificArticleViewController
        let index = otherTableView.indexPathForSelectedRow?.row
        nvc.specificArticle = arrayofArticlesOther
        nvc.content0 = arrayofArticlesOther[index!]["content"]!
    }
   

}
