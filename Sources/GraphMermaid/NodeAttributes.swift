import Foundation
import Graph

public struct NodeAttributes: DefaultConstructable {
    public var label: String?
    public var shape: NodeShape = .rectangle
    public var fillColor: Color?
    public var strokeColor: Color?
    public var strokeWidth: Double?
    public var dashArray: [Double] = []

    public init() { }
    
    public init(label: String) {
        self.label = label
    }
    
    public var customStyle: String? {
        formatCustomStyle(fillColor: fillColor, strokeColor: strokeColor, strokeWidth: strokeWidth, dashArray: dashArray)
    }
}
