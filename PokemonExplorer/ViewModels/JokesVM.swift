//
//  JokesVM.swift
//  PokemonExplorer
//
//  Created by Rishi Ghosh Roy on 5/12/19.
//  Copyright © 2019 Ivy-Mobility. All rights reserved.
//

import UIKit
import Foundation

class JokesVM: NSObject {

    private var objJokes:Joke?
    private let appDelegate : AppDelegate = AppDelegate().sharedInstance()

    public func fetchJokes(completionHandler:@escaping (Bool) -> ()) {
        
        Loader.sharedInstance.showLoader(title: Alert.loading, message: Alert.please_wait)
        
        var request = URLRequest(url: URL(string: API.jokes)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            do {
                let jsonDecoder = JSONDecoder()
                
                guard let responseData = data else {
                    
                    return
                }
                
                self.objJokes = try jsonDecoder.decode(Joke.self, from: responseData)
                Loader.sharedInstance.removeLoader()
                completionHandler(true)
            } catch {
                print("JSON Serialization error")
                Loader.sharedInstance.removeLoader()
                completionHandler(false)
            }
            
        }).resume()
    }
    
    public func getJokeTitle() -> String {
        
        guard let jokeTitle = self.objJokes?.question else {
            
            return ""
        }
        
        return jokeTitle
    }
    
    public func getJokeAnswer() -> String {
        
        guard let jokeAnswer = self.objJokes?.answer else {
            
            return ""
        }
        
        return jokeAnswer
    }
    
    public func isNetworkAvailable() -> Bool {
        
        if appDelegate.reachability.connection == .none {
            return false
        }
        
        return true
    }
}
