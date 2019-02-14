//  ViewController.swift
//  prospectorProject
//  Created by period3 on 10/26/18.

//  Copyright © 2018 period3. All rights reserved.
//
import UIKit
import NotificationCenter
import OneSignal

var articleInfo: ArticleInfo!



class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //Parse Things (Helen's Code)
    var articles = [[String: String]]()
    var categories1 = [String]()
    var descriptions1 = [String]()
 
    var contentString1: String!
    
    // Notifications
    
    var oneSignal = OneSignal()

    //Side Menu + Loading Stuff
    
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var primeView: UIView!
    
    var hamburgerIsVisible = false
    
    // Article stuff for Parse (May Or May Not Be Working)
    
    var articleArray = [ArticleInfo]()
    
    // Collection View
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    // Side Menu
    
    override func viewWillAppear(_ animated: Bool){
       mainCollectionView.reloadData()
    }
    
    // ViewDidLoad
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        spinner.isHidden = true
        print(OneSignal.app_id())
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
        
        mainCollectionView.reloadData()
        
        
     
    }
    
    // Side Menu
    
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
    
    // Collection View Stuff
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return articles.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let source = articles[indexPath.row]
        cell.articleLabel.text = source["title"]
        cell.articleDateLabel.text = source["pubDate"]
        print("bobby sucks")
        return cell
    }
    
    //Parse Function
    
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
            let category = result["categories"].arrayValue
            let categories = String(result["categories"].arrayValue.count)


            let source = ["title":title, "pubDate":pubDate, "description": description, "content":content, "articleThumbnail": articleThumbnail, "categories": categories]
            articles.append(source)
            contentString1 = content
            spinner.stopAnimating()
            spinner.isHidden = true
            let itemTest = result["items[1].title"]
            print("We're parsing babey")
            print(itemTest)
            
            var count = category.count - 1
            
            for i in 0...count
            {
                categories1.append(category[i].stringValue)
            }
            
            for i in 0..<articles.count
            {
                descriptions1.append(articles[i].description)
                print("Right here!")
                // This for loop is adding all the content from the parse function into a description array
                // (Kai) I am trying to setup a array for a person to search a keyword and find articles that have the keyword in their description.
                // I have not figured it out yet, but I'm open to ideas
                // You can find the search button at the bottom
            }
            print(descriptions1)
            
        }

    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?)
