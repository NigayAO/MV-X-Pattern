//
//  ViewController.swift
//  MV(X) Pattern
//
//  Created by Alik Nigay on 01.03.2022.
//

import UIKit

class GreetingViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    private var viewModel: GreetingViewModelProtocol! {
        didSet {
            viewModel.greetingDidChange = { [weak self]viewModel in
                self?.textLabel.text = viewModel.greeting
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let person = Person(name: "Tim", surname: "Cook")
        viewModel = GreetingViewModel.init(person: person)
    }

    @IBAction func buttonPressed() {
        viewModel.showGreeting()
    }
    
}

