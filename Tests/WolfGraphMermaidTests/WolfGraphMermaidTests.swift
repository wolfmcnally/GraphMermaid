import XCTest
@testable import WolfGraphMermaid

final class WolfGraphMermaidTests: XCTestCase {
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
        let graph = try MermaidTestGraph.makeDAG()
            .withGraphData {
                $0.layoutDirection = .leftToRight
            }
            .newNode("Z")
            .newEdge("AZ", tail: "A", head: "Z", data: .init(label: "AZ"))
            .withNodeData("Z")
        {
            $0.label = "Zebra"
            $0.shape = .hexagon
        }
        .withNodeData("A") { _ in
//            $0.color = .red
        }
        .withNodeData("J") { _ in
//            $0.style = .filled
        }
        .withEdgeData("AZ") {
            $0.label = "Green"
            $0.style = .dotted
        }
        .withEdgeData("JA") { _ in
//            $0.style = .bold
        }
        .withEdgeData("AC") {
            $0.head = .none
        }
        .withEdgeData("BA") { _ in
//            $0.style = .bold
        }
        .withEdgeData("IK") {
            $0.length = 5
            $0.head = .ex
        }
        .withEdgeData("IC") {
            $0.tail = .dot
        }

        print(graph.mermaidFormat)
    }
}
