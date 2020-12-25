//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Anirudh Sohil on 24/12/20.
//  Copyright © 2020 Anirudh Sohil. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    // MARK: Button Decleration
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    // MARK: Variable Decleration
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    // MARK: Button Type-Casting
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    // MARK: View Loading confimation
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stopBtnStretching(var: slowButton)
        stopBtnStretching(var: fastButton)
        stopBtnStretching(var: highPitchButton)
        stopBtnStretching(var: lowPitchButton)
        stopBtnStretching(var: echoButton)
        stopBtnStretching(var: reverbButton)
        stopBtnStretching(var: stopButton)
        
        setupAudio()
    }
    
    // MARK: Play Sounds for button with designated enum
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
            case .slow:
                playSound(rate: 0.5)
            case .fast:
                playSound(rate: 1.5)
            case .chipmunk:
                playSound(pitch: 1000)
            case .vader:
                playSound(pitch: -1000)
            case .echo:
                playSound(echo: true)
            case .reverb:
                playSound(reverb: true)
            }

            configureUI(.playing)
    }

    // MARK: Stop Playing Audio
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }
    
    // MARK: View Will appear confirmation
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    // MARK: Stop Button streaching helper
    func stopBtnStretching(`var` button: UIButton!) {
        button.contentMode = .center
        button.imageView?.contentMode = .scaleAspectFit
    }

}
