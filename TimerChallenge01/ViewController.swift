//
//  ViewController.swift
//  TimerChallenge01
//
//  Created by Asset Ryskul on 23.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    
    var viewModel: ViewModelProtocol = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind = { [weak self] in
            guard let counter = self?.viewModel.counter else { return }
            self?.timerLabel.text = String(format: "%.1f", counter)
        }
        self.pauseButton.isEnabled = false
    }
    

    @IBAction func resetButton_Tapped(_ sender: UIButton) {
        viewModel.reset()
        self.pauseButton.isEnabled = false
        self.startButton.isEnabled = true
    }
    
    @IBAction func startButton_Tapped(_ sender: UIButton) {
        viewModel.timerStarted()
        self.pauseButton.isEnabled = true
        self.startButton.isEnabled = false
        
    }
    
    @IBAction func pauseButton_Tapped(_ sender: UIButton) {
        viewModel.timerStopped()
        self.pauseButton.isEnabled = false
        self.startButton.isEnabled = true
    }
    
}

