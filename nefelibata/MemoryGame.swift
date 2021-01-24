//
//  SwiftUIView.swift
//  nefelibata
//
//  Created by hhhhh on 2021/1/20.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    
    var indexOfTheOnlyAndOnlyFaceUp: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            
            if let potetialMatchIndex = indexOfTheOnlyAndOnlyFaceUp {
                if cards[chosenIndex].content == cards[potetialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potetialMatchIndex].isMatched = true
                }
                
                self.cards[chosenIndex].isFaceUp = true
            }
            else {
                indexOfTheOnlyAndOnlyFaceUp = chosenIndex
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
