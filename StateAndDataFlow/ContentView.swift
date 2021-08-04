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
            Spacer()
            Text("Приветствую тебя !")
                .font(.largeTitle)
                .foregroundColor(.white)
            Text("\(user.name)")
                .font(.largeTitle)
                .foregroundColor(.white)
            Text("Задай вопрос и я помогу тебе!")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
            
            Spacer()
            
            ZStack {
//                Circle().frame(width: 300, height: 300).background(RadialGradient(gradient: Gradient(colors: [Color.blue, Color.black, Color.black, Color.white]), center: .center, startRadius: 1, endRadius:250)).foregroundColor(.clear).cornerRadius(1000).overlay(Circle().stroke(Color.white, lineWidth: 4))
                Image("magball").resizable().frame(width: 350, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("\(timer.counter)")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.custom("FONT_NAME", size: 60))
                Text("\(timer.rnd)")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.custom("FONT_NAME", size: 40))
                    .background(RadialGradient(gradient: Gradient(colors: [Color.blue, Color.black, Color.black]), center: .center, startRadius: 20, endRadius:100)).cornerRadius(300)
            }
               
            Spacer()
            
            ButtonView(timer: timer).padding()
            ButtonLogout(isRegister: $user.isRegistered)
            
        }.background(Image("bckgr3")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                        .blur(radius: 1))
        .edgesIgnoringSafeArea(.all)
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
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            }
        )
        .frame(width: 200, height: 60)
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.primary]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(RadialGradient(gradient: Gradient(colors: [Color.black, Color.yellow]), center: .center, startRadius: 20, endRadius:100), lineWidth: 4))
    }
}

struct ButtonLogout: View {
    @Binding var isRegister: Bool
    
    var body: some View {
        VStack {
            Button(action: { self.isRegister = false }) {
                Text("Прощай")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            .frame(width: 200, height: 60)
            .background(LinearGradient(gradient: Gradient(colors: [Color.primary, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(RadialGradient(gradient: Gradient(colors: [Color.black, Color.yellow]), center: .center, startRadius: 20, endRadius:100), lineWidth: 4))
        }
    }
}

