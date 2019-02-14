//
//  SportsViewController.swift
//  prospectorProject
//
//  Created by period3 on 11/14/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit

// Does not work atm

class SportsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    
    var arrayofArticlesSports = [[String: String]]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        

     
    }
    
    @IBOutlet weak var sportTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayofArticlesSports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        let article = arrayofArticlesSports[indexPath.row]
        cell?.textLabel?.text = article["title"]
        return cell!
    }
    
   

}
