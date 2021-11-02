//
//  ViewController.swift
//  GameOfTheSpinnerWheel
//
//  Created by 江庸冊 on 2021/11/2.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    @IBOutlet weak var wheelImageView: wheelImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startButton(_ sender: UIButton) {
        messageLabel.text = "Started Good Luck"
        playSound(name: "spinwheel")
        //播放各種音效
        func playSound(name:String){
            if let url = Bundle.main.url(forResource: name, withExtension: "mp3") {
                self.player = try? AVAudioPlayer(contentsOf: url)
                self.player?.play()
            }
        }
        
        //讓視窗彈跳與連結wheelImageView的動畫
        wheelImageView.rotateGradually { resule in
            let alertContoller = UIAlertController(title: "Your Number is \(resule)", message: nil, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertContoller.addAction(okAction)
            
            self.present(alertContoller,animated: true)
            
            playSound(name: "win")
            
        }
    }
}

