//  ViewController.swift
//  prospectorProject
//  bobby died again
//  Created by period3 on 10/26/18.

//  Copyright © 2018 period3. All rights reserved.
//
import UIKit
import NotificationCenter

var articleInfo: ArticleInfo!



class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
 
    
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    
    @IBOutlet weak var primeView: UIView!
    
    var hamburgerIsVisible = false
    
    var sources = [[String: String]]()
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool){
       mainCollectionView.reloadData()
    }
    
    var articleArray : [ArticleInfo] = []

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
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
   

        
        
     
    }
    
    @IBAction func hamburgerButton(_ sender: UIBarButtonItem) {
        if !hamburgerIsVisible
        {
            leadingC.constant = 150
            trailingC.constant = -150
            hamburgerIsVisible = true
        }
        else
        {
            leadingC.constant = 0
            trailingC.constant = 0
            hamburgerIsVisible = false
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("The animation is complete!")
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let article = articleArray[indexPath.row]
        
        
        return cell
    }
    
    func parse(json: JSON)
    {
        
        for result in json["items"].arrayValue
        {
            let title = result["title"].stringValue
            let pubDate = result["pubDate"].stringValue
            let description = result["description"].stringValue
            let content = result["content"].stringValue
            let articleThumbnail = result["thumbnail"].stringValue
            


        }
        
  
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ArticleViewController
        

    }
    
    
    
    
    

}

