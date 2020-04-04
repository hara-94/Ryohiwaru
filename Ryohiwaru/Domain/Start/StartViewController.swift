//
//  StartViewController.swift
//  Ryohiwaru
//
//  Created by 原ひかる on 2020/04/03.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import Wireframe
import Resource

final class StartViewController: StartBaseView<StartDepedency> {
    
    let scrollView: UIScrollView = .init()
    let titleView: UIView = .init()
    let dateView: UIView = .init()
    let confirmView: UIView = .init()
    let viewHeight: CGFloat = 300
    let pageControl: UIPageControl = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color.Background.main
        
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        scrollView.addSubview(titleView)
        scrollView.addSubview(dateView)
        scrollView.addSubview(confirmView)
        
        scrollView.delegate = self
        
        setScrollView()
        setTitleView()
        setDateView()
        setConfirmView()
        setPageControl()
    }
}

extension StartViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
}

private extension StartViewController {
    func setScrollView() {
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalToConstant: view.frame.width),
            scrollView.heightAnchor.constraint(equalToConstant: viewHeight),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func setTitleView() {
        titleView.backgroundColor = .red
        titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.widthAnchor.constraint(equalToConstant: view.frame.width),
            titleView.heightAnchor.constraint(equalToConstant: viewHeight),
            titleView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            titleView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            titleView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -view.frame.width * 2)
        ])
    }
    
    func setDateView() {
        dateView.backgroundColor = .blue
        dateView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateView.widthAnchor.constraint(equalToConstant: view.frame.width),
            dateView.heightAnchor.constraint(equalToConstant: viewHeight),
            dateView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            dateView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            dateView.leadingAnchor.constraint(equalTo: titleView.trailingAnchor),
            dateView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -view.frame.width)
        ])
    }
    
    func setConfirmView() {
        confirmView.backgroundColor = .yellow
        confirmView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            confirmView.widthAnchor.constraint(equalToConstant: view.frame.width),
            confirmView.heightAnchor.constraint(equalToConstant: viewHeight),
            confirmView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            confirmView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            confirmView.leadingAnchor.constraint(equalTo: dateView.trailingAnchor),
            confirmView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
    }
    
    func setPageControl() {
        pageControl.numberOfPages = 3
        pageControl.currentPageIndicatorTintColor = Color.Selected.selected
        pageControl.pageIndicatorTintColor = Color.Selected.unselected
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
