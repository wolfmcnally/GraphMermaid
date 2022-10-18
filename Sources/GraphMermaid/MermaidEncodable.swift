import Foundation
import Graph

// Docs: https://mermaid-js.github.io/mermaid/#/
// Editor: https://mermaid.live/

public protocol MermaidElementID: ElementID {
    var mermaidElementID: String { get }
}

extension MermaidElementID {
    public var mermaidElementID: String { description }
}

public protocol MermaidEncodable: ViewableGraph
where NodeID: MermaidElementID, EdgeID: MermaidElementID
{
    var mermaidGraphAttributes: GraphAttributes { get }
    func mermaidNodeAttributes(_ node: NodeID) -> NodeAttributes
    func mermaidEdgeAttributes(_ edge: EdgeID) -> EdgeAttributes
}

extension Int: MermaidElementID { }
extension String: MermaidElementID { }

public extension MermaidEncodable {
    var mermaidFormat: String {
        var result: [String] = []
        let indent = "    "
        
        let graphAttributes = mermaidGraphAttributes
        
        result.append("graph \(graphAttributes.layoutDirection.rawValue)")
        
        var customStyles: [String] = []

        for node in nodes {
            let attributes = mermaidNodeAttributes(node)

            var lineComponents: [String] = [indent]
            lineComponents.append(node.mermaidElementID)

            if let label = attributes.label {
                let delimiters = attributes.shape.delimiters
                lineComponents.append(label.flanked(delimiters.0, delimiters.1))
            }

            result.append(lineComponents.joined())

            if let customStyle = attributes.customStyle {
                customStyles.append("\(indent)style \(node) \(customStyle)")
            }
        }

        for (index, edge) in edges.enumerated() {
            let attributes = mermaidEdgeAttributes(edge)

            var lineComponents: [String] = [indent]

            try! lineComponents.append(edgeTail(edge).mermaidElementID)
            lineComponents.append(" ")

            lineComponents.append(arrow(length: attributes.length, style: attributes.style, tail: attributes.tail, head: attributes.head))

            if let label = attributes.label {
                lineComponents.append(label.flanked("|"))
            }

            lineComponents.append(" ")

            try! lineComponents.append(edgeHead(edge).mermaidElementID)

            result.append(lineComponents.joined())

            if let customStyle = attributes.customStyle {
                customStyles.append("\(indent)linkStyle \(index) \(customStyle)")
            }
        }

        result.append(contentsOf: customStyles)
        
        return result.joined(separator: "\n")
    }
}
