//
// Created by Joshua Taylor on 9/21/21.
//

import Foundation

class DataLoader {
    func request(_ endpoint: Endpoint,
                 then handler: @escaping (DataHandlerResult) -> Void) {

        guard let url = endpoint.url else {
            handler(.failure(.invalidUrl))
            return
        }

        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in

            guard error == nil else {
                // OH NO! An error occurred...
                return handler(.failure(.general(reason: error!.localizedDescription)))
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                return handler(.failure(.general(reason: "Unable to convert convert response to HTTPURLResponse")))
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                return handler(.failure(.network(statusCode: httpResponse.statusCode)))
            }

            guard let data = data else {
                handler(.failure(.data(reason: "No Data Received")))
                return
            }

            handler(.success(data))
        }

        task.resume()
    }
}