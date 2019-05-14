//
//  Joke.swift
//  PokemonExplorer
//
//  Created by Rishi Ghosh Roy on 5/12/19.
//  Copyright © 2019 Ivy-Mobility. All rights reserved.
//

import Foundation

struct Joke : Codable {
    
    var answer:String?
    var question:String?
    var type:String?
    var id:Int?
    
    enum CodingKeys: String, CodingKey {
        case question = "setup"
        case answer = "punchline"
    }
    
    func validJokeQuestion() -> Bool {
        
        return self.question?.count ?? 0 > 0
    }
    
    func validJokeAnswer() -> Bool {
        
        return self.answer?.count ?? 0 > 0
    }
}
