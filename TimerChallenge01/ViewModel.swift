//
//  ViewModel.swift
//  TimerChallenge01
//
//  Created by Asset Ryskul on 23.02.2023.
//

import Foundation

typealias BindType = () -> Void

protocol ViewModelProtocol {
    var counter: Float { get set }
    var bind: BindType? { get set }
    func timerStarted()
    func timerStopped()
    func reset()
    
}

class ViewModel: ViewModelProtocol {
    
    var counter: Float = 0.0
    var timer = Timer()
    var bind: BindType?
    
    func timerStarted() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { timer in
            self.updateTimer()
        })
    }
    
    func updateTimer() {
        self.counter += 0.1
        self.bind?()
        
    }
    
    func timerStopped() {
        self.timer.invalidate()
    }
    
    func reset() {
        self.counter = 0
        self.bind?()
        self.timer.invalidate()
    }
    
    
    
    
}
