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
    @Namespace var shape_namespace
    
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
    
    @ViewBuilder
    private var animated_shapes: some View
    {
        HStack
        {
            Group
            {
                switch position
                {
                case .left:
                    Rectangle()
                        .fill(.green)
                        .matchedGeometryEffect(id: "animated_shapes", in: shape_namespace)
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            position = position.next()
                        }
                    Spacer()
                case .center:
                    Spacer()
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.red)
                        .matchedGeometryEffect(id: "animated_shapes", in: shape_namespace)
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            position = position.next()
                        }
                    
                    Spacer()
                case .right:
                    Spacer()
                    Circle()
                        .fill(.blue)
                        .matchedGeometryEffect(id: "animated_shapes", in: shape_namespace)
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            position = position.next()
                        }
                }
            }
            .animation(.default, value: position)
        }
    }
    
    var body: some View
    {
        VStack
        {
            animated_text
            animated_shapes
        }
    }
}
