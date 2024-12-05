//
//  FoodCollectionViewCell.swift
//  MiniProjectUIKit
//
//  Created by Bryan Vernanda on 05/12/24.
//

import UIKit

// MARK: - Custom UICollectionViewCell
class FoodCollectionViewCell: UICollectionViewCell {
    static let identifier = "FoodCollectionViewCell"
    
    private var mealImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private var mealNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private var mealAreaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        label.layer.cornerRadius = 6
        label.clipsToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupCellBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with food: Food) {
        if let urlString = food.strMealThumb, let url = URL(string: urlString) {
            mealImageView.load(url: url)
        }
        mealNameLabel.text = food.strMeal
        mealAreaLabel.text = food.strArea
    }
    
    private func setupView() {
        contentView.addSubview(mealImageView)
        contentView.addSubview(mealNameLabel)
        contentView.addSubview(mealAreaLabel)
        
        mealAreaLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        NSLayoutConstraint.activate([
            mealImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mealImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mealImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mealImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            
            mealNameLabel.topAnchor.constraint(equalTo: mealImageView.bottomAnchor, constant: 8),
            mealNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            mealNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            mealAreaLabel.topAnchor.constraint(equalTo: mealNameLabel.bottomAnchor, constant: 4),
            mealAreaLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            mealAreaLabel.widthAnchor.constraint(equalToConstant: 72),
            mealAreaLabel.heightAnchor.constraint(equalToConstant: 16),
            mealAreaLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    private func setupCellBackground() {
        // Apply shadow to the cell's layer
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1 // Adjust opacity to make the shadow subtle
        layer.shadowOffset = CGSize(width: 0, height: 4) // Shadow below the card
        layer.shadowRadius = 4 // Spread of the shadow
        layer.cornerRadius = 8
        
        // Ensure contentView doesn’t clip the shadow
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        
        // Give a background color for the cell
        contentView.backgroundColor = .white
    }
    
}

