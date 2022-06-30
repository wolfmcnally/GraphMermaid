import Foundation
import WolfGraph
import WolfGraphMermaid

struct MermaidTestGraph: EditableGraph {
    typealias NodeID = String
    typealias EdgeID = String
    typealias NodeData = NodeAttributes
    typealias EdgeData = EdgeAttributes
    
    typealias InnerGraph = Graph<NodeID, EdgeID, NodeData, EdgeData>
    let graph: InnerGraph
    let mermaidGraphAttributes: GraphAttributes

    init() {
        self.mermaidGraphAttributes = .init()
        self.graph = InnerGraph()
    }
    
    private init(graph: InnerGraph, attributes: GraphAttributes) {
        self.graph = graph
        self.mermaidGraphAttributes = attributes
    }
    
    func copySettingInner(graph: InnerGraph) -> Self {
        Self(graph: graph, attributes: mermaidGraphAttributes)
    }

    init(edges: [(String, String, String)]) throws {
        self.mermaidGraphAttributes = .init()
        var graph = InnerGraph()
        
        for edge in edges {
            let (label, tail, head) = edge
            if graph.hasNoNode(tail) {
                graph = try graph.newNode(tail, data: .init(label: tail))
            }
            if graph.hasNoNode(head) {
                graph = try graph.newNode(head, data: .init(label: head))
            }
            graph = try graph.newEdge(label, tail: tail, head: head, data: .init(label: label))
        }
        
        self.graph = graph
    }

    func withGraphData(transform: (inout GraphAttributes) -> Void) -> Self {
        var attributes = mermaidGraphAttributes
        transform(&attributes)
        return Self(graph: graph, attributes: attributes)
    }
}

extension MermaidTestGraph {
    static func makeDAG() -> Self {
        try! Self(edges: [
            ("AC", "A", "C"),
            ("AD", "A", "D"),
            ("AE", "A", "E"),
            ("BA", "B", "A"),
            ("BC", "B", "C"),
            ("BG", "B", "G"),
            ("CD", "C", "D"),
            ("ED", "E", "D"),
            ("FD", "F", "D"),
            ("FE", "F", "E"),
            ("HJ", "H", "J"),
            ("IC", "I", "C"),
            ("IK", "I", "K"),
            ("JA", "J", "A"),
            ("JE", "J", "E"),
            ("JF", "J", "F"),
            ("GI", "I", "G"),
            ("IB", "B", "I"),
        ])
    }
    
    static func makeGraph() -> Self {
        try! Self(edges: [
            ("AC", "A", "C"),
            ("AD", "A", "D"),
            ("AE", "A", "E"),
            ("BA", "B", "A"),
            ("BC", "B", "C"),
            ("BG", "B", "G"),
            ("CD", "C", "D"),
            ("ED", "E", "D"),
            ("FD", "F", "D"),
            ("FE", "F", "E"),
            ("HJ", "H", "J"),
            ("IC", "I", "C"),
            ("IK", "I", "K"),
            ("JA", "J", "A"),
            ("JE", "J", "E"),
            ("JF", "J", "F"),
            ("GI", "G", "I"), // back edge
            ("IB", "I", "B"), // back edge
        ])
    }
    
    static func makeTree() -> Self {
        try! Self(edges: [
            ("AB", "A", "B"),
            ("AC", "A", "C"),
            ("AD", "A", "D"),
            ("DE", "D", "E"),
            ("DF", "D", "F"),
            ("DG", "D", "G"),
            ("CH", "C", "H"),
            ("BI", "B", "I"),
            ("HJ", "H", "J"),
            ("HK", "H", "K"),
            ("FL", "F", "L"),
            ("EM", "E", "M"),
            ("EN", "E", "N"),
            ("EO", "E", "O"),
        ])
    }
}

extension MermaidTestGraph: MermaidEncodable {
    func mermaidNodeAttributes(_ node: String) -> NodeAttributes {
        try! nodeData(node)
    }
    
    func mermaidEdgeAttributes(_ edge: String) -> EdgeAttributes {
        try! edgeData(edge)
    }
}
