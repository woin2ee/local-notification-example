//
//  LocalNotificationExampleTests.swift
//  LocalNotificationExampleTests
//
//  Created by Jaewon on 2022/06/29.
//

import XCTest
@testable import LocalNotificationExample

class LocalNotificationExampleTests: XCTestCase {
    
    var dateComponents: DateComponents!
    
    override func setUpWithError() throws {
        self.dateComponents = DateComponents(hour: 13, minute: 40)
    }

    override func tearDownWithError() throws {
    }

    func test_DateComponents생성() {
        // given

        // when
        
        // then
        XCTAssertEqual(self.dateComponents.hour!, 13)
        XCTAssertEqual(self.dateComponents.minute!, 40)
    }

    func test() {
        // given
        let dateFormatter: DateFormatter = {
            let df = DateFormatter()
            df.dateFormat = "HH:mm"
            return df
        }()
        
        // when
        let date = Date.to(dateComponents)
        
        // then
        XCTAssertEqual(dateFormatter.string(from: date!), "13:40")
        
    }
    
}
