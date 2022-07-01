//
//  ContentView.swift
//  Tutorials
//
//  Created by Maksym Kulyk on 30.06.2022.
//

import SwiftUI

struct IntCounter: Animatable, View
{
    private static let min_count = 0
    private static let max_count = 100
    
    let ascending: Bool
    var count: Int
    
    init(ascending: Bool) {
        self.ascending = ascending
        count = ascending ? IntCounter.max_count : IntCounter.min_count
    }
    
    
    var animatableData: CGFloat
    {
        get { return CGFloat(ascending ? IntCounter.max_count : IntCounter.min_count) }
        set { count = Int(newValue) }
    }
    
    var body: some View
    {
        Text("\(count)")
    }
}

struct ContentView: View
{
    @State var animate = false
    
    var body: some View
    {
        VStack
        {
            Text("Hello, world!")
                .padding()
            IntCounter(ascending: animate)
                .animation(.linear(duration: 5), value: animate)
                
        }
        .onTapGesture {
            animate.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
