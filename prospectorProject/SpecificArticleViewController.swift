//
//  SpecificArticleViewController.swift
//  prospectorProject
//
//  Created by period3 on 2/15/19.
//  Copyright © 2019 period3. All rights reserved.
//

import UIKit

class SpecificArticleViewController: UIViewController {
    
    var specificArticle = [[String:String]]()
    var content0: String!
    

    @IBOutlet weak var articleTextView: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        for i in 0...specificArticle.count - 1
        {
            articleTextView.text = specificArticle[i]["content"]?.htmlToString
            print("over here kai")
            print(specificArticle.first?["content"]?.htmlToString)
        }
    }
    

    

}
