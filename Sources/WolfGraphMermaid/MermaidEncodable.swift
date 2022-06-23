import Foundation
import WolfGraph

public protocol MermaidEncodable: ViewableGraph {
    var mermaidGraphAttributes: GraphAttributes { get }
    func mermaidNodeAttributes(_ node: NodeID) -> NodeAttributes
    func mermaidEdgeAttributes(_ edge: EdgeID) -> EdgeAttributes
}

public extension MermaidEncodable {
    var mermaidFormat: String {
        var result: [String] = []
        
        let graphAttributes = mermaidGraphAttributes
        
        result.append("graph \(graphAttributes.layoutDirection.rawValue)")
        
        for node in nodes {
            let attributes = mermaidNodeAttributes(node)
            
            var lineComponents: [String] = ["\t"]
            lineComponents.append(node.description)
            
            if let label = attributes.label {
                let delimiters = attributes.shape.delimiters
                lineComponents.append(label.flanked(delimiters.0, delimiters.1))
            }
            
            result.append(lineComponents.joined())
        }
        
        for edge in edges {
            let attributes = mermaidEdgeAttributes(edge)
            
            var lineComponents: [String] = ["\t"]

            try! lineComponents.append(edgeTail(edge).description)
            lineComponents.append(" ")

            lineComponents.append(arrow(length: attributes.length, style: attributes.style, tail: attributes.tail, head: attributes.head))

            if let label = attributes.label {
                lineComponents.append(label.flanked("|"))
            }
            
            lineComponents.append(" ")

            try! lineComponents.append(edgeHead(edge).description)

            result.append(lineComponents.joined())
        }
        
        return result.joined(separator: "\n")
    }
}
