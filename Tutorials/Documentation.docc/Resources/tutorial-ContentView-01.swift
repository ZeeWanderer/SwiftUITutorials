import SwiftUI

struct ContentView: View
{
    enum ViewPosition: CaseIterable
    {
        case left, center, right
        
        func next() -> ViewPosition
        {
            switch self
            {
            case .left:
                return .center
            case .center:
                return .right
            case .right:
                return .left
            }
        }
    }
    
    @State var position: ViewPosition = .left
    
    @ViewBuilder
    private var animated_text: some View
    {
        HStack
        {
            if position == .right || position == .center
            {
                Spacer()
            }
            
            Text("Hello, world!")
                .padding()
                .onTapGesture {
                    position = position.next()
                }
                .animation(.default, value: position)
            
            if position == .left || position == .center
            {
                Spacer()
            }
        }
    }
    
    var body: some View
    {
        VStack
        {
            animated_text
        }
    }
}
