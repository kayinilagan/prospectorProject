//
//  CollectionViewCell.swift
//  prospectorProject
//
//  Created by period3 on 10/29/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit
// For Main ViewController

class CollectionViewCell: UICollectionViewCell
{
    var articleTitle: String!
    var articleThumbnail: UIImage!
    var articleDate: String!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var articleLabel: UILabel!
    
    @IBOutlet weak var articleDateLabel: UILabel!
}
