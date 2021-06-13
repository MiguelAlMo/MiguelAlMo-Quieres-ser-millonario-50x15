//
//  TimerCounter.swift
//  _50 x 15_
//
//  Created by Miguel Alarcon on 12/6/21.
//

import UIKit

var timeSeconds = 60
var timer: Timer?

func timerFunc(label: UILabel){
    
    timer?.invalidate()
    timeSeconds = 60
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
        print("timer fired!")
        
        timeSeconds -= 1
        
        label.text = String(timeSeconds)
        print(timeSeconds)
        
        if(timeSeconds == 0){
            timer.invalidate()
        }
    }
}
