//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by Geo on 9/22/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    @IBAction func onLogout(_ sender: Any) {
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil)
        
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
    
    
    var tweetArray = [NSDictionary]()
    
    var numberOfTweets: Int!
    
    
    func loadTweet() {
        
        let tweets_url = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        
        let params = ["count": 10]
        
        TwitterAPICaller.client?.getDictionariesRequest(url: tweets_url, parameters: params, success: { (tweets: [NSDictionary]) in
            
            self.tweetArray.removeAll()
            
            for tweet in tweets {
                
                self.tweetArray.append(tweet)
                
            }
            
            self.tableView.reloadData()
            
        }, failure: { (Error) in
            print("failed pulling tweets")
            print(Error)
        })
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetCellTableViewCell
        
        cell.usernameLabel.text = "Some Name"
        
        cell.tweetContent.text = "Yes"
                
//                tweetArray[indexPath.row]["text"] as? String
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTweet()
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 5
//            tweetArray.count
    }

   

}
