//
//  ContentView.swift
//  CircularProgressBar
//
//  Created by Huynh Tan Phu on 3/9/20.
//  Copyright © 2020 Filesoft. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var circleProgress: CGFloat = 0.0
    
    var body: some View {
        VStack{
            ZStack {
                Circle()
                    .stroke(lineWidth: 15)
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 300)
                
                Circle()
                    .trim(from: 0, to: circleProgress)
                    .stroke(lineWidth: 15)
                    .rotation(.degrees(-90))
                    .foregroundColor(.blue)
                    .frame(width: 300, height: 300)
                
                Text(" \(Int(self.circleProgress * 100)) %")
                    .font(.system(size: 20))
                   
            }
            
            Button(action: { self.startTimer() }) {
                Text("Start Timer")
            }
        }
    }
    
    func startTimer() {
        let _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            withAnimation {
                if self.circleProgress >= 1.0 {
                    timer.invalidate()
                } else {
                    self.circleProgress += 0.01
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
