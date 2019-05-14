//
//  JokeTests.swift
//  PokemonExplorerTests
//
//  Created by Rishi Ghosh Roy on 5/14/19.
//  Copyright © 2019 Ivy-Mobility. All rights reserved.
//

import Foundation
import XCTest

@testable import PokemonExplorer

class JokeTests:XCTestCase {
    
    func testValidJokeQuestion() {
        
        let joke = Joke.init(answer: "dummy answer", question: "", type: "general", id: 101)
        XCTAssertTrue(joke.validJokeQuestion(), "No joke question available, Please click next to show new one")
    }
    
    func testValidJokeAnswer() {
        
        let joke = Joke.init(answer: "", question: "dummy question", type: "general", id: 102)
        XCTAssertTrue(joke.validJokeAnswer(), "No joke answer available, Please click next to show new one")
    }
}
