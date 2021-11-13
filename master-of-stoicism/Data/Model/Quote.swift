//
//  Quote.swift
//  master-of-stoicism
//
//  Created by Marcus Ziadé on 13.11.2021.
//

import Foundation

struct Quote: Codable, Identifiable {
    
    var id: String { UUID().uuidString }
    
    let text: String
    let author: String
}

extension Quote {
    
    static var mockQuote: Quote {
        Quote(
            text: "You have power over your mind - not outside events. Realize this, and you will find strength.",
            author: "Marcus Aurelius"
        )
    }
    
    static var mockQuotes: [Quote] {
        return (0...10).map { index -> Quote in
            return Quote(
                text: "\(index): You have power over your mind - not outside events. Realize this, and you will find strength.",
                author: "Marcus Aurelius"
            )
        }
    }
}
