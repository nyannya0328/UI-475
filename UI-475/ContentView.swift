//
//  ContentView.swift
//  UI-475
//
//  Created by nyannyan0328 on 2022/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       SplashScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SplashScreen : View{
    
    @State var animation : [Bool] = Array(repeating: false, count: 3)
    
    var body: some View{
        
        ZStack{
            
            
            Home()
                .opacity(animation[1] ? 1 : 0)
                .padding()
            
         
            if !animation[2]{
                Color("BG-1")
                .mask {
                    
                    Rectangle()
                        .overlay(
                        
                        
                            Image("p1")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 80, height: 80)
                                .scaleEffect(animation[1] ? 40 : 1)
                                .blendMode(.destinationOut)
                            
                        )
                    
                }
            
            }
            
            
            
            
        }
        .ignoresSafeArea()
        .onAppear {
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                
                
                withAnimation(.easeInOut(duration: 0.6).speed(1.5)){
                    
                    animation[1] = true
                }
                
                withAnimation(.easeInOut(duration: 1.5)){
                    
                    
                    animation[2] = true
                }
                
                
            }
        }
    }
}
