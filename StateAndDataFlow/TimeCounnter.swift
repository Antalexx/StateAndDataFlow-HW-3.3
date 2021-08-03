//
//  TimeCounnter.swift
//  StateAndDataFlow
//
//  Created by Alexander Antonenko on 03.08.2021.
//

import Combine
import Foundation

class TimerCounter: ObservableObject  {
    let objectWillChange = PassthroughSubject<TimerCounter, Never>()
    
    var counter = 5
    var timer: Timer?
    var buttonTitle = "Start"
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        
        buttonDidTap()
    }
    private func buttonDidTap() {
        if buttonTitle == "Reset" {
            counter = 5
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        
        objectWillChange.send(self)
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killtimer()
            buttonTitle = "Reset"
        }
        
        objectWillChange.send(self)
    }
    
    private func killtimer() {
        timer?.invalidate()
        timer = nil
    }
}
