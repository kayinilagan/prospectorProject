//
//  ArticleViewController.swift
//  prospectorProject
//
//  Created by period3 on 11/1/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit
//bobby has died
//This is an extension that converts the content and description from html format to the format we need to be able to put it in a text view or label, plz no touch or I will euthanize you - Jack

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}



class ArticleViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    
    
 
    
    var articleSource = [String:String]()
    var contentString: String!
    

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var articleCollectionView: UICollectionView!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let homePageQuery = "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fprospectornow.com%2F%3Ffeed%3Drss2"
                            //https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fprospectornow.com%2F%3Ffeed%3Drss2
        

        
        
        
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
            print("We're parsing babey")
            let Articletitle = result["title"].stringValue
            let pubDate = result["pubDate"].stringValue
            let Articledescription = result["description"].stringValue
            var content = result["content"].stringValue
           // var source = [Articletitle:"title", pubDate:"pubDate", Articledescription:"description", content: "content"]
            //DO NOT TOUCH THIS OR JACK WILL KILL YOU nicely
//            articleTextView.text = content.htmlToString
//            dateLabel.text = pubDate
//
    
        }
      
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = articleCollectionView.dequeueReusableCell(withReuseIdentifier: "article", for: indexPath) as! ArticleCollectionViewCell
        articleCollectionView.reloadData()
        let source = articleSource[indexPath.row]
        cell.articleTextView.text = contentString?.htmlToString
        print("bobby sucks")
        return cell
        }
    
    

  
}
