//
//  NetworkManager.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 2/18/26.
//

import Foundation

// Generic Request Handlers

class NetworkManager {
    static let shared = NetworkManager()
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    // GET
    
    func get<T: Decodable>(url: String) async throws -> T {
        let request = URLRequest(url: URL(string: url)!)
        let (data, _) = try await URLSession.shared.data(for: request)
        return try decoder.decode(T.self, from: data)
    }
    
    // POST
    
    func post<T: Decodable, B: Encodable>(url: String, body: B) async throws -> T {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try encoder.encode(body)
        let (data, _) = try await URLSession.shared.data(for: request)
        return try decoder.decode(T.self, from: data)
    }
    
    // PUT
    
    func put<T: Decodable, B: Encodable>(url: String, body: B) async throws -> T {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try encoder.encode(body)
        let (data, _) = try await URLSession.shared.data(for: request)
        return try decoder.decode(T.self, from: data)
    }
    
    // DELETE
    
    func delete(url: String) async throws {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "DELETE"
        let (_, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
    }
}
