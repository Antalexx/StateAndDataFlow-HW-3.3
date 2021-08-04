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
    
    var counter = 8
    var timer: Timer?
    var buttonTitle = "Спрашивай!"
    var rnd = ""
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 0.4,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        
        buttonDidTapped()
    }
    private func buttonDidTapped() {
        if buttonTitle == "Еще?" {
            rnd = ""
            counter = 8
            buttonTitle = "Спрашивай!"
        } else {
            buttonTitle = "Погоди ка"
        }
        
        objectWillChange.send(self)
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killtimer()
            random()
            buttonTitle = "Еще?"
        }
                
        objectWillChange.send(self)
        
    }
    
    private func killtimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func random() {
        let x = Int.random(in: 0...4)
        switch x {
        case 1:
            rnd = "Да!"
        case 2:
            rnd = "Нет!"
        case 3:
            rnd = "Возможно"
        case 4:
            rnd = "..."
        default:
            break
        }  
    }
}
