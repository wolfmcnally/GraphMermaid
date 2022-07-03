import XCTest
@testable import GraphMermaid

// Docs: https://mermaid-js.github.io/mermaid/#/
// Editor: https://mermaid.live/

final class GraphMermaidTests: XCTestCase {
    func testEdgeStyle() {
        XCTAssertEqual(arrow(length: 1, style: .normal, tail: .none, head: .normal), "-->")
        XCTAssertEqual(arrow(length: 2, style: .normal, tail: .none, head: .normal), "--->")
        XCTAssertEqual(arrow(length: 3, style: .normal, tail: .none, head: .normal), "---->")
        XCTAssertEqual(arrow(length: 1, style: .normal, tail: .none, head: .none), "---")
        XCTAssertEqual(arrow(length: 2, style: .normal, tail: .none, head: .none), "----")
        XCTAssertEqual(arrow(length: 3, style: .normal, tail: .none, head: .none), "-----")

        XCTAssertEqual(arrow(length: 1, style: .dotted, tail: .none, head: .normal), "-.->")
        XCTAssertEqual(arrow(length: 2, style: .dotted, tail: .none, head: .normal), "-..->")
        XCTAssertEqual(arrow(length: 3, style: .dotted, tail: .none, head: .normal), "-...->")
        XCTAssertEqual(arrow(length: 1, style: .dotted, tail: .none, head: .none), "-.-")
        XCTAssertEqual(arrow(length: 2, style: .dotted, tail: .none, head: .none), "-..-")
        XCTAssertEqual(arrow(length: 3, style: .dotted, tail: .none, head: .none), "-...-")

        XCTAssertEqual(arrow(length: 1, style: .thick, tail: .none, head: .normal), "==>")
        XCTAssertEqual(arrow(length: 2, style: .thick, tail: .none, head: .normal), "===>")
        XCTAssertEqual(arrow(length: 3, style: .thick, tail: .none, head: .normal), "====>")
        XCTAssertEqual(arrow(length: 1, style: .thick, tail: .none, head: .none), "===")
        XCTAssertEqual(arrow(length: 2, style: .thick, tail: .none, head: .none), "====")
        XCTAssertEqual(arrow(length: 3, style: .thick, tail: .none, head: .none), "=====")

        XCTAssertEqual(arrow(length: 1, style: .normal, tail: .normal, head: .normal), "<-->")
        XCTAssertEqual(arrow(length: 2, style: .normal, tail: .normal, head: .normal), "<--->")
        XCTAssertEqual(arrow(length: 3, style: .normal, tail: .normal, head: .normal), "<---->")

        XCTAssertEqual(arrow(length: 1, style: .normal, tail: .dot, head: .dot), "o--o")
        XCTAssertEqual(arrow(length: 2, style: .normal, tail: .dot, head: .dot), "o---o")
        XCTAssertEqual(arrow(length: 3, style: .normal, tail: .dot, head: .dot), "o----o")

        XCTAssertEqual(arrow(length: 1, style: .dotted, tail: .ex, head: .ex), "x-.-x")
        XCTAssertEqual(arrow(length: 2, style: .dotted, tail: .ex, head: .ex), "x-..-x")
        XCTAssertEqual(arrow(length: 3, style: .dotted, tail: .ex, head: .ex), "x-...-x")
    }
    
    func testMermaid() throws {
        var graph = MermaidTestGraph.makeDAG()
        graph.withGraphData {
            $0.layoutDirection = .leftToRight
        }
        try graph.newNode("Z")
        try graph.newEdge("AZ", tail: "A", head: "Z", data: .init(label: "AZ"))
        try graph.withNodeData("Z") {
            $0.label = "Zebra"
            $0.shape = .hexagon
        }
        try graph.withNodeData("A") {
            $0.fillColor = .red
        }
        try graph.withNodeData("J") {
            $0.shape = .circle
            $0.strokeColor = .blue
        }
        try graph.withEdgeData("AZ") {
            $0.label = "Green"
            $0.strokeColor = .green
            $0.strokeWidth = 4
            $0.length = 4
        }
        try graph.withEdgeData("JA") {
            $0.style = .thick
        }
        try graph.withEdgeData("AC") {
            $0.head = .none
        }
        try graph.withEdgeData("BA") {
            $0.style = .thick
        }
        try graph.withEdgeData("IK") {
            $0.length = 5
            $0.head = .ex
            $0.style = .dotted
        }
        try graph.withEdgeData("IC") {
            $0.tail = .dot
        }
        
        let mermaid = """
        graph LR
            A[A]
            B[B]
            C[C]
            D[D]
            E[E]
            F[F]
            G[G]
            H[H]
            I[I]
            J((J))
            K[K]
            Z{{Zebra}}
            A ---|AC| C
            A -->|AD| D
            A -->|AE| E
            A ----->|Green| Z
            B ==>|BA| A
            B -->|BC| C
            B -->|BG| G
            C -->|CD| D
            E -->|ED| D
            F -->|FD| D
            F -->|FE| E
            I -->|GI| G
            H -->|HJ| J
            B -->|IB| I
            I o-->|IC| C
            I -.....-x|IK| K
            J ==>|JA| A
            J -->|JE| E
            J -->|JF| F
            style A fill:red
            style J stroke:blue
            linkStyle 3 stroke:green,stroke-width:4.0px
        """

        XCTAssertEqual(graph.mermaidFormat.trim(), mermaid.trim())
    }
}

