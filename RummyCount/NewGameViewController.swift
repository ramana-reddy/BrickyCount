//
//  ViewController.swift
//  RummyCount
//
//  Created by Venkata Mandala on 14/05/2016.
//  Copyright © 2016 Ramana Reddy. All rights reserved.
//

import UIKit

class NewGameViewController: UIViewController {

    let numberOfPlayersLabel = UILabel()
    let numberOfPlayersTextField = UITextField()
    let dropLabel = UILabel()
    let dropTextField = UITextField()
    let middleDropLabel = UILabel()
    let middleDropTextField = UITextField()
    let fullCountLabel = UILabel()
    let fullCountTextField = UITextField()
    let stakeLabel = UILabel()
    let stakeTextField = UITextField()
    let gameTotalCountLabel = UILabel()
    let gameTotalCountTextField = UITextField()
    let nextButton = UIButton(type: .System)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupUI()
        setupConstraints()
    }

    func setupUI(){
        
        numberOfPlayersLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfPlayersLabel.text = "Select no of players"
        numberOfPlayersLabel.setContentHuggingPriority(251, forAxis: .Horizontal)
        view.addSubview(numberOfPlayersLabel)
        
        numberOfPlayersTextField.translatesAutoresizingMaskIntoConstraints = false
        numberOfPlayersTextField.borderStyle = .RoundedRect
        view.addSubview(numberOfPlayersTextField)
        
        dropLabel.translatesAutoresizingMaskIntoConstraints = false
        dropLabel.text = "Drop count"
        view.addSubview(dropLabel)
        
        dropTextField.translatesAutoresizingMaskIntoConstraints = false
        dropTextField.borderStyle = .RoundedRect
        view.addSubview(dropTextField)
        
        middleDropLabel.translatesAutoresizingMaskIntoConstraints = false
        middleDropLabel.text = "Middle drop count"
        view.addSubview(middleDropLabel)
        
        middleDropTextField.translatesAutoresizingMaskIntoConstraints = false
        middleDropTextField.borderStyle = .RoundedRect
        view.addSubview(middleDropTextField)
        
        fullCountLabel.translatesAutoresizingMaskIntoConstraints = false
        fullCountLabel.text = "Full count"
        view.addSubview(fullCountLabel)
        
        fullCountTextField.translatesAutoresizingMaskIntoConstraints = false
        fullCountTextField.borderStyle = .RoundedRect
        view.addSubview(fullCountTextField)
        
        stakeLabel.translatesAutoresizingMaskIntoConstraints = false
        stakeLabel.text = "Stake"
        view.addSubview(stakeLabel)
        
        stakeTextField.translatesAutoresizingMaskIntoConstraints = false
        stakeTextField.borderStyle = .RoundedRect
        view.addSubview(stakeTextField)
        
        gameTotalCountLabel.translatesAutoresizingMaskIntoConstraints = false
        gameTotalCountLabel.text = "Total count"
        view.addSubview(gameTotalCountLabel)
        
        gameTotalCountTextField.translatesAutoresizingMaskIntoConstraints = false
        gameTotalCountTextField.borderStyle = .RoundedRect
        view.addSubview(gameTotalCountTextField)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", forState: .Normal)
        nextButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        nextButton.backgroundColor = UIColor.init(red: 26.0/255.0, green: 62.0/255.0, blue: 7.0/255.0, alpha: 1.0)
        nextButton.addTarget(self, action: #selector(nextButtonClicked(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(nextButton)
    }
    
    func setupConstraints() {
    
        let containerLayoutGuide = UILayoutGuide()
        view.addLayoutGuide(containerLayoutGuide)
        
        //Number of players
        numberOfPlayersLabel.leadingAnchor.constraintEqualToAnchor(containerLayoutGuide.leadingAnchor).active = true
        numberOfPlayersLabel.firstBaselineAnchor.constraintEqualToAnchor(numberOfPlayersTextField.firstBaselineAnchor).active = true
        numberOfPlayersTextField.leadingAnchor.constraintEqualToAnchor(numberOfPlayersLabel.trailingAnchor, constant: 10).active = true
        numberOfPlayersTextField.trailingAnchor.constraintEqualToAnchor(containerLayoutGuide.trailingAnchor).active = true
        numberOfPlayersTextField.topAnchor.constraintEqualToAnchor(containerLayoutGuide.topAnchor).active = true
        
        //Drop Count
        dropTextField.leftAnchor.constraintEqualToAnchor(numberOfPlayersTextField.leftAnchor).active = true
        dropTextField.rightAnchor.constraintEqualToAnchor(numberOfPlayersTextField.rightAnchor).active = true
        dropTextField.topAnchor.constraintEqualToAnchor(numberOfPlayersTextField.bottomAnchor, constant: 10).active = true
        dropLabel.leftAnchor.constraintEqualToAnchor(numberOfPlayersLabel.leftAnchor).active = true
        dropLabel.rightAnchor.constraintEqualToAnchor(numberOfPlayersLabel.rightAnchor).active = true
        dropLabel.firstBaselineAnchor.constraintEqualToAnchor(dropTextField.firstBaselineAnchor).active = true
        
        //Middle Drop Count
        middleDropTextField.topAnchor.constraintEqualToAnchor(dropTextField.bottomAnchor, constant: 10).active = true
        middleDropTextField.leftAnchor.constraintEqualToAnchor(dropTextField.leftAnchor).active = true
        middleDropTextField.rightAnchor.constraintEqualToAnchor(dropTextField.rightAnchor).active = true
        middleDropLabel.firstBaselineAnchor.constraintEqualToAnchor(middleDropTextField.firstBaselineAnchor).active = true
        middleDropLabel.leftAnchor.constraintEqualToAnchor(dropLabel.leftAnchor).active = true
        middleDropLabel.rightAnchor.constraintEqualToAnchor(middleDropLabel.rightAnchor).active = true
        
        //Full Count
        fullCountTextField.topAnchor.constraintEqualToAnchor(middleDropTextField.bottomAnchor, constant: 10).active = true
        fullCountTextField.leftAnchor.constraintEqualToAnchor(middleDropTextField.leftAnchor).active = true
        fullCountTextField.rightAnchor.constraintEqualToAnchor(middleDropTextField.rightAnchor).active = true
        fullCountLabel.firstBaselineAnchor.constraintEqualToAnchor(fullCountTextField.firstBaselineAnchor).active = true
        fullCountLabel.leftAnchor.constraintEqualToAnchor(middleDropLabel.leftAnchor).active = true
        fullCountLabel.rightAnchor.constraintEqualToAnchor(middleDropLabel.rightAnchor).active = true
        
        //Stake
        stakeTextField.topAnchor.constraintEqualToAnchor(fullCountTextField.bottomAnchor, constant: 10).active = true
        stakeTextField.leftAnchor.constraintEqualToAnchor(fullCountTextField.leftAnchor).active = true
        stakeTextField.rightAnchor.constraintEqualToAnchor(fullCountTextField.rightAnchor).active = true
        stakeLabel.firstBaselineAnchor.constraintEqualToAnchor(stakeTextField.firstBaselineAnchor).active = true
        stakeLabel.leftAnchor.constraintEqualToAnchor(fullCountLabel.leftAnchor).active = true
        stakeLabel.rightAnchor.constraintEqualToAnchor(fullCountLabel.rightAnchor).active = true
        
        //Game Total 
        gameTotalCountTextField.topAnchor.constraintEqualToAnchor(stakeTextField.bottomAnchor, constant: 10).active = true
        gameTotalCountTextField.leftAnchor.constraintEqualToAnchor(stakeTextField.leftAnchor).active = true
        gameTotalCountTextField.rightAnchor.constraintEqualToAnchor(stakeTextField.rightAnchor).active = true
        gameTotalCountLabel.firstBaselineAnchor.constraintEqualToAnchor(gameTotalCountTextField.firstBaselineAnchor).active = true
        gameTotalCountLabel.leftAnchor.constraintEqualToAnchor(stakeLabel.leftAnchor).active = true
        gameTotalCountLabel.rightAnchor.constraintEqualToAnchor(stakeLabel.rightAnchor).active = true
        gameTotalCountTextField.bottomAnchor.constraintEqualToAnchor(containerLayoutGuide.bottomAnchor).active = true
        
        let viewMarginsGuide = view.layoutMarginsGuide
        containerLayoutGuide.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        containerLayoutGuide.leadingAnchor.constraintEqualToAnchor(viewMarginsGuide.leadingAnchor).active = true
        containerLayoutGuide.trailingAnchor.constraintEqualToAnchor(viewMarginsGuide.trailingAnchor).active = true
        
        //Next Button
        nextButton.topAnchor.constraintEqualToAnchor(containerLayoutGuide.bottomAnchor, constant: 20).active = true
        nextButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        NSLayoutConstraint(item: nextButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 150).active = true
    }
    
    func nextButtonClicked(sender: UIButton) {
        
    }
}

