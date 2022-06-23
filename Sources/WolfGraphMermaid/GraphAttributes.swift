import Foundation
import WolfGraph

public enum LayoutDirection: String, Codable {
    case topToBottom = "TB"
    case leftToRight = "LR"
    case bottomToTop = "BT"
    case rightToLeft = "RL"
}

public struct GraphAttributes: Codable {
    public var layoutDirection: LayoutDirection = .topToBottom

    public init() { }
}
