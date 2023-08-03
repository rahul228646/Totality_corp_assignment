//
//  PopUpCardContent1.swift
//  TotalityCorpAssignment
//
//  Created by rahul kaushik on 01/08/23.
//

import SwiftUI

struct PopUpCardContent1: View {
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle().fill(.green)
                        .padding(10)
                    Text("5")
                        .bold()
                        .foregroundColor(.white)
                        .font(.title)
                }
                ZStack {
                    Circle().fill(.gray)
                        .padding(10)
                    Text("10")
                        .bold()
                        .foregroundColor(.white)
                        .font(.title)
                }
                ZStack {
                    Circle().fill(.gray)
                        .padding(10)
                    Text("15")
                        .bold()
                        .foregroundColor(.white)
                        .font(.title)
                }
            }
            .frame(width: 340)
            .padding(40)
            
        }
    }
}

struct PopUpCardContent1_Previews: PreviewProvider {
    static var previews: some View {
        PopUpCardContent1()
    }
}
