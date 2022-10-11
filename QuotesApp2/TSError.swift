//
//  TSError.swift
//  QuotesApp2
//
//  Created by Sarkhan Jafarli on 10/11/22.
//

import UIKit

enum TSError: String, Error {
    case incorrectUrl = "Lyrics URL isn't correct."
    case unableToComplete = "An error occured. Unable to complete the task."
    case invalidResponse =  "Invalide response from the server. Please try again."
    case invalidData = "The data received from server was invalid. Please try again."
    case unableToChangeWelcomeToTrue = "Unable to change the boolean of false to true in UserDefaults value of welcome"
}
