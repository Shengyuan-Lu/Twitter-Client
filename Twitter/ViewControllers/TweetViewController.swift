//
//  TweetViewController.swift
//  Twitter
//
//  Created by Shengyuan Lu on 2/1/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tweetTextView.becomeFirstResponder()
        tweetTextView.backgroundColor = .systemGray6
        tweetTextView.layer.cornerRadius = 20
        
    }
    @IBOutlet weak var tweetTextView: UITextView!
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tweetButtonTapped(_ sender: Any) {
        if !tweetTextView.text.isEmpty {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("ERROR posting tweet")
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    

}
