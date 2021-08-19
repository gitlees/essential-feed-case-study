//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Stas Lee on 18/8/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation

public protocol FeedImageDataLoaderTask {
    func cancel()
}

public protocol FeedImageDataLoader {
    typealias Result = Swift.Result<Data, Error>

    func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> FeedImageDataLoaderTask
}
