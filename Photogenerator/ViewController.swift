//
//  ViewController.swift
//  Photogenerator
//
//  Created by Rohan Richard on 31/05/22.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton ()
        button.backgroundColor = .white
        button.setTitle("Get a random Photo!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [.systemGray,.systemRed,.systemBlue, .systemCyan, .systemMint, .systemPink, .systemTeal, .systemIndigo, .systemYellow, .systemPurple, .systemOrange]
    
    @objc func didTapButton(){
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30, y: view.frame.size.height - 150 - view.safeAreaInsets.bottom , width: view.frame.size.width - 60, height: 60)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        view.addSubview(imageView)
        view.addSubview(button)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        button.frame = CGRect(x: 20, y: view.frame.size.height - 50 - view.safeAreaInsets.bottom , width: view.frame.size.width - 40, height: 50)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    func getRandomPhoto()
    {
        let urlstr = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlstr)!
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        imageView.image = UIImage(data: data)
    }
}

