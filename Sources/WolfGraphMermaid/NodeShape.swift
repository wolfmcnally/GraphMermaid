import Foundation

public enum NodeShape: String {
    case rectangle
    case rounded
    case stadium
    case subroutine
    case cylinder
    case circle
    case asymmetric
    case rhombus
    case hexagon
    case parallelogram
    case parallelogramAlt
    case trapezoid
    case trapezoidAlt
    case doubleCircle
    
    var delimiters: (String, String) {
        switch self {
        case .rectangle:
            return ("[", "]")
        case .rounded:
            return ("(", ")")
        case .stadium:
            return ("([", "])")
        case .subroutine:
            return ("[[", "]]")
        case .cylinder:
            return ("[(", ")]")
        case .circle:
            return ("((", "))")
        case .asymmetric:
            return (">", "]")
        case .rhombus:
            return ("{", "}")
        case .hexagon:
            return ("{{", "}}")
        case .parallelogram:
            return ("[/", "/]")
        case .parallelogramAlt:
            return ("[\\", "\\]")
        case .trapezoid:
            return ("[/", "\\]")
        case .trapezoidAlt:
            return ("[\\", "/]")
        case .doubleCircle:
            return ("(((", ")))")
        }
    }
}
