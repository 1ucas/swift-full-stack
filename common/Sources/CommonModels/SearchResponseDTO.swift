import Foundation 

public struct SearchResponseDTO: Codable {
    public let timestamp: String
    public let message: String

    public init(timestamp: Date, message: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .long
        self.timestamp = dateFormatter.string(from: timestamp)
        self.message = message
    }
}