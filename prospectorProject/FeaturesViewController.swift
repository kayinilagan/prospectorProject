//
//  FeaturesViewController.swift
//  prospectorProject
//
//  Created by period3 on 11/14/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit

class FeaturesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var arrayofArticlesFeatures = [[String: String]]()

    @IBOutlet weak var featuresTableView: UITableView!
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayofArticlesFeatures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        let article = arrayofArticlesFeatures[indexPath.row]
        cell?.textLabel?.text = article["title"]
        return cell!
    }
}
