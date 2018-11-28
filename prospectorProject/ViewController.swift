//  ViewController.swift
//  prospectorProject
//  Created by period3 on 10/26/18.

//  Copyright © 2018 period3. All rights reserved.
//
import UIKit
import NotificationCenter

var articleInfo: ArticleInfo!



class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
 
    
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var primeView: UIView!
    
    var hamburgerIsVisible = false
    
    var sources = [[String: String]]()
    var articleArray = [ArticleInfo]()
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool){
       mainCollectionView.reloadData()
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        spinner.isHidden = true
        let logo = UIImage(named: "prospectorLogol")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        let homePageQuery = "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fprospectornow.com%2F%3Ffeed%3Drss2"
        
        if let url = URL(string: homePageQuery)
        {
            if let data = try? Data(contentsOf: url)
            {
                let json = try! JSON(data: data)
                if json["status"] == "ok"
                {
                    parse(json: json)
                    return
                }
            
                
            }
            
            
        }
        
//        mainCollectionView.reloadData()
        
        
     
    }
    
    @IBAction func hamburgerButton(_ sender: UIBarButtonItem) {
        if !hamburgerIsVisible
        {
            leadingC.constant = 129
            trailingC.constant = -129
            hamburgerIsVisible = true
        }
        else
        {
            leadingC.constant = 0
            trailingC.constant = 0
            hamburgerIsVisible = false
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("The animation is complete!")
        }
        mainCollectionView.reloadData()
    }
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int
//    {
//        return articleArray.count
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
       let source = sources[indexPath.row]
        cell.articleLabel.text = source["title"]
        cell.articleDateLabel.text = source["pubDate"]
        
        print("bobby sucks")
        
        return cell
    }
    
    func parse(json: JSON)
    {
        
        for result in json["items"].arrayValue
        {
            spinner.isHidden = false
            spinner.startAnimating()
            let title = result["title"].stringValue
            let pubDate = result["pubDate"].stringValue
            let description = result["description"].stringValue
            let content = result["content"].stringValue
            let articleThumbnail = result["thumbnail"].stringValue
            let source = ["title":title, "pubDate":pubDate, "description": description, "content":content]
            sources.append(source)
            spinner.stopAnimating()
            spinner.isHidden = true
            
          
        }
        
  
    }
    
    
    
    
    
    

}
