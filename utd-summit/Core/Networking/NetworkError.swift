//
//  NetworkError.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 2/18/26.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case httpError(statusCode: Int)
    case decodingError
    case networkUnavailable
    case timeout
    case unauthorized
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response from server"
        case .httpError(let statusCode):
            return "HTTP Error: \(statusCode)"
        case .decodingError:
            return "Failed to decode response"
        case .networkUnavailable:
            return "No network connection"
        case .timeout:
            return "Request timed out"
        case .unauthorized:
            return "Unauthorized access"
        case .unknown(let error):
            return "Unknown error: \(error.localizedDescription)"
        }
    }
}


