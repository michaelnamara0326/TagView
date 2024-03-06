//
//  ViewController.swift
//
//
//  Created by Michael Shen[沈柏帆] on 2024/3/5.
//

import UIKit
import TagView

extension UIColor {
    var suColor: Color { Color(self) }
}

class ViewController: UIViewController {
    private lazy var tagView: TagView = {
        let view = TagView()
        return view
    }()
    
    private lazy var testButton: UIButton = {
        let button = UIButton()
        button.setTitle("test", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let tagViewController = UIHostingController(rootView: tagView).view!
        view.backgroundColor = .white
        view.addSubview(tagView.uiview)
        view.addSubview(testButton)
        tagViewController.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagViewController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tagViewController.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tagViewController.widthAnchor.constraint(equalToConstant: 300),
            tagViewController.heightAnchor.constraint(equalToConstant: 200),
            
            testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testButton.topAnchor.constraint(equalTo: tagViewController.bottomAnchor, constant: 8),
            testButton.widthAnchor.constraint(equalToConstant: 50),
            testButton.heightAnchor.constraint(equalToConstant: 50)
//            tagView.topAnchor.constraint(equalTo: view.topAnchor),
//            tagView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tagView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tagView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc
    func buttonPressed() {
        print("a")
        print(tagView.model.currentRow)
        tagView.model.alignmentIndex = 1
//        tagView.model.textColor = [Color.red, Color.blue, Color.green].randomElement()!
        tagView.model.textColor = .
    }
}
