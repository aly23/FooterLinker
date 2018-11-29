//
//  FooterLinker.swift
//  FooterLinker
//
//  Created by Alice Migliorati on 20/11/2018.
//  Copyright © 2018 Alice Migliorati. All rights reserved.
//

import UIKit

final public class FooterLinker: NSObject {
    
    private let scrollView: UIScrollView
    private let footerView: UIView
    
    private var observer: NSKeyValueObservation?
    private var footerHeight: CGFloat { return footerView.getConstant(of: .height) }
    private var normalFooterHeight: CGFloat = 0
    
    
    deinit {
        observer?.invalidate()
    }
    
    public init(scrollView: UIScrollView, footerView: UIView) {
        self.scrollView = scrollView
        self.footerView = footerView
        self.normalFooterHeight = footerView.getConstant(of: .height)
        
        super.init()
        
        setup()
    }
    
    
    private func setup() {
        setupScrollView()
        setupFooterView()
        setupObserver()
    }
    
    private func setupScrollView() {
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: footerHeight, right: 0)
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: footerHeight, right: 0)
    }
    
    private func setupFooterView() {
        
        // calculate footerView bottom based on contentSize
        let bottom = (scrollView.contentSize.height > scrollView.bounds.height) ? -footerHeight : 0
        
        // update bottom constraint
        updateFooterViewBottom(with: bottom)
    }
    
    private func setupObserver() {
        observer = scrollView.observe(\.contentOffset, options: .new) { [weak self] (object, change) in
            self?.updateSubViews(with: object.contentOffset)
        }
    }
    
    
    private func updateFooterViewBottom(with value: CGFloat) {
        if let bottomConstraint = scrollView.superview?.constraints.filter({
            if let firstItem = $0.firstItem as? UIView, let secondItem = $0.secondItem as? UIView {
                return (firstItem == scrollView && secondItem == footerView) || (firstItem == footerView && secondItem == scrollView)
            }
            return false
        }).first {
            bottomConstraint.constant = value
        }
    }
    
    private func updateSubViews(with newOffset: CGPoint) {
        
        // calculate the amount of the content that needs to be showed
        let contentToShow = (scrollView.contentSize.height - (scrollView.bounds.height + newOffset.y)) + scrollView.contentInset.bottom
        
        //
        // 1. BOTTOM HANDLING
        //
        // constraint the new bottom value
        let newBottom = -max(0, min(footerHeight, contentToShow))
        
        // update bottom constraint
        updateFooterViewBottom(with: newBottom)
        
        
        //
        // 1. HEIGHT HANDLING
        //
        // stretch footer height if the size of the scrollView's content view is bigger than bounds and scrollView is bouncing
        //
        var newHeight = normalFooterHeight
        if scrollView.contentSize.height > scrollView.bounds.height, contentToShow < 0 {
            newHeight += abs(contentToShow)
        }
        else if scrollView.contentOffset.y > 0, contentToShow < 0 {
            newHeight += scrollView.contentOffset.y
        }
        
        // update height constraint
        footerView.updateConstraint(attribute: .height, constant: newHeight)
    }
}

private extension UIView {
    
    func updateConstraint(attribute: NSLayoutConstraint.Attribute, constant: CGFloat) {
        if let constraint = (constraints.filter{$0.firstAttribute == attribute}.first) {
            constraint.constant = constant
        }
    }
    
    func getConstant(of attribute: NSLayoutConstraint.Attribute) -> CGFloat {
        if let constraint = (constraints.filter{$0.firstAttribute == attribute}.first) {
            return constraint.constant
        }
        return 0
    }
}

