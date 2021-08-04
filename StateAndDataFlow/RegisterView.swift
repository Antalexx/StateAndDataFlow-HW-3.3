//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexander Antonenko on 03.08.2021.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    
    private var gradientOne = LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
    private var gradientTwo = LinearGradient(gradient: Gradient(colors: [Color.primary, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
    
    private var nameCount: Int {
        name.count
    }
    
    var body: some View {
        
        VStack {
            ZStack{
                Image("magball")
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 50)
                    .font(.headline)
                    .foregroundColor(.white)
                Text("\(nameCount)")
                    .frame(width: 30, height: 30)
                    .font(.headline)
                    .foregroundColor( nameCount < 3 ? .red : .white )
            }.frame(width: 270, height: 50)
            .background(gradientTwo)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(gradientOne, lineWidth: 4))
            .onTapGesture {UIApplication.shared.endEditing()}
            
            
            Button(action: registerUser, label: {
                HStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.white)
                        .font(.headline)
                    Text("OK")
                        .foregroundColor(.white)
                        .font(.headline)
                }.background(gradientTwo).cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(gradientOne, lineWidth: 2))
            })
            .disabled(nameCount < 3 ? true : false)
            .offset(x: 0, y: 50)
        }.background(Image("MobWall").blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/))
        }
    }
}


extension RegisterView {
    func  registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegistered = true
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView().environmentObject(UserManager())
    }
}
extension UIApplication {
    func endEditing() {
        sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
