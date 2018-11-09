//
//  CollectionViewCell.swift
//  prospectorProject
//
//  Created by period3 on 10/29/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit


class CollectionViewCell: UICollectionViewCell
{
    var cellSource = [String:String]()

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var articleLabel: UILabel!
    
    @IBOutlet weak var articleDateLabel: UILabel!
    
    
     func viewDidLoad()
    {
     
        viewDidLoad()
        
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
    
    func parse(json: JSON)
    {
        for result in json["items"].arrayValue
        {
            let title = result["title"].stringValue
            let pubDate = result["pubDate"].stringValue
            let description = result["description"].stringValue
            let content = result["content"].stringValue
            let picture = result["thumbnail"].stringValue
            var source = [title:"title", pubDate:"pubDate",description:"description"]
            
            
         
            
        
        }
        
        
    }
    
    
}


