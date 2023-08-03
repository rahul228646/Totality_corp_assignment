//
//  ContentView.swift
//  animations
//
//  Created by rahul kaushik on 31/07/23.
//

import SwiftUI

struct ProgressBar: View {
    @State var percent : CGFloat = 0.00
    @State var timer: Timer? = nil
    @State var timerIsPaused : Bool = true
    
    var body: some View {
        CustomProgressButton(percent: self.$percent)
            .animation(.linear)
            .onTapGesture {
                startTimer()
            }
    }
    
    func startTimer(){
      timerIsPaused = false
      timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
          if percent == 1 {
              stopTimer()
          }
          else {
              percent += 0.25
          }
      }
    }
    
    func stopTimer(){
      timerIsPaused = true
      timer?.invalidate()
      timer = nil
    }
  }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}


struct CustomProgressButton : View {
    @Binding var percent : CGFloat
    var body: some View {
        ZStack(alignment: .leading) {
            ZStack(alignment: .center) {
                Capsule()
                    .fill(Color("Color1"))
                    .frame(height: 40)
            }
            Capsule()
                .fill(.green)
                .frame(width: calPercent(), height: 40)
            HStack {
                Spacer()
                Text(String(format: "%.0f", self.percent*100) + " / 100 MB")
                    .foregroundColor(.black)
                    .font(.system(size: 24))
                    .bold()
                Spacer()
            }
            
        }
        
    }
    func calPercent ()->CGFloat {
        let width = UIScreen.main.bounds.width
        return width * self.percent
    }
}
