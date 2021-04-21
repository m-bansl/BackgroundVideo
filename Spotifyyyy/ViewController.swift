//
//  ViewController.swift
//  Spotifyyyy
//
//  Created by Mehak Bansal on 21/04/21.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var videoView: UIView!
    
    @IBOutlet weak var signup: UIButton!
    
    @IBOutlet weak var signIN: UIButton!
    
    
    var player:AVPlayer?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        playVideo()
    }

    func playVideo(){
        guard let path = Bundle.main.path(forResource: "moments", ofType: "mp4") else {
            return
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        self.videoView.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        player.seek(to: CMTime.zero)
        player.play()
        player.isMuted = false
        
        playerLayer.zPosition = -1
        
    }
    
    @objc func playerItemDidReachEnd(){
        player?.seek(to: CMTime.zero)
        
        
    }
    
}

