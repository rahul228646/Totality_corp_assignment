//
//  cardContent.swift
//  TotalityCorpAssignment
//
//  Created by rahul kaushik on 31/07/23.
//

import Foundation
import SwiftUI

struct CardContent : Identifiable, Hashable{
    let id = UUID()
    let logo: String
    let images: [String]
    let title: String
    let description: String
   
}

struct CardList {
    
    static let list = [
        CardContent(logo : "candyCrush", images: ["cc1", "cc2", "cc3"], title: "Candy Crush", description: "Candy Crush Saga is a free-to-play tile-matching video game released by King on April 12, 2012, originally for Facebook; other versions for iOS, Android, Windows Phone, and Windows 10 followed. It is a variation of their browser game Candy Crush."),
        CardContent(logo: "cl", images: ["cl1"], title: "Clash of Clans", description: "dfmnebckjehrbvfer eoifh erpufh re edfuhe fer fderdfh  ehdfeuif other versions for iOS, Android, Windows Phone, and Windows 10 followed. It is a variation of their browser game other versions for iOS, Android, Windows Phone, and Windows 10 followed. It is a variation of their browser game")
    ]
}
