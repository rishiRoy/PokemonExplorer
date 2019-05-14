//
//  ViewController.swift
//  PokemonExplorer
//
//  Created by Rishi Ghosh Roy on 5/12/19.
//  Copyright © 2019 Ivy-Mobility. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //IBOutlets
    
    @IBOutlet weak var lblQuestion:UILabel!
    @IBOutlet weak var lblAnswer:UILabel!
    
    @IBOutlet weak var containerVw:UIView!
    
    private var objJokesVM = JokesVM()
    
    //MARK:- View LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setupInitialLayoutSettings()
    }
    
    private func setupInitialLayoutSettings() {
        
        self.containerVw.isHidden = true
        self.containerVw.layer.cornerRadius = 15.0
        
        if self.objJokesVM.isNetworkAvailable() == true {
         
            self.fetchJokes()
        }
    }
    
    //MARK:- API call to fetch Jokes

    private func fetchJokes() {
        
        objJokesVM.fetchJokes { (success) in
            
            self.setupValues()
        }
    }
    
    private func setupValues() {
        
        DispatchQueue.main.async {
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.containerVw.alpha = 0
                self.containerVw.isHidden = true
                
            }) { (_) in
                
                UIView.animate(withDuration: 0.5, animations: {
                    
                    self.containerVw.alpha = 1.0
                    self.containerVw.isHidden = false
                    self.displayData()
                })
            }
        }
    }
    
    private func displayData() {
        
        self.lblQuestion.text = self.objJokesVM.getJokeTitle()
        self.lblAnswer.text = self.objJokesVM.getJokeAnswer()
    }
    
    //MARK:- IBActions
    
    @IBAction func btnNextClicked() {
    
        self.fetchJokes()
    }
}

