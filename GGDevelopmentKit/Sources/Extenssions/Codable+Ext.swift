//
//  Codable+Ext.swift
//  GGDevelopmentKit
//
//  Created by George Vilnei Arboite Gomes on 04/02/22.
//  Copyright © 2022 George Gomes. All rights reserved.
//

import Foundation

extension Encodable {
    
    static func encodeJson<T: Codable>(from object: T) throws -> Data {
        let encoder = JSONEncoder()
        do {
           return try encoder.encode(object)
        } catch {
            throw error
        }
    }
    
    func jsonToData() throws -> Data {
        let encoder = JSONEncoder()
        do {
           return try encoder.encode(self)
        } catch {
            throw error
        }
    }
}
