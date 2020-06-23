//
//  DetailViewControllerTests.swift
//  NewsTests
//
//  Created by chandrasekhar yadavally on 6/16/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import XCTest
@testable import News

class DetailViewControllerTests: XCTestCase {
    let controller = DetailViewController()

    override func setUp() {
        super.setUp()
        XCTAssertNotNil(controller.articleImageView)
        XCTAssertNotNil(controller.authorLabel)
        XCTAssertNotNil(controller.titleLabel)
        XCTAssertNotNil(controller.descriptionLabel)
        XCTAssertNotNil(controller.readMoreButton)
        XCTAssertNotNil(controller.webView)
        controller.configureUI()
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
