//
//  ViewController.swift
//  CatFactsApp
//
//  Created by DonMokong on 12/15/24.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let factLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let catService = CatService.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        fetchCatData()
    }
    
    private func setupUI() {
        view.addSubview(imageView)
        view.addSubview(factLabel)
        view.addSubview(activityIndicator)
        
        // Constraints
        NSLayoutConstraint.activate([
            // Image View
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            // Fact Label
            factLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            factLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            factLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            factLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Activity Indicator
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: factLabel.bottomAnchor, constant: 20),
        ])
        
        // Add tap gesture to fetch new data
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(fetchCatData))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func fetchCatData() {
        activityIndicator.startAnimating()
        factLabel.text = ""
        imageView.image = nil
        
        let group = DispatchGroup()
        
        group.enter()
        catService.fetchCatFact { [weak self] result in
            switch result {
            case .success(let fact):
                DispatchQueue.main.async {
                    self?.factLabel.text = fact
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.factLabel.text = "Error: \(error.localizedDescription)"
                }
            }
            group.leave()
        }
        
        group.enter()
        catService.fetchCatImage { [weak self] result in
            switch result {
            case .success(let url):
                DispatchQueue.main.async {
                    self?.imageView.kf.setImage(with: URL(string: url))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.factLabel.text = "Error: \(error.localizedDescription)"
                }
            }
            group.leave()
        }
        
        group.notify(queue: .main) {
            self.activityIndicator.stopAnimating()
        }
    }
}
