import Foundation
import Graph

public struct EdgeAttributes: DefaultConstructable {
    public var label: String?
    public var length: Int = 1
    public var style: EdgeStyle = .normal
    public var tail: Arrowhead = .none
    public var head: Arrowhead = .normal
    public var strokeColor: Color?
    public var strokeWidth: Double?

    public init() { }

    public init(label: String) {
        self.label = label
    }
    
    public var customStyle: String? {
        formatCustomStyle(strokeColor: strokeColor, strokeWidth: strokeWidth)
    }
}
