//
//  PopUpContent2.swift
//  TotalityCorpAssignment
//
//  Created by rahul kaushik on 01/08/23.
//

import SwiftUI

struct PopUpCardContent2: View {
    var body: some View {
        VStack {
            Text("Ready To Play?")
                .font(.title)
                .padding(10)
            
            Text("OSWALD")
                .font(.title)
            
            Rectangle().fill(.gray)
                .frame(width: 200, height: 40)
                .padding(10)
            Capsule().fill(.gray)
                .frame(width: 200, height: 40)
                .padding(10)
            
        }
    }
}

struct PopUpCardContent2_Previews: PreviewProvider {
    static var previews: some View {
        PopUpCardContent2()
    }
}
