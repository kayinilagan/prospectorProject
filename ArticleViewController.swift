//
//  ArticleViewController.swift
//  prospectorProject
//
//  Created by period3 on 11/1/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit

//extension String {
//    var html2Attributed: NSAttributedString? {
//        do {
//            guard let data = data(using: String.Encoding.utf8) else {
//                return nil
//            }
//            return try NSAttributedString(data: data,
//                                          options: [.documentType: NSAttributedString.DocumentType.html,
//                                                    .characterEncoding: String.Encoding.utf8.rawValue],
//                                          documentAttributes: nil)
//        } catch {
//            print("error: ", error)
//            return nil
//        }
//    }
//}
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
            //DO NOT TOUCH THIS OR JACK WILL KILL YOU
            articleTextView.text = content.htmlToString
            descriptionLabel.text = Articledescription.htmlToString
            dateLabel.text = pubDate
            
            
          
            
            print(Articledescription.htmlToString)
        }
        
       
      
    }
    

  
}
