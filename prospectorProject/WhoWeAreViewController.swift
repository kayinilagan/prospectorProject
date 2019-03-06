//
//  WhoWeAreViewController.swift
//  prospectorProject
//
//  Created by period3 on 11/14/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit

// Does not work atm


class WhoWeAreViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var staffPictureArray = [#imageLiteral(resourceName: "Jenna"), #imageLiteral(resourceName: "Anthony 2"), #imageLiteral(resourceName: "Elizabeth"), #imageLiteral(resourceName: "Mara"), #imageLiteral(resourceName: "Grace-1"), #imageLiteral(resourceName: "Grace"), #imageLiteral(resourceName: "Hannah"), #imageLiteral(resourceName: "Wyatt"), #imageLiteral(resourceName: "Erik"), #imageLiteral(resourceName: "Blanca"), #imageLiteral(resourceName: "Mackenzie"), #imageLiteral(resourceName: "Anthony"), #imageLiteral(resourceName: "Connor"), #imageLiteral(resourceName: "Kate"), #imageLiteral(resourceName: "Danny"), #imageLiteral(resourceName: "Amanda"), #imageLiteral(resourceName: "Manisha"), #imageLiteral(resourceName: "Loser  Man"), #imageLiteral(resourceName: "Angelina"), #imageLiteral(resourceName: "Rick"), #imageLiteral(resourceName: "Ayse")]

  

    @IBOutlet weak var staffCollectionView: UICollectionView!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return staffPictureArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = staffCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = staffPictureArray[indexPath.row]
        
        return cell
    }
    

 

}
