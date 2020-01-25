//
//  NetworkManagerErrorMessage.swift
//  GHUsers
//
//  Created by Denis Nefedov on 25.01.2020.
//  Copyright © 2020 X. All rights reserved.
//

import Foundation

public enum NetworkManagerErrorMessage: String, Error {
    case invalidUsername = "This username created an invalid request"
    case unableToComplete = "Unable to complete your request"
    case invalidResponse = "Invalid response from the server. Probably user doesn't exist"
    case noData = "No data"
    case jsonParsingError = "JSON parsing fail"
}
