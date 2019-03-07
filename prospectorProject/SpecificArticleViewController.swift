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
    var specificArticleStruct: Article!

    @IBOutlet weak var specificImageView: UIImageView!
    @IBOutlet weak var articleTextView: UITextView!
    @IBOutlet weak var specificTitleLabe: UILabel!
    @IBOutlet weak var specificDateLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//
//        for i in 0...specificArticle.count - 1
//        {
//            articleTextView.text = specificArticle[i]["content"]?.htmlToString
////            articleTextView.text = content0
//            print("over here kai")
//        }
        specificTitleLabe.backgroundColor = UIColor.prospectBlue
        self.title = specificArticleStruct.title.htmlToString
        articleTextView.text = specificArticleStruct.content.htmlToString
        specificTitleLabe.text = specificArticleStruct.title.htmlToString
        specificDateLabel.text = specificArticleStruct.pubDate.htmlToString
    }
    

    

}
