//
//  ArticleViewController.swift
//  prospectorProject
//
//  Created by period3 on 11/1/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController
{
    var articleSource = [String:String]()

    @IBOutlet weak var articleTextView: UITextView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
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
    
    func parse(json: JSON)
    {
        for result in json["items"].arrayValue
        {
            let Articletitle = result["title"].stringValue
            let pubDate = result["pubDate"].stringValue
            let Articledescription = result["description"].stringValue
            let content = result["content"].stringValue
            
            var source = [Articletitle:"title", pubDate:"pubDate",description:"description"]
            
            articleTextView.text = content
            self.title = title
            dateLabel.text = pubDate
            descriptionLabel.text = Articletitle
            print(Articledescription)
        }
        
      
    }

  
}
