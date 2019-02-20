//
//  SearchViewController.swift
//  prospectorProject
//
//  Created by period3 on 2/20/19.
//  Copyright © 2019 period3. All rights reserved.
//

import UIKit

class SearchViewController: ViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var data = [String]()
    
    var filteredData = [String]().self
    
    override func viewDidLoad() {
        self.title = "PROSPECTORNOW"
        super.viewDidLoad()
        searchCollectionView.dataSource = self
        searchBar.delegate = self
        filteredData = data
      
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as! CollectionViewCell
        cell.articleLabel.text = filteredData[indexPath.row]
        return cell
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // When there is no text, filteredData is the same as the original data
        // When user has entered text into the search box
        // Use the filter method to iterate over all items in the data array
        // For each item, return true if the item should be included and false if the
        // item should NOT be included
        filteredData = searchText.isEmpty ? data : data.filter { (item: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        searchCollectionView.reloadData()
    }

}
