//
//  DetailedView.swift
//  TotalityCorpAssignment
//
//  Created by rahul kaushik on 31/07/23.
//

import SwiftUI

struct DetailedView: View {
    @State var limit : Int = 2
    var content : CardContent
    var animation : Namespace.ID
    @Binding var show : Bool
    @State private var animate : Bool = false
    @State private var symbol : String = "x.circle.fill"
    @State private var downloadClick : Bool = false
    @State var downloadComplete : Bool = false
    @State var playButtonCilcked : Bool = false
    
    var body: some View {
        ZStack{
         // the vstack below represents the top 3 elements of the detailed view 1. image 2. title 3. close button
            VStack {
                GeometryReader{
                    let size = $0.size
                    HStack(spacing: 10) {
                        Image(content.logo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(20)
                            .frame(width: size.width/3, height: size.height/3)
                            .matchedGeometryEffect(id: content.id, in: animation)
                            .padding(.leading)
                        
                        Text(content.title)
                            .foregroundColor(.black)
                            .font(.system(size: 24))
                            .matchedGeometryEffect(id: "title", in: animation)
                            .frame(width: 100)
                            .padding(.leading, 10)
                            .lineLimit(nil)
                        
                        Spacer()
                        
                        Button {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                animate.toggle()
                                show = false
                            }
                        } label: {
                            Image(systemName:"x.circle.fill")
                                .font(.title3)
                                .foregroundColor(.black)
                                .bold()
                                .contentShape(Rectangle())
                        }
                        .padding(.trailing)
                        
                        
                    }
                    .frame(height: 200)
                }
                // this to trigger a transition for the detailed view
                if animate {
                    Rectangle()
                        .fill(.white)
                        .ignoresSafeArea()
                        .overlay(alignment: .top, content: {
                            cardDetails()
                        })
                        .padding(30)
                        .transition(.move(edge: .trailing))
                        .padding(.top, -200)
                        .animation(.linear(duration: 0.5))
                      
                    
                }
                // this represents the bottom button
                // there are 3 of them 1. Download Button 2. Progress Button 3. Play Button
                // they work on 3 toggles
//                1. downloadClick 2. downloadComplete 3. playButtonCilcked
                // downloadCompleted is toggled from progess view component to inndicate a download finised
                // playButtonCilcked triggers a pop up view
                
                HStack {
                    if(!downloadClick && !downloadComplete) {
                        
                        CustomButton(text: .constant("Download \n  100 MB"), color: .constant(.green))
                            .padding()
                        
                            .onTapGesture {
                                downloadClick.toggle()
                            }
                            .matchedGeometryEffect(id: "\(content.id)Button", in: animation)
                    }
                  
                    if(downloadClick && !downloadComplete) {
                        ProgressBar(isComplete: $downloadComplete)
                            .padding()
                        CancelDoneButton(symbol: $symbol)
                            .font(.system(size: 32))
                            .transition(.move(edge: .leading))
                            .animation(.spring())

                    }
                    if(downloadComplete) {
                        CustomButton(text: .constant("Play"), color: .constant(.blue))
                            .padding()
                            .transition(.move(edge: .bottom))
                            .animation(.linear)
                            .onTapGesture {
                                playButtonCilcked.toggle()
                            }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .padding(.bottom, -10)
               
                
                
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background {
                Rectangle()
                    .fill(.white)
                    .ignoresSafeArea()
            }
            .onAppear{
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                    animate.toggle()
                }
            }
            // popup card overlay
            .overlay(alignment: .bottom, content: {
                if(playButtonCilcked) {
                    Rectangle()
                        .fill(Color.black.opacity(0.8))
                        .ignoresSafeArea()
                    
                    VStack{
                        Spacer()
                        PopUpCard()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.5)
                            .background(.white)
                            .shadow(radius: 5)
                            
                    }
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut)
                    
                }
            }
            )
            
        }
        
            
    }
    
    
    @ViewBuilder
    func cardDetails () -> some View {
        VStack {
            ScrollView(showsIndicators: false){
                VStack {
                    Text(content.description)
                        .lineLimit(limit)
                        .padding([.top, .leading, .trailing], 20)
                        .padding(.top, 5)
                        .transition(.move(edge: .top))
                        .animation(.linear)
                    
                                    Text("Read More")
                                        .font(.system(size: 20))
                                        .padding(.top)
                                        .foregroundColor(.blue)
                                        .onTapGesture {
                                            if(limit == 2) {
                                                limit = 10
                                            }
                                            else {
                                                limit = 2
                                            }
                                        }
                                        .transition(.move(edge: .top))
                                        .animation(.linear)
                    
                    ScrollView(.horizontal){
                        HStack(spacing: 20) {
                            ForEach(content.images, id: \.self) { image in
                                Image(image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .padding(.top, 20)

                            }
                        }
                    }
                    .transition(.move(edge: .top))
                    .animation(.linear)
                    .padding(20)
                    .frame(width: 400, height: 350)
                
                    
                                  
                }
            }
        

            
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
