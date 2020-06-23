//
//  NewsViewControllerTests.swift
//  NewsTests
//
//  Created by chandrasekhar yadavally on 6/16/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import XCTest
@testable import News

class NewsViewControllerTests: XCTestCase {
    let controller = NewsViewController()
    override func setUp() {
        super.setUp()
        controller.configureCollectionView()
        controller.api.getArticles { results in
            switch results {
            case .success(let response):
                XCTAssertNotNil(response.articles)
            case .failure(let error):
                XCTAssertNotNil(error.rawValue)
            }
        }
        controller.configureDatasource()
    }
    
    
    func testconfigureDatasource() {
        XCTAssertNotNil(controller.datasource)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    
}
