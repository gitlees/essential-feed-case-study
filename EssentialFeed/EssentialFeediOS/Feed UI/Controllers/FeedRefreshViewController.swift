//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Stas Lee on 20/8/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import UIKit

final class FeedRefreshViewController: NSObject {
    private let presenter: FeedPresenter
    
    private(set) lazy var view = loadView()
    
    init(presenter: FeedPresenter) {
        self.presenter = presenter
    }
        
    @objc func refresh() {
        presenter.loadFeed()
    }
    
    private func loadView() -> UIRefreshControl {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return view
    }
}

extension FeedRefreshViewController: FeedLoadingView {
    func display(isLoading: Bool) {
        isLoading ? view.beginRefreshing() : view.endRefreshing()
    }
}
