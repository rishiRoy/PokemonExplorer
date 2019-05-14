//
//  JokesVMTest.swift
//  PokemonExplorerTests
//
//  Created by Rishi Ghosh Roy on 5/14/19.
//  Copyright © 2019 Ivy-Mobility. All rights reserved.
//

import Foundation
import XCTest

@testable import PokemonExplorer

class JokesVMTest:XCTestCase {

    func testIsNetworkAvailable() {
        
        let objJokesVM = JokesVM()
        XCTAssertTrue(objJokesVM.isNetworkAvailable(), "Internet connection is avilable")
    }
    
    func testJokesAPIResponseData() {
        guard let url = URL(string: API.jokes) else {
            return
        }
        let promise = expectation(description: "Response Received of general type")
        URLSession.shared.dataTask(with: url) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                if let result = json as? NSDictionary {
                    
                    XCTAssertNotNil(data, "data downloaded.")
                    XCTAssertTrue(result["type"] as? String == "general")
                    promise.fulfill()
                }
            } catch let err {
                print("Err", err)
                XCTFail()
            }
            }.resume()
        
        waitForExpectations(timeout: 100.0) { (error) in
            
           // XCTFail("timeout")
        }
    }
}
