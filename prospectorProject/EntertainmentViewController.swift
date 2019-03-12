//
//  EntertainmentViewController.swift
//  prospectorProject
//
//  Created by period3 on 11/14/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit



class EntertainmentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var arrayofArticlesEntertainment = [[String: String]]()

    var loadCounter = 0

    @IBOutlet weak var entertainmentTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool)
    {
        entertainmentTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayofArticlesEntertainment.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        let article = arrayofArticlesEntertainment[indexPath.row]
        cell?.textLabel?.text = article["title"]
        return cell!
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let nvc = segue.destination as! SpecificArticleViewController
        let index = entertainmentTableView.indexPathForSelectedRow?.row
        nvc.specificArticle = arrayofArticlesEntertainment
        nvc.content0 = arrayofArticlesEntertainment[index!]["content"]!    }

    

}
