public struct RandomNumberDTO: Codable {
    public let message: String

    public init(message: String) {
        self.message = message
    }
}
