//
//  ArticleInfoClass.swift
//  prospectorProject
//
//  Created by period3 on 11/8/18.
//  Copyright © 2018 period3. All rights reserved.
//

import Foundation
import UIKit

class ArticleInfo
{
    var articleTitle:String!
    var articleDate:String!
    var articleThumbnail: UIImage!
    
    
    init(articleTitle:String, articleDate:String, articleThumbnail: UIImage)
    {
        self.articleTitle = articleTitle
        self.articleDate = articleDate
        self.articleThumbnail = articleThumbnail
    }
    
}
