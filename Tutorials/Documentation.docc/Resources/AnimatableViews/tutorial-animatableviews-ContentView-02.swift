import SwiftUI

struct IntCounter: Animatable, View
{
    private static let min_count = 0
    private static let max_count = 100
    
    let ascending: Bool
    var count: Int
    
    init(ascending: Bool)
    {
        self.ascending = ascending
        count = ascending ? IntCounter.max_count : IntCounter.min_count
    }
    
    var animatableData: CGFloat
    {
        get { CGFloat(ascending ? IntCounter.max_count : IntCounter.min_count) }
        set { count = Int(newValue) }
    }
    
    var body: some View
    {
        Text("\(count)")
    }
}

struct WobblingShape: Shape
{
    var sides: Double
    
    var animatableData: Double
    {
        get { sides }
        set { sides = newValue }
    }
    
    func path(in rect: CGRect) -> Path
    {
        let hypotenuse = Double(min(rect.size.width, rect.size.height)) / 2.0
        let center = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        
        var path = Path()
        
        let extra: Int = Double(sides) != Double(Int(sides)) ? 1 : 0
        for i in 0..<Int(sides) + extra
        {
            let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180
            
            // Calculate vertex
            let pt = CGPoint(x: center.x + CGFloat(cos(angle) * hypotenuse), y: center.y + CGFloat(sin(angle) * hypotenuse))
            
            if i == 0
            {
                path.move(to: pt) // move to first vertex
            }
            else
            {
                path.addLine(to: pt) // draw line to next vertex
            }
        }
        
        path.closeSubpath()
        return path
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
            WobblingShape(sides: animate ? 3 : 12)
                .fill(animate ? .green : .red)
                .frame(width: 100, height: 100)
                .animation(.easeOut(duration: 3), value: animate)
        }
        .onTapGesture {
            animate.toggle()
        }
    }
}
