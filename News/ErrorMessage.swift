//
//  ErrorMessage.swift
//  News
//
//  Created by chandrasekhar yadavally on 6/18/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import Foundation

enum ErrorMessage: String, Error {
    case connectionError = "Connection Error. Please try again later"
    case invalidResponse = "Inalid response from server. Please try again later"
    case invalidData = "Invalid data received. Please try again later"
    case invalidUrl = "Invalid URL"
}
