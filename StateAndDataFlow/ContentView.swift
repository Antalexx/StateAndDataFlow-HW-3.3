//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexander Antonenko on 03.08.2021.
//

import SwiftUI

struct ContentView: View {
     @StateObject private var timer = TimerCounter()
     @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            Text("Hi! \(user.name)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            
            Spacer()
            
            ButtonView(timer: timer)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserManager())
    }
}



struct ButtonView: View {
    @ObservedObject var timer: TimerCounter
    var body: some View {
        Button(
            action: { self.timer.startTimer() },
            label: { Text("\(timer.buttonTitle)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(.white)
            }
        )
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(Color.black, lineWidth: 4))
    }
}
