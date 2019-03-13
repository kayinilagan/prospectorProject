//
//  CollectionViewCell.swift
//  prospectorProject
//
//  Created by period3 on 10/29/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit
import CollectionViewSlantedLayout
// For Main ViewController

let yOffsetSpeed: CGFloat = 150.0
let xOffsetSpeed: CGFloat = 100.0

class CollectionViewCell: CollectionViewSlantedCell
{
    
    var articleTitle: String!
    var articleThumbnail: UIImage!
    var articleDate: String!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var articleLabel: UILabel!
    
    @IBOutlet weak var articleDateLabel: UILabel!
    
    private var gradient = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let backgroundView = backgroundView {
            gradient.colors = [UIColor.clear.cgColor, UIColor.prospectBlue.cgColor]
            gradient.locations = [0.0, 1.1]
            gradient.frame = backgroundView.bounds
            backgroundView.layer.addSublayer(gradient)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let backgroundView = backgroundView {
            gradient.frame = backgroundView.bounds
        }
    }
    
    var image: UIImage = UIImage() {
        didSet {
            imageView.image = image
        }
    }
    
    var imageHeight: CGFloat {
        return (imageView?.image?.size.height) ?? 0.0
    }
    
    var imageWidth: CGFloat {
        return (imageView?.image?.size.width) ?? 0.0
    }
    
    func offset(_ offset: CGPoint) {
        imageView.frame = imageView.bounds.offsetBy(dx: offset.x, dy: offset.y)
    }

    

    
    
    

    
    
}


