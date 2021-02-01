import UIKit

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    var favorited:Bool = false
    var tweetId:Int = -1
    
    func setFavorite(_ isFavorited:Bool) {
        self.favorited = isFavorited
        
        if favorited {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    
    func setRetweeted(_ isRetweeted:Bool) {
        if isRetweeted {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: .normal)
            retweetButton.isEnabled = false
        }
        else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: .normal)
            retweetButton.isEnabled = true
        }
    }
    

    @IBAction func retweetButtonPressed(_ sender: Any) {
        
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Error is retweeting: \(error)")
        })

    }
    
    @IBAction func favButtonPressed(_ sender: Any) {
        
        let toBeFavorited = !favorited
        if toBeFavorited {
            
            setFavorite(true)
            
            TwitterAPICaller.client?.favTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
                print("Favorite succeed")
            }, failure: { (error) in
                print("Favorite did not succeed \(error)")
            })
        } else {
            
            setFavorite(false)
            
            TwitterAPICaller.client?.unFavTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
                print("Favorite succeed")
            }, failure: { (error) in
                print("UnFavorite did not succeed \(error)")
            })
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
