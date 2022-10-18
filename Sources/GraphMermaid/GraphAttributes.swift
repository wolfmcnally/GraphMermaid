import Foundation
import Graph

public struct GraphAttributes: DefaultConstructable {
    public var layoutDirection: LayoutDirection

    public init() {
        self.layoutDirection = .topToBottom
    }
    
    public init(layoutDirection: LayoutDirection) {
        self.layoutDirection = layoutDirection
    }
}
