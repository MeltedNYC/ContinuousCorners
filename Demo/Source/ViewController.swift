//
//  ViewController.swift
//  Demo
//
//  Created by Noah Hilt on 9/28/18.
//  Copyright © 2018 Melted. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let tabBar: RoundedTabBar
    private let topSlider: UISlider
    private let bottomSlider: UISlider
    
    init() {
        tabBar = RoundedTabBar()
        topSlider = UISlider()
        bottomSlider = UISlider()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        view.addSubview(tabBar)
        
        let topSliderLabel = UILabel()
        topSliderLabel.font = .boldSystemFont(ofSize: 22)
        topSliderLabel.text = "Top Radius"
        view.addSubview(topSliderLabel)

        topSlider.minimumValue = 0
        topSlider.maximumValue = 38.5
        topSlider.value = Float(tabBar.topRadius)
        topSlider.addTarget(self, action: #selector(topSliderValueChanged), for: .valueChanged)
        view.addSubview(topSlider)
        
        let bottomSliderLabel = UILabel()
        bottomSliderLabel.font = .boldSystemFont(ofSize: 22)
        bottomSliderLabel.text = "Bottom Radius"
        view.addSubview(bottomSliderLabel)
        
        bottomSlider.minimumValue = 0
        bottomSlider.maximumValue = 38.5
        bottomSlider.value = Float(tabBar.bottomRadius)
        bottomSlider.addTarget(self, action: #selector(bottomSliderValueChanged), for: .valueChanged)
        view.addSubview(bottomSlider)

        tabBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([tabBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 6),
                                     tabBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -6),
                                     tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -6),
                                     tabBar.heightAnchor.constraint(equalToConstant: 96)])
        
        topSliderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([topSliderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     topSliderLabel.bottomAnchor.constraint(equalTo: topSlider.topAnchor, constant: -8)])
        
        topSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([topSlider.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 44),
                                     topSlider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -44),
                                     topSlider.bottomAnchor.constraint(equalTo: bottomSliderLabel.topAnchor, constant: -8)])
        
        bottomSliderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([bottomSliderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     bottomSliderLabel.bottomAnchor.constraint(equalTo: bottomSlider.topAnchor, constant: -8)])
        
        bottomSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([bottomSlider.leftAnchor.constraint(equalTo: topSlider.leftAnchor),
                                     bottomSlider.rightAnchor.constraint(equalTo: topSlider.rightAnchor),
                                     bottomSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
    
    @objc private func topSliderValueChanged() {
        tabBar.topRadius = CGFloat(topSlider.value)
    }
    
    @objc private func bottomSliderValueChanged() {
        tabBar.bottomRadius = CGFloat(bottomSlider.value)
    }
}

