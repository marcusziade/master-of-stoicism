//
//  QuoteService.swift
//  master-of-stoicism
//
//  Created by Marcus Ziadé on 13.11.2021.
//

import Combine
import Foundation

final class QuoteService {
    
    func getQuotes() -> AnyPublisher<[Quote], Error> {
        Just(Bundle.main.url(forResource: "quotes", withExtension: "json"))
            .compactMap { $0 }
            .tryMap { try Data(contentsOf: $0) }
            .decode(type: QuotesResponse.self, decoder: JSONDecoder())
            .map(\.quotes)
            .eraseToAnyPublisher()
    }
}
