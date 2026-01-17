//
//  Networker.swift
//  movies
//
//  Created by Auliya Michelle Adhana on 16/01/26.
//

import Foundation

protocol NetworkerProtocol {
    func requestAsync<T>(type: T.Type, endPoint: Endpoint) async throws -> T where T: Decodable
}

final class Networker: NetworkerProtocol {

    func requestAsync<T>(type: T.Type, endPoint: any Endpoint) async throws -> T where T : Decodable {
        let data: Data
        let response: URLResponse

        var urlRequest: URLRequest
        do {
            urlRequest = try URLRequest(endPoint: endPoint)
        }catch {
            print("Failed to create URL Request: \(error)")
            throw APIRequestError.badRequest(message: "Failed to create request from endpoint")
        }

       ///TODO: add networker logger
        print("network url \(endPoint.path)")

        do{
            (data, response) = try await URLSession.shared.data(for: urlRequest)
        } catch{
            print("Network Error \(error.localizedDescription)")
            throw APIRequestError.internetError
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            let errorMessage = "Invalid response from server"
            throw APIRequestError.invalidResponse(message: errorMessage)
        }

        ///TODO: add networker logger

        guard (200...299).contains(httpResponse.statusCode) else {
            let res = try? JSONDecoder().decode(NetworkHandle.self, from: data)

            switch httpResponse.statusCode {
            case 400:
                let errorMessage = res?.body.message ?? "Bad Request"
                throw APIRequestError.badRequest(message: errorMessage)
            default:
                let errorMessage = res?.body.message ?? "An Error Occured"
                throw APIRequestError.apiError(code: res?.code ?? httpResponse.statusCode, message: errorMessage)
            }
        }

        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(type, from: data)
            return decodedData
        } catch let decodingError as DecodingError {
            print("Failed to decode: \(decodingError)")
            throw APIRequestError.decodingError(message: "Failed to parse server response.")
        }
    }

}
