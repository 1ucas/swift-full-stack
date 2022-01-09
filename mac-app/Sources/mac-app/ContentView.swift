import SwiftUI
import CommonModels

struct ContentView: View {

    @State var searchString = ""
    @State var textFromServer = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Type Here", text: $searchString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(8)
                    .onChange(of: searchString) { newValue in 
                        let route = "http://127.0.0.1:8080/text/\(newValue)"
                        guard newValue != "" else {
                            textFromServer = ""
                            return
                        }
                        callServer(route: route) { (result: BaseBackendResponse<SearchResponseDTO>) in 
                            print("Last search made at: \(result.data.timestamp)")
                            textFromServer = result.data.message
                        }
                }
                Button("Random Number") {
                    let route = "http://127.0.0.1:8080/random"
                    callServer(route: route) { (result: BaseBackendResponse<RandomNumberDTO>) in 
                        textFromServer = result.data.message
                    }
                }
                Spacer()
            }
            VStack {
                Text(textFromServer)
            }
        }.navigationTitle("Mac Sample App")
    }

    private func callServer<T: Codable>(route: String, completion: @escaping (BaseBackendResponse<T>) -> Void) {
        let session = URLSession.shared
        let url = URL(string: route)!
        let task = session.dataTask(with: url) {
                (data, _, _) in 
                do { 
                    let result = try JSONDecoder().decode(BaseBackendResponse<T>.self, from: data!)
                    completion(result)
                } catch { print(error) }
            }
        task.resume()
    }
}

public struct BaseBackendResponse<T: Codable>: Codable {
    let data: T
}

