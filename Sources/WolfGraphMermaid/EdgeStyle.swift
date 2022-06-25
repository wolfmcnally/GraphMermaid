import Foundation

public enum EdgeStyle: String {
    case normal
    case dotted
    case thick
    
    var start: String {
        switch self {
        case .normal:
            return "-"
        case .dotted:
            return "-"
        case .thick:
            return "="
        }
    }

    func body(length: Int) -> String {
        let c: String
        switch self {
        case .normal:
            c = "-"
        case .dotted:
            c = "."
        case .thick:
            c = "="
        }
        return String(repeating: c, count: length)
    }

    var end: String {
        switch self {
        case .normal:
            return "-"
        case .dotted:
            return "-"
        case .thick:
            return "="
        }
    }
}
