//  ViewController.swift
//  prospectorProject
//  bobby died
//  Created by period3 on 10/26/18.
//  Copyright © 2018 period3. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
 
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        
    }

}

