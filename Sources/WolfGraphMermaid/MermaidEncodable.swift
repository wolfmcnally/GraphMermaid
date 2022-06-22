import Foundation
import WolfGraph

public protocol MermaidEncodable: ViewableGraph {
    func mermaidNodeAttributes(_ node: NodeID) -> NodeAttributes?
    func mermaidEdgeAttributes(_ edge: EdgeID) -> EdgeAttributes?
    var mermaidGraphAttributes: GraphAttributes? { get }
}

public extension MermaidEncodable {
    func mermaidNodeAttributes(_ node: NodeID) -> NodeAttributes? {
        nil
    }
    
    func mermaidEdgeAttributes(_ edge: EdgeID) -> EdgeAttributes? {
        nil
    }
    
    var mermaidGraphAttributes: GraphAttributes? {
        nil
    }
}

public extension MermaidEncodable {
    var mermaidFormat: String {
        var result: [String] = []
        
        let graphAttributes = mermaidGraphAttributes
        
        let layoutDirection = graphAttributes?.layoutDirection ?? .topToBottom
        result.append("graph \(layoutDirection.rawValue)")
        
        for node in nodes {
            let attributes = mermaidNodeAttributes(node)
            
            var lineComponents: [String] = ["\t"]
            lineComponents.append(node.description)
            
            if let label = attributes?.label {
                lineComponents.append(label.flanked("[", "]"))
            }
            
            result.append(lineComponents.joined())
        }
        
        for edge in edges {
            let attributes = mermaidEdgeAttributes(edge)
            
            var lineComponents: [String] = ["\t"]

            try! lineComponents.append(edgeTail(edge).description)
            lineComponents.append(" -->")

            if let label = attributes?.label {
                lineComponents.append(label.flanked("|"))
            }
            
            lineComponents.append(" ")

            try! lineComponents.append(edgeHead(edge).description)

            result.append(lineComponents.joined())
        }
        
        return result.joined(separator: "\n")
    }
}
