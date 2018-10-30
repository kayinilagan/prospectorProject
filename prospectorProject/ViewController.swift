//  ViewController.swift
//  prospectorProject
//  bobby died
//  Created by period3 on 10/26/18.

//  Copyright © 2018 period3. All rights reserved.
//
import UIKit
import NotificationCenter

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
 
    
    var sources = [[String: Any]]()
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let homePageQuery = "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fprospectornow.com%2F%3Ffeed%3Drss2"
        
        if let url = URL(string: homePageQuery)
        {
            if let data = try? Data(contentsOf: url)
            {
                let json = try! JSON(data: data)
                if json["status"] == "ok"
                {
                    parse(json: json)
                    return
                }
            
                
            }
        }

     
    }
    
    func widgetList(_ list: NCWidgetListViewController, viewControllerForRow row: Int) -> NSViewController {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func parse(json: JSON)
    {
        for result in json["items"].arrayValue
        {
            let title = result["title"].stringValue
            let pubDate = result["pubDate"].stringValue
            let description = result["description"].stringValue
            let source = [title:"title", pubDate:"pubDate", description:"description"]
            
        }
        
    }

}

