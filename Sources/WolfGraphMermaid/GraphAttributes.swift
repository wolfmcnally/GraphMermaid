import Foundation
import WolfGraph

public enum LayoutDirection: String {
    case topToBottom = "TB"
    case leftToRight = "LR"
    case bottomToTop = "BT"
    case rightToLeft = "RL"
}

public struct GraphAttributes {
    public var layoutDirection: LayoutDirection = .topToBottom

    public init() { }
}
