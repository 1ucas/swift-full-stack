import Vapor
import CommonModels

struct BaseBackendResponse<T>: Content where T:Codable {
    let data: T
}

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("random") { req -> BaseBackendResponse<RandomNumberDTO> in
        let number = Int.random(in: 1...100)
        let response = RandomNumberDTO(message: "Random Number Generated: \(number)")
        return BaseBackendResponse(data: response)
    }

    app.get("text", ":search") { req -> BaseBackendResponse<SearchResponseDTO> in
        guard let searchValue = req.parameters.get("search") else {
            throw Abort(.badRequest)
        }
        let response = SearchResponseDTO(timestamp: Date(), message: "Your searched for: #\(searchValue)")
        return BaseBackendResponse(data: response)
    }
}
