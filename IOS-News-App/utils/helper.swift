//
//  helper.swift
//  IOS-News-App
//
//  Created by Bholanath Barik on 16/07/24.
//

import Foundation

class Helper {
    func convertTimestampToReadableDateAndTime(_ timestamp: String) -> String? {
        // Define the input date format
        let inputFormatter = ISO8601DateFormatter()
        inputFormatter.formatOptions = [.withInternetDateTime] // Remove fractional seconds if not needed
        
        // Parse the timestamp to a Date object
        guard let date = inputFormatter.date(from: timestamp) else {
            return nil
        }
        
        // Define the output date format
        let outputFormatter = DateFormatter()
        outputFormatter.dateStyle = .medium
        outputFormatter.timeStyle = .medium
        outputFormatter.amSymbol = "AM"
        outputFormatter.pmSymbol = "PM"
        
        // Convert the Date object to a readable string
        let readableDateAndTime = outputFormatter.string(from: date)
        return readableDateAndTime
    }
}
