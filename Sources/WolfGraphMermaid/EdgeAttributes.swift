import Foundation
import WolfGraph

public struct EdgeAttributes: ElementData {
    public var label: String?
    public var length: Int = 1
    public var style: EdgeStyle = .normal
    public var tail: Arrowhead = .none
    public var head: Arrowhead = .normal

    public init() { }

    public init(label: String) {
        self.label = label
    }
}
