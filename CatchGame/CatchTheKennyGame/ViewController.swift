//
//  ViewController.swift
//  CatchTheKennyGame
//
//  Created by Ali Pempe on 6.07.2022.
//

import UIKit

class ViewController: UIViewController {
    // views
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    
    
    // variables
    var score = 0
    var timer = Timer()
    var counter = 0
    
    var hideTimer = Timer()
    
    var kennyArray = [UIImageView]()

    var highScore = 0
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // highscore check
        
        let storedHighscore = UserDefaults.standard.object(forKey: "highscore")
        if storedHighscore == nil {
            highScore = 0
            highscoreLabel.text = "Highscore: \(highScore)"
            
        }
        
        if let newScore = storedHighscore as? Int {
            highScore = newScore
            highscoreLabel.text = "Highscore: \(highScore)"
        }
        
        
        scoreLabel.text = "Score: \(score)"
        
        // images
        
        image1.isUserInteractionEnabled = true
        image2.isUserInteractionEnabled = true
        image3.isUserInteractionEnabled = true
        image4.isUserInteractionEnabled = true
        image5.isUserInteractionEnabled = true
        image6.isUserInteractionEnabled = true
        image7.isUserInteractionEnabled = true
        image8.isUserInteractionEnabled = true
        image9.isUserInteractionEnabled = true
        
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        image1.addGestureRecognizer(recognizer1)
        image2.addGestureRecognizer(recognizer2)
        image3.addGestureRecognizer(recognizer3)
        image4.addGestureRecognizer(recognizer4)
        image5.addGestureRecognizer(recognizer5)
        image6.addGestureRecognizer(recognizer6)
        image7.addGestureRecognizer(recognizer7)
        image8.addGestureRecognizer(recognizer8)
        image9.addGestureRecognizer(recognizer9)
        
        kennyArray = [image1,image2,image3,image4,image5,image6,image7,image8,image9]
        
        // timer
        counter = 10
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
        
        hideKenny()
        
        }
    
    @objc func hideKenny(){
        for kenny in kennyArray{
            kenny.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
        kennyArray[random].isHidden = false
    }
    
    @objc func increaseScore(){
        score = score + 1
        scoreLabel.text = "Score: \(score)"
        
    }
    
    @objc func countDown(){
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for kenny in kennyArray{
                kenny.isHidden = true
            }
            
            // highscore
            
            if self.score > self.highScore{
                self.highScore = self.score
                highscoreLabel.text = "Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
                
            }
            
            
            
            
            

            // alert
            
            let alert = UIAlertController(title: "Time's UP!", message: "Do you want to play again.", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                // sonra yazılacak
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = "\(self.counter)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideKenny), userInfo: nil, repeats: true)
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
             
        }
    }
   

        

    
    
    
    
    
    
    
    
    
    
    
    
    // yorum satırı yazdım git kontrol edecem
    
    
    
    
    
    
    
    
    
    
    
    
  /*  @IBAction func buttonClicked(_ sender: Any) {
        let a = Int.random(in: 0..<10)
        
        if a == 1 {
            image1.image = UIImage(named: "indir" )
            image2.image = UIImage(named: "nil")
            image3.image = UIImage(named: "nil")
            image4.image = UIImage(named: "nil")
            image5.image = UIImage(named: "nil")
            image6.image = UIImage(named: "nil")
            image7.image = UIImage(named: "nil")
            image8.image = UIImage(named: "nil")
            image9.image = UIImage(named: "nil")
            
        }
        else if a == 2 {
            image1.image = UIImage(named: "nil" )
            image2.image = UIImage(named: "indir" )
            image3.image = UIImage(named: "nil")
            image4.image = UIImage(named: "nil")
            image5.image = UIImage(named: "nil")
            image6.image = UIImage(named: "nil")
            image7.image = UIImage(named: "nil")
            image8.image = UIImage(named: "nil")
            image9.image = UIImage(named: "nil")
        }
        else if a == 3 {
            image1.image = UIImage(named: "nil" )
            image2.image = UIImage(named: "nil" )
            image3.image = UIImage(named: "indir")
            image4.image = UIImage(named: "nil")
            image5.image = UIImage(named: "nil")
            image6.image = UIImage(named: "nil")
            image7.image = UIImage(named: "nil")
            image8.image = UIImage(named: "nil")
            image9.image = UIImage(named: "nil")
        }
        else if a == 4 {
            image1.image = UIImage(named: "nil" )
            image2.image = UIImage(named: "nil" )
            image3.image = UIImage(named: "nil")
            image4.image = UIImage(named: "indir")
            image5.image = UIImage(named: "nil")
            image6.image = UIImage(named: "nil")
            image7.image = UIImage(named: "nil")
            image8.image = UIImage(named: "nil")
            image9.image = UIImage(named: "nil")
        }
        else if a == 5 {
            image1.image = UIImage(named: "nil" )
            image2.image = UIImage(named: "nil" )
            image3.image = UIImage(named: "nil")
            image4.image = UIImage(named: "nil")
            image5.image = UIImage(named: "indir")
            image6.image = UIImage(named: "nil")
            image7.image = UIImage(named: "nil")
            image8.image = UIImage(named: "nil")
            image9.image = UIImage(named: "nil")
        }
        else if a == 6 {
            image1.image = UIImage(named: "nil" )
            image2.image = UIImage(named: "nil" )
            image3.image = UIImage(named: "nil")
            image4.image = UIImage(named: "nil")
            image5.image = UIImage(named: "nil")
            image6.image = UIImage(named: "indir")
            image7.image = UIImage(named: "nil")
            image8.image = UIImage(named: "nil")
            image9.image = UIImage(named: "nil")
        }
        else if a == 7 {
            image1.image = UIImage(named: "nil" )
            image2.image = UIImage(named: "nil" )
            image3.image = UIImage(named: "nil")
            image4.image = UIImage(named: "nil")
            image5.image = UIImage(named: "nil")
            image6.image = UIImage(named: "nil")
            image7.image = UIImage(named: "indir")
            image8.image = UIImage(named: "nil")
            image9.image = UIImage(named: "nil")
        }
        else if a == 8 {
            image1.image = UIImage(named: "nil" )
            image2.image = UIImage(named: "nil" )
            image3.image = UIImage(named: "nil")
            image4.image = UIImage(named: "nil")
            image5.image = UIImage(named: "nil")
            image6.image = UIImage(named: "nil")
            image7.image = UIImage(named: "nil")
            image8.image = UIImage(named: "indir")
            image9.image = UIImage(named: "nil")
        }
        else if a == 9 {
            image1.image = UIImage(named: "nil" )
            image2.image = UIImage(named: "nil" )
            image3.image = UIImage(named: "nil")
            image4.image = UIImage(named: "nil")
            image5.image = UIImage(named: "nil")
            image6.image = UIImage(named: "nil")
            image7.image = UIImage(named: "nil")
            image8.image = UIImage(named: "nil")
            image9.image = UIImage(named: "indir")
        }
    } */
    
}

