//
//  ViewController.swift
//  CustomPageControl
//
//  Created by Shivaditya Kumar on 2022-12-01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControlFirst: CustomPageControl!
    var currentPage = 0 {
        didSet {
            self.pageControlFirst.currentPage = self.currentPage
        }
    }
    let colorList: [UIColor] = [.red, .blue, .green, .yellow, .gray]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    private func setUI() {
        // CollectionView
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.isPagingEnabled = true
        // PageControl
        self.pageControlFirst.numberOfPages = colorList.count
        self.pageControlFirst.currentPage = 0
        self.pageControlFirst.backgroundColor = .clear
    }
}
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.colorList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCVC", for: indexPath) as? CustomCVC else {return  UICollectionViewCell()}
        cell.contentView.backgroundColor = self.colorList[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page =  Int(scrollView.contentOffset.x / (scrollView.frame.width ))
        self.currentPage = page
        debugPrint(currentPage)
    }
}

class CustomCVC: UICollectionViewCell {}
