//MIT License
//
//Copyright (c) 2017 Manny Guerrero
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

import XCTest
@testable import SwiftEnv

final class SwiftEnvTests: XCTestCase {
    
    // MARK: - Private Instance Attributes
    private var ENV: SwiftEnv!
    
    
    // MARK: - Setup & Tear Down
    override func setUp() {
        ENV = SwiftEnv()
        super.setUp()
    }
    
    override func tearDown() {
        ENV = nil
        super.tearDown()
    }
    
    
    // MARK: - Functional Tests
    func testValueForEnviromentVariable() {
        guard let path1 = ENV.valueForEnvironmentVariable("PATH") else {
            XCTFail("Error retrieving enviroment variable with method")
            return
        }
        XCTAssertFalse(path1.isEmpty, "Value should not be empty")
        guard let path2 = ENV["PATH"] else {
            XCTFail("Error retrieving enviroment variable with subscript")
            return
        }
        XCTAssertFalse(path2.isEmpty, "Value should not be empty")
    }
    
    func testSetValueForEnviromentVariable() {
        ENV.setValueForEnvironmentVariable("FULL_HOUSE_DAD", value: "Bob Saget")
        guard let fullHouseDad = ENV["FULL_HOUSE_DAD"] else {
            XCTFail("Value was never set with method")
            return
        }
        XCTAssertEqual(fullHouseDad, "Bob Saget", "Wrong value was set")
        ENV["FULL_HOUSE_UNCLE"] = "Uncle Jesse"
        guard let fullHouseUncle = ENV["FULL_HOUSE_UNCLE"] else {
            XCTFail("Value was never set with subscript")
            return
        }
        XCTAssertEqual(fullHouseUncle, "Uncle Jesse", "Wrong value was set")
    }
    
    func testRemoveValueForEnviromentVariable() {
        ENV["STAR_WARS_CHARACTER"] = "Luke Skywalker"
        guard let _ = ENV["STAR_WARS_CHARACTER"] else {
            XCTFail("Value was never set with subscript")
            return
        }
        ENV["STAR_WARS_CHARACTER"] = nil
        let starWarsCharacter = ENV["STAR_WARS_CHARACTER"]
        XCTAssertNil(starWarsCharacter, "Value should be nil")
    }
    
    
    // MARK: - Test Methods
    static var allTests = [
        ("testValueForEnviromentVariable", testValueForEnviromentVariable),
    ]
}
