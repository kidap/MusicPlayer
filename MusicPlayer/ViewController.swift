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
    @IBOutlet var musicSlider: UISlider!
    @IBOutlet var volumeSlider: UISlider!
    
    
    @IBOutlet var playPauseButton: UIBarButtonItem!
    
    
    //MARK : Functions
    @IBAction func playPauseMusic(sender: AnyObject) {
        
        //If music is playing, pause it
        if isPlaying{
            player.pause()
            //isPlaying = false
            //If music is not playing, play it
        } else {
            player.play()
            //isPlaying = true
        }
    }
    
    @IBAction func stopMusic(sender: AnyObject) {
        player.stop()
    }
    @IBAction func musicSliderMoved(sender: AnyObject) {
    }
    
    @IBAction func volumeSliderMoved(sender: AnyObject) {
        player.volume = volumeSlider.value
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Instantiate the audio player
        do{
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!))
        } catch {
            print("Unable to load AVAudioPlayer")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

