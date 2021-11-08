//
//  DataResponse.swift
//  VideoApp
//
//  Created by Nidhi.sharma3 on 08/11/21.
//

import Foundation

struct DataResponse: Decodable {
    let errorMessage: String
    let truck: [Truck]

    enum CodingKeys: String, CodingKey {
        case truck = "data"
        case errorMessage
    }
}

// MARK: - Datum
struct Truck: Decodable {
    let name, image, date, time, memory: String
}
