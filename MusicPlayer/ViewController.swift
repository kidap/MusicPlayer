//
//  ViewController.swift
//  MediaPlayer
//
//  Created by Karlo Pagtakhan on 01/12/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK : Variables
    var player: AVAudioPlayer = AVAudioPlayer()
    var isPlaying = false
    var updater : CADisplayLink! = nil
    @IBOutlet var musicTime: UILabel!
    
    
    @IBOutlet var musicSlider: UISlider!
    @IBOutlet var volumeSlider: UISlider!
    
    
    @IBOutlet var playPauseButton: UIBarButtonItem!
    
    
    //MARK : Functions
    @IBAction func playPauseMusic(sender: AnyObject) {
        
        //If music is playing, pause it
        if isPlaying{
            player.pause()
            isPlaying = false
            //If music is not playing, play it
        } else {
            player.play()
            isPlaying = true
        }
        
        updater = CADisplayLink(target: self, selector: Selector("trackAudio"))
        updater.frameInterval = 1
        updater.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
        
    }
    
    @IBAction func stopMusic(sender: AnyObject) {
        player.stop()
    }
    @IBAction func musicSliderMoved(sender: AnyObject) {
        player.currentTime = Double(musicSlider.value * Float(player.duration))
    }
    
    @IBAction func volumeSliderMoved(sender: AnyObject) {
        player.volume = volumeSlider.value
    }
    
    func trackAudio(){
        var normalizedTime = Float(player.currentTime / player.duration)
        musicSlider.value = normalizedTime
        
        
        musicTime.text = "\(round(player.currentTime*100)/100) / \(round(player.duration*100)/100)"
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Instantiate the audio player
        do{
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!))
            musicSlider.value = 0
            musicTime.text = "\(player.currentTime) / \(round(player.duration*100)/100)"
        } catch {
            print("Unable to load AVAudioPlayer")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

