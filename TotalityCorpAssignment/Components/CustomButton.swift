//
//  CustomButton.swift
//  TotalityCorpAssignment
//
//  Created by rahul kaushik on 01/08/23.
//

import SwiftUI

struct CustomButton: View {
    @Binding var text : String
    @Binding var color : Color
    var body: some View {
        ZStack {
            Capsule()
                .fill(color)
                .frame(height: 60)
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 20))
                .bold()
            
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: .constant("TEST"), color: .constant(.blue))
    }
}
