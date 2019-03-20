//
//  WhoWeAreViewController.swift
//  
//
//  Created by period3 on 3/19/19.
//

import UIKit

class WhoWeAreViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
  

    @IBOutlet weak var staffCollectionView: UICollectionView!
    
    var staffArray = [#imageLiteral(resourceName: "Angelina"), #imageLiteral(resourceName: "Wyatt"), #imageLiteral(resourceName: "Danny"), #imageLiteral(resourceName: "Elizabeth"), #imageLiteral(resourceName: "Amanda"), #imageLiteral(resourceName: "Jenna"), #imageLiteral(resourceName: "Manisha"), #imageLiteral(resourceName: "Mara"), #imageLiteral(resourceName: "Anthony"), #imageLiteral(resourceName: "Grace"), #imageLiteral(resourceName: "Loser  Man"), #imageLiteral(resourceName: "Grace-1"), #imageLiteral(resourceName: "Ayse"), #imageLiteral(resourceName: "Anthony 2"), #imageLiteral(resourceName: "Connor"), #imageLiteral(resourceName: "Rick"), #imageLiteral(resourceName: "Hannah"), #imageLiteral(resourceName: "Erik"), #imageLiteral(resourceName: "Blanca"), #imageLiteral(resourceName: "Mackenzie"), #imageLiteral(resourceName: "Kate") ]

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return staffArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = staffCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StaffCell
        let staff = staffArray[indexPath.row]
        cell.image.image = staff
        return cell
        
    }
    
    


}
