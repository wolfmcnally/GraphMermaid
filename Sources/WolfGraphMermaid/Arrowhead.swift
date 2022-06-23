import Foundation

public enum Arrowhead: String, Codable {
    case normal
    case none
    case dot
    case ex
    
    var tail: String {
        switch self {
        case .normal:
            return "<"
        case .none:
            return ""
        case .dot:
            return "o"
        case .ex:
            return "x"
        }
    }
    
    var head: String {
        switch self {
        case .normal:
            return ">"
        case .none:
            return ""
        case .dot:
            return "o"
        case .ex:
            return "x"
        }
    }
}
