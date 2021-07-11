//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by paul taylor on 6/1/21.
// All titles need a particular style. so we ned to create a customer ViewModifier.

import SwiftUI

struct Title: ViewModifier {  // this is the custom view modifer
    func body(content: Content) -> some View {
        content
            .font(.largeTitle) // this is a built in modifier
            .foregroundColor(.white)
            .padding()
            .background(Color.blue) // this is a built in modifier
            .padding()
            .background(Color.yellow)
            .clipShape(RoundedRectangle(cornerRadius: 10)) // as is this
    }
}

// now we wrap the title modifer in an extension

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: . bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}


struct ContentView: View {
    var body: some View {
        Text("Hi mum")
            .titleStyle()
            .frame(width: 300, height: 300)
            .watermarked(with: "Please send food")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
