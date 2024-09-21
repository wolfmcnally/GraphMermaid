import Foundation

public struct Color: Hashable, Sendable {
    public let name: String
    
    public init(_ name: String) {
        self.name = name
    }
    
    public init(r: UInt8, g: UInt8, b: UInt8, a: UInt8? = nil) {
        let components = [r, g, b, a].compactMap { $0?.hex }.joined()
        self.name = "#" + components
    }
}

extension Color: ExpressibleByStringLiteral {
    public init(stringLiteral name: StringLiteralType) {
        self.init(name)
    }
}

extension Color {
    public static let red: Color = "red"
    public static let green: Color = "green"
    public static let blue: Color = "blue"
    public static let cyan: Color = "cyan"
    public static let magenta: Color = "magenta"
    public static let yellow: Color = "yellow"
    public static let black: Color = "black"
    public static let white: Color = "white"
    public static let gray: Color = "gray"
}

extension Color: CustomStringConvertible {
    public var description: String {
        name
    }
}
