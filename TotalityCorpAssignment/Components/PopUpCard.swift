//
//  PopUpCard.swift
//  TotalityCorpAssignment
//
//  Created by rahul kaushik on 01/08/23.
//

import SwiftUI

struct PopUpCard: View {
    
    @State var nxtScreen : Int = 0
    @State var text : String = "Next"
    @State var color : Color = .green
    var body: some View {

            
            VStack {
                if(nxtScreen == 0) {
                    Rectangle().fill(.gray)
                        .frame(width: 200, height: 40)
                        .padding(20)
                }
                else if (nxtScreen == 1) {
                    PopUpCardContent1()
                        .transition(.move(edge: .trailing))
                        .animation(.linear(duration: 0.3))
                    Text("Wallet Balance : ")
                }
                else {
                    
                    PopUpCardContent2()
                        .transition(.move(edge: .leading))
                        .animation(.linear(duration: 0.3))
                    Text("Wallet Balance : ")
                    
                }
                    
                
                Spacer()
                CustomButton(text: $text, color: $color)
                    .onTapGesture {
                        nxtScreen = nxtScreen + 1
                        if(nxtScreen > 1) {
                            text = "Confirm"
                            color = .black
                        }
                    }
                    .padding(40)
            }
    }
}

struct PopUpCard_Previews: PreviewProvider {
    static var previews: some View {
        PopUpCard()
    }
}
