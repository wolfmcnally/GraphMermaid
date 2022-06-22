import Foundation
import WolfGraph

public struct EdgeAttributes: ElementData {
    public var label: String?

    public init() { }

    public init(label: String) {
        self.label = label
    }
}
