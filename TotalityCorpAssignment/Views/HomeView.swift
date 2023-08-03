//
//  HomeView.swift
//  TotalityCorpAssignment
//
//  Created by rahul kaushik on 31/07/23.
//

import SwiftUI

struct HomeView: View {
    private let adaptiveCol = [GridItem(.adaptive(minimum: 300))]
    var cardContent : [CardContent] = CardList.list
    
    @State var showView : Bool = false
    @State var selectedCard : CardContent?
    @Namespace private var animation
    
    var body: some View {

            VStack {
                // top bar most text
                if (!showView) {
                    Text("Play").textCase(.uppercase)
                        .font(.system(size: 24))
                        .padding(.top)
//                   this will animate the play title to the title of the card
                        .matchedGeometryEffect(id: "title", in: animation)
                }
                
                Spacer()
                // list of cards
                ScrollView {
                    LazyVGrid(columns: adaptiveCol) {
                        ForEach(cardContent, id: \.self) { content in
                            if !(showView && selectedCard?.id == content.id) {
                                cardView(content)
                                    .padding(.top, 40)
                                    .onTapGesture {
                                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                            selectedCard = content
                                            showView = true
                                        }
                                    }
                            }
                        }
                    }
                }
            }
        // detailed view will be overlayed
            .overlay{
                if let selectedCard,showView {
                    DetailedView(content: selectedCard, animation: animation, show: $showView)
                }

            }
      
    }
    
    // card view
    
    @ViewBuilder
    func cardView(_ card: CardContent) -> some View {
        VStack {
            HStack {
               
                if !(showView && card.id == selectedCard?.id) {
                    Image(card.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .frame(width: 100, height: 100)
                        .padding(20)
                        .padding(.top, 20)
                    // image of the card will animate to the image inside deatiled view
                        .matchedGeometryEffect(id: card.id, in: animation)
                }
                
                Spacer()
                
                Text(card.title)
                    .foregroundColor(.white)
                    .bold()
                    .bold()
                    .font(.system(size: 20))
                    
                Spacer()

            }
            Spacer()
            
            
            if(!showView) {
                CustomButton(text: .constant("Download"), color: .constant(.green))
                        .padding()
                
                
                .matchedGeometryEffect(id: "\(card.id)Button", in: animation)
            }
            
            
        }
        .foregroundColor(Color.orange)
        .frame(width: 300, height: 400)
        .background(.orange)
        .cornerRadius(20)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
