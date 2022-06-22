import XCTest
@testable import WolfGraphMermaid

final class WolfGraphMermaidTests: XCTestCase {
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
//            $0.shape = .pentagon
        }
        .withNodeData("A") { _ in
//            $0.color = .red
        }
        .withNodeData("J") { _ in
//            $0.style = .filled
        }
        .withEdgeData("AZ") {
            $0.label = "Green"
//            $0.color = .green
        }
        .withEdgeData("JA") { _ in
//            $0.style = .bold
        }
        .withEdgeData("AC") { _ in
//            $0.arrowDirection = .both
        }
        .withEdgeData("BA") { _ in
//            $0.style = .bold
        }
        .withEdgeData("IK") { _ in
//            $0.arrowHead = .box
        }
        .withEdgeData("IC") { _ in
//            $0.arrowDirection = .both
//            $0.arrowTail = "olboxrbox"
        }

        print(graph.mermaidFormat)
    }
}
