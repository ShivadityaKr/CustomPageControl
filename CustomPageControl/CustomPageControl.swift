//
//  CustomPageControl.swift
//  CustomPageControl
//
//  Created by Shivaditya Kumar on 2022-12-01.
//

import UIKit

class CustomPageControl: UIView {
    var stack : UIStackView!
    var numberOfPages = 0 {
        didSet {
            createDots()
        }
    }
    var barView : UIView!
    var viewList: [UIView] = []
    var currentPage = 0 {
        didSet {
            stack.removeArrangedSubview(barView)
            stack.insertArrangedSubview(barView, at: currentPage)
            for (index, item) in stack.arrangedSubviews.enumerated() {
                if index == currentPage {
                    item.backgroundColor = .black
                } else if index < currentPage {
                    item.backgroundColor = .gray
                } else {
                    item.backgroundColor = .clear
                }
            }
        }
    }
    func createDots() {
        self.backgroundColor = .white
        stack = UIStackView(frame: CGRect(x: 0, y: 0, width: 12 * (numberOfPages - 1) + 23 , height: 8))
        stack.center = self.center
        stack.distribution = .fill
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.spacing = 6
        barView = getBar(color: .black)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(barView)
        for _ in 2...numberOfPages {
            stack.addArrangedSubview(getDot(color: .gray))
        }
        addSubview(stack)
    }
    private func getDot(color: UIColor) -> UIView {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 8).isActive = true
        view.widthAnchor.constraint(equalToConstant: 12).isActive = true
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 4
        view.layer.borderColor = color.cgColor
        return view
    }
    private func getBar(color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.heightAnchor.constraint(equalToConstant:    8).isActive = true
        view.widthAnchor.constraint(equalToConstant: 23).isActive = true
        view.layer.cornerRadius = 4
        return view
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
