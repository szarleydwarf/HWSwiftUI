//
//  Bundle+extension.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 04/06/2024.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to laocate \(file) in bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed decode \(file) from bundle. Missing \(key.stringValue) - \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed decode \(file) from bundle. Type mismatch - \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed decode \(file) from bundle. Value not found \(type) - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed decode \(file) from bundle. Invalid JSON")
        } catch {
            fatalError("Failed decode \(file) from bundle. Other: \(error.localizedDescription)")
        }        
    }
}
