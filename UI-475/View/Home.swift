//
//  Home.swift
//  UI-475
//
//  Created by nyannyan0328 on 2022/02/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            
            Text("Historical Letter")
                .font(.largeTitle.weight(.bold))
                .padding(.top,10)
                .padding(.bottom)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                ForEach(letters){letter in
                    
                    
                    LetterCardView(letter: letter)
                    
                    
                }
                .padding(.horizontal)
                .padding(.bottom)
                
            }
            .coordinateSpace(name: "SCROLL")
            
            
        }
        .background(Color("BG"))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LetterCardView : View{
    
    var letter : Letter
    
    @State var rect : CGRect = .zero
    
    var body: some View{
        
        
        VStack(spacing:20){
            
            
            VStack(alignment: .leading, spacing: 15) {
                
                
                Text(letter.date)
                    .font(.title.weight(.bold))
                
                
                Text(letter.title)
                    .foregroundColor(.gray)
                
                
                
                Divider()
                    .padding(.vertical,20)
                
             
            }
            .frame(maxWidth:.infinity,alignment: .leading)
         
            
            
         
            Text("the pitcher's mound toward the catcher to begin each play, with the goal of retiring a batter, who attempts to either make contact with the pitched ball or draw a walk. In the numbering system used to record defensive plays, the pitcher is assigned the number 1. The pitcher is often considered the most important player on the defensive side of the game, and as such is situated at the right end of the defensive spectrum. There are many different types of pitchers, such as the starting pitcher, relief pitcher, middle reliever, lefty specialist, setup man, and the closer.")
                .lineSpacing(13)
                .multilineTextAlignment(.leading)
                .foregroundColor(.gray)
            
        }
        .padding()
        .background(Color.white.cornerRadius(15))
        .mask({
            
            Rectangle()
                .padding(.top,rect.minY < (getIndex() * 50) ? -(rect.minY - (getIndex() * 50)) : 0)
            
        })
        .offset(y: rect.minY < (getIndex() * 50) ? (rect.minY - (getIndex() * 50)) : 0)
        .overlay(alignment: .top, content: {
            
            ScrollShaped()
            
        })
        .offset(y: rect.minY < (getIndex() * 50) ? -(rect.minY - (getIndex() * 50)) : 0)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
        .modifier(OffsetModifier(rect: $rect, cooordinateSpace: "SCROLL"))
        .background(
        
        
        Text("No More found")
            .font(.title.bold())
            .foregroundColor(.gray)
            .opacity(isLast() ? 1 : 0)
            .offset(y: rect.minY < 0 ? -rect.minY : 0)
            
        
        )
        .padding(.bottom,isLast() ? rect.height * 1.5 : 0)
    }
    
    @ViewBuilder
    func ScrollShaped()->some View{
        
        
        Rectangle()
            .fill(.white)
            .frame(height:30 * getProgress())
            .overlay(alignment: .top, content: {
                
                
                Rectangle()
                    .fill(
                        
                     
                        
                    
                    
                        LinearGradient(colors: [
                        
                            .black.opacity(0.1),
                            .clear,
                            .black.opacity(0.05),
                            .black.opacity(0.05),
                        
                        
                        
                        ], startPoint: .top, endPoint: .bottom)
                    
                    )
                
                
            })
            .cornerRadius(6)
            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
            .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y:-5)
        
    }
    
    func isLast()->Bool{
        
        return letters.last == letter
        
        
    }
    
    func getIndex()->CGFloat{
        
        
        let index = letters.firstIndex { letter in
            
            return letter.id == letter.id
        } ?? 0
        
        
        return CGFloat(index)
        
        
    }
    
    func getProgress()->CGFloat{
        
        let progress = -rect.minY / rect.height
        
        return (progress > 0 ? (progress < 1 ? progress : 1) : 0)
    }
}