//    {
//        let vc = segue.destination as! ArticleViewController
//        vc.articleSource = articles
//        vc.contentString = contentString1
//
//    }
    
    // Start of Helen's Code (Also please see top of Viewcontroller)
    var arrayHolder = [[String:String]]()
    
    // Trending

    @IBAction func trendingButton(_ sender: UIButton)
    {
        var holderC = [String]()
        var count = articles.count - 1
        
        for k in 0...(categories1.count - 1)
        {
            holderC.append(categories1[k])
        }
        
        for i in 0...count
        {
            var one = articles[i]
            var cValue = one["categories"]
            var cCount = Int(cValue!)! - 1
            for j in 0...cCount
            {
                if holderC[j] == "Trending"
                {
                    arrayHolder.append(one)
                    print(one)
                }
            }
            for k in 0...cCount
            {
                holderC.remove(at: 0)
            }
        }
        
    }
    
    // Sports
    
    var sportsArrayHolder = [[String: String]]()

    @IBAction func sportsButton(_ sender: UIButton)
    {
        var holderC = [String]()
        var count = articles.count - 1
        
        for k in 0...(categories1.count - 1)
        {
            holderC.append(categories1[k])
        }
        
        for i in 0...count
        {
            var one = articles[i]
            var cValue = one["categories"]
            var cCount = Int(cValue!)! - 1
            for j in 0...cCount
            {
                if holderC[j] == "Sports"
                {
                    sportsArrayHolder.append(one)
                }
            }
            for k in 0...cCount
            {
                holderC.remove(at: 0)
            }
        }
        
    }
    
    // Entertainment
    
    var entertainmentArrayHolder = [[String: String]]()

    @IBAction func entertainmentButton(_ sender: UIButton)
    {
        var holderC = [String]()
        var count = articles.count - 1
        
        for k in 0...(categories1.count - 1)
        {
            holderC.append(categories1[k])
        }
        
        for i in 0...count
        {
            var one = articles[i]
            var cValue = one["categories"]
            var cCount = Int(cValue!)! - 1
            for j in 0...cCount
            {
                if holderC[j] == "Entertainment"
                {
                    entertainmentArrayHolder.append(one)
                }
            }
            for k in 0...cCount
            {
                holderC.remove(at: 0)
            }
        }
        
    }
    
    // News
    
    var newsArrayHolder = [[String: String]]()

    @IBAction func newsButton(_ sender: UIButton)
    {
        var holderC = [String]()
        var count = articles.count - 1
        
        for k in 0...(categories1.count - 1)
        {
            holderC.append(categories1[k])
        }
        
        for i in 0...count
        {
            var one = articles[i]
            var cValue = one["categories"]
            var cCount = Int(cValue!)! - 1
            for j in 0...cCount
            {
                if holderC[j] == "News"
                {
                    newsArrayHolder.append(one)
                }
            }
            for k in 0...cCount
            {
                holderC.remove(at: 0)
            }
        }
        
    }
    
    // Features
    
    var featuresArrayHolder = [[String: String]]()

    @IBAction func featuresButton(_ sender: UIButton)
    {
        var holderC = [String]()
        var count = articles.count - 1
        
        for k in 0...(categories1.count - 1)
        {
            holderC.append(categories1[k])
        }
        
        for i in 0...count
        {
            var one = articles[i]
            var cValue = one["categories"]
            var cCount = Int(cValue!)! - 1
            for j in 0...cCount
            {
                if holderC[j] == "Features"
                {
                    featuresArrayHolder.append(one)
                }
            }
            for k in 0...cCount
            {
                holderC.remove(at: 0)
            }
        }
        
    }
    
    // Opinion
    
    var opinionArrayHolder = [[String: String]]()

    @IBAction func opinionButton(_ sender: UIButton)
    {
        var holderC = [String]()
        var count = articles.count - 1
        
        for k in 0...(categories1.count - 1)
        {
            holderC.append(categories1[k])
        }
        
        for i in 0...count
        {
            var one = articles[i]
            var cValue = one["categories"]
            var cCount = Int(cValue!)! - 1
            for j in 0...cCount
            {
                if holderC[j] == "Opinion"
                {
                    opinionArrayHolder.append(one)
                }
            }
            for k in 0...cCount
            {
                holderC.remove(at: 0)
            }
        }
        
    }
    
    // Other
    
    var otherArrayHolder = [[String: String]]()
    var realOtherArray = [[String: String]]()
    @IBAction func otherButton(_ sender: UIButton)
    {
        var holderC = [String]()
        var count = articles.count - 1
        
        for k in 0...(categories1.count - 1)
        {
            holderC.append(categories1[k])
        }
        
        for i in 0...count
        {
            var one = articles[i]
            var cValue = one["categories"]
            var cCount = Int(cValue!)! - 1
            for j in 0...cCount
            {
                if holderC[j] == "Other"
                {
                    otherArrayHolder.append(one)
                }
            }
            for k in 0...cCount
            {
                holderC.remove(at: 0)
            }
        }
        
    }
    
    // Who We Are
    
    @IBAction func whoWeAreButton(_ sender: UIButton)
    {
        var holderC = [String]()
        var count = articles.count - 1
        
        for k in 0...(categories1.count - 1)
        {
            holderC.append(categories1[k])
        }
        
        for i in 0...count
        {
            var one = articles[i]
            var cValue = one["categories"]
            var cCount = Int(cValue!)! - 1
            for j in 0...cCount
            {
                if holderC[j] == "Who We Are"
                {
                    arrayHolder.append(one)
                }
            }
            for k in 0...cCount
            {
                holderC.remove(at: 0)
            }
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //NEWS SEGUE
        if segue.identifier == "newsSegue"
        {
            print(arrayHolder)
            let nvc = segue.destination as! TrendingViewController
            var count1 = arrayHolder.count - 1
            
            if count1 > -1
            {
                for k in 0...count1
                {
                    nvc.arrayofArticlesNews.append(arrayHolder[k])
                }
            }
        } //the segue between the main view controller and the second view controller for news. In the second view controller, SpecificTypeofArticle view controller for news, an empty dictonary exists. All these segues store the articles assigned in a holder array from the button functions above into these dictonaries. They consist of the articles that are catorgized for each category. Ex: SpecificTypeofArticleViewController has an array called arrayofArticlesNews that all the articles that are "News" are stored in.
        
        else if segue.identifier == "opinionSegue"
        {
            let nvc = segue.destination as! OpinionViewController
            var count1 = opinionArrayHolder.count - 1
            
            if count1 > -1
            {
                for k in 0...count1
                {
                    nvc.arrayofArticlesOpinions.append(opinionArrayHolder[k])
                }
            }
        }
            
        else if segue.identifier == "entertainmentSegue"
        {
            let nvc = segue.destination as! EntertainmentViewController
            var count1 = entertainmentArrayHolder.count - 1
            
            if count1 > -1
            {
                for k in 0...count1
                {
                    nvc.arrayofArticlesEntertainment.append(entertainmentArrayHolder[k])
                }
            }
        }
            
        else if segue.identifier == "otherSegue"
        {
            let nvc = segue.destination as! OtherViewController
            var count1 = otherArrayHolder.count - 1
            var counter = 0
            
            for h in 0...count1
            {
                var tester = otherArrayHolder[h]
                
                for mo in 0...count1
                {
                    if tester == otherArrayHolder[mo]{
                        counter = counter + 1                    }
                }
                
                if counter <= 1 {
                    realOtherArray.append(tester)
                    print(realOtherArray.count)
                }
                counter = 0
            }
            
            var count2 = realOtherArray.count - 1
            
            if count2 > -1
            {
                for k in 0...count2
                {
                    nvc.arrayofArticlesOther.append(realOtherArray[k])
                    
                }
            }
        }
        else if segue.identifier == "featuresSegue"
        {
            let nvc = segue.destination as! FeaturesViewController
            var count1 = featuresArrayHolder.count - 1
            
            if count1 > -1
            {
                for k in 0...count1
                {
                    nvc.arrayofArticlesFeatures.append(featuresArrayHolder[k])
                }
            }
        }
        if segue.identifier == "sportsSegue"
        {
            let nvc = segue.destination as! SportsViewController
            var count1 = sportsArrayHolder.count - 1
            
            if count1 > -1
            {
                for k in 0...count1
                {
                    nvc.arrayofArticlesSports.append(sportsArrayHolder[k])
                }
            }
        }
            //table view segue
//        else if segue.identifier == "tableViewArticlesRecentSegue"
//        {
//            let nvc = segue.destination as! TableViewViewController
//            let index = issueView.indexPathForSelectedRow?.row
//            nvc.article = articles[index!]
//        }
    }
    
    // Search Button
    
    @IBAction func searchButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Search", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField { (UITextField) in
            UITextField.placeholder = "What are you looking for?"
            
            alert.addAction(UIAlertAction(title: "Search", style: .default, handler: { (action) in
                if let keyword = alert.textFields?.first?.text {
                    print("Your keyword: \(keyword)")
                    
                }
            }))
        }
        
        self.present(alert, animated: true)
    }
    
    
    
    
    
    
    

}
