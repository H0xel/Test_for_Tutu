//
//  Tutu_testTests.swift
//  Tutu_testTests
//
//  Created by Ivan Amakhin on 07.10.2021.
//

import XCTest
@testable import Tutu_test

class Tests: XCTestCase {
    
    var mockView: MockMainView!
    
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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
//    func testTableViewNumberOfRows() {
//        let sut = MainTableAssembly.instance().mainTableViewController()
//
//        sut.view
//
//        sut.tableView.publisher
//
//        XCTAssert(numberOfRows > 0, "Data didn't load")
//    }
    
    func testPresenter() {
        let exp = expectation(description: "DataDisplayed")
        mockView = MockMainView(expextation: exp)
        let presenter = MainTableAssembly.instance().presenter(view: mockView)
        
        presenter.viewLoaded()
        waitForExpectations(timeout: 1, handler: nil)
        
        let assembly = NetworkServiceAssembly.instance()
//        assembly.addSubstitution(for: "networkService", with: <#T##SubstitutionClosure<ObjectType>##SubstitutionClosure<ObjectType>##() -> ObjectType#>)
    }
    
    
    func testCryptoService() {
        let sut = CryptoCurrencyServiceAssembly.instance().cryptoCurrencyService
        let exp = expectation(description: "DataLoaded")
        var currencies = [Cryptocurrency]()
        
        sut.get(loadedCount: 99) {
            exp.fulfill()
            currencies = $0.cryptocurrencies
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}

class MockMainView: MainView {
    
    var viewcontoller: UIViewController {
        UIViewController()
    }
    
    var tableViewState: TableViewState? {
        didSet {
            expextation.fulfill()
        }
    }
    
    let expextation: XCTestExpectation
    
    init(expextation: XCTestExpectation) {
        self.expextation = expextation
    }
}

// Написать тестов
