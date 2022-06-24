import Foundation

func arrow(length: Int = 1, style: EdgeStyle = .normal, tail tailShape: Arrowhead, head headShape: Arrowhead) -> String {
    precondition(length >= 1)
    
    var result = ""
    
    result += tailShape.tail
    result += style.start
    result += style.body(length: length)
    let head = headShape.head
    if head.isEmpty || style == .dotted {
        result += style.end
    }
    result += head
    
    return result
}

func formatCustomStyle(fillColor: Color? = nil, strokeColor: Color?, strokeWidth: Double?) -> String? {
    var components: [String] = []
    if let fillColor {
        components.append("fill:\(fillColor)")
    }
    if let strokeColor {
        components.append("stroke:\(strokeColor)")
    }
    if let strokeWidth {
        components.append("stroke-width:\(strokeWidth)px")
    }
    guard !components.isEmpty else {
        return nil
    }
    return String(components.joined(separator: ","))
}
