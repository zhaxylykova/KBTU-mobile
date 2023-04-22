//
//  GeneralError.swift
//  KBTU Mobile
//
//  Created by Altynay on 11.03.2023.
//

import Foundation

// MARK: Delete if not needed
enum GeneralError: Error {
    case emailNotVerified
    case unknownError
    case connectionError
    case invalidCredentials
    case invalidRequest
    case notFound
    case invalidResponse
    case serverError
    case serverUnavailable
    case timeOut
    case unsupportedURL
 }

extension GeneralError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .emailNotVerified:
            return NSLocalizedString("You need to verify your email first", comment: "")
        default:
            return ""
        }
    }
}
