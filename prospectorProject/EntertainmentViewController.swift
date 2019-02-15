//
//  EntertainmentViewController.swift
//  prospectorProject
//
//  Created by period3 on 11/14/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit

// Does not work atm

class EntertainmentViewController: UIViewController {
    var arrayofArticlesEntertainment = [[String: String]]()

    @IBOutlet weak var entertainmentTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        

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
    

    

}
