//
//  CancelButton.swift
//  TotalityCorpAssignment
//
//  Created by rahul kaushik on 01/08/23.
//

import SwiftUI

struct CancelDoneButton: View {
    @Binding var symbol : String
    
    var body: some View {
        Image(systemName: "x.circle.fill")
            .foregroundStyle(.black, .yellow)
    }
}

struct CancelDoneButton_Previews: PreviewProvider {
    static var previews: some View {
        CancelDoneButton(symbol: .constant("checkmark.circle.fill"))
    }
}
