//
//  Storage.swift
//  homework-1
//
//  Created by michael on 31/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation


enum Directory {
    case documents
    case caches
}


class Storage {
    func store<T: Encodable>(_ object: T, to directory: Directory, as fileName: String) {
        let url = getURL(for: directory).appendingPathComponent(fileName, isDirectory: false)
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch {
            fatalError("Cannot store file")
        }
    }
    
    func retrieve<T: Decodable>(_ fileName: String, from directory: Directory, as type: T.Type) -> T {
        let url = getURL(for: directory).appendingPathComponent(fileName, isDirectory: false)
        
        guard FileManager.default.fileExists(atPath: url.path) else {
            fatalError("File doesn't exist")
        }
        
        if let data = FileManager.default.contents(atPath: url.path) {
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode(type, from: data)
                return model
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("No data at \(url.path)")
        }
    }
    
    func isFileExist(fileName: String, from directory: Directory) -> Bool {
        let url = getURL(for: directory).appendingPathComponent(fileName, isDirectory: false)
        return FileManager.default.fileExists(atPath: url.path)
    }
    
    
    private func getURL(for directory: Directory) -> URL {
        var searchDirectory: FileManager.SearchPathDirectory
        
        switch directory {
        case .documents:
            searchDirectory = .documentDirectory
        case .caches:
            searchDirectory = .cachesDirectory
        }
        
        guard let url = FileManager.default.urls(for: searchDirectory, in: .userDomainMask).first else {
            fatalError("Could npot create documents folder")
        }
        return url
    }

}
