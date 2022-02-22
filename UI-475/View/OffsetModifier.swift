//
//  OffsetModifier.swift
//  UI-475
//
//  Created by nyannyan0328 on 2022/02/22.
//

import SwiftUI

struct OffsetModifier: ViewModifier {
    @Binding var rect : CGRect
    var cooordinateSpace : String = ""
    func body(content: Content) -> some View {
        
        content
            .overlay{
                
                GeometryReader{proxy in
                    
                    
                    Color.clear
                        .preference(key:offsetKey.self , value: proxy.frame(in:.named(cooordinateSpace)))
            
                }
            }
            .onPreferenceChange(offsetKey.self) { rect in
                
                self.rect = rect
            }
    }
}


struct offsetKey : PreferenceKey{
    
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
