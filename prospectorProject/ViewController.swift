//bobby died
//  ViewController.swift
//  prospectorProject
//
//  Created by period3 on 10/26/18.
//  Copyright © 2018 period3. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
 

    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("hello")
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
    }
    

}

