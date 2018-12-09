//
//  GameMasterTest.swift
//  QuizTests
//
//  Created by Hori,Masaki on 2018/12/09.
//  Copyright © 2018 Hori,Masaki. All rights reserved.
//

import XCTest
@testable import Quiz

class GameMasterTest: XCTestCase {

    func testGameMaster() {
        
        let gamaMaster = GameMaster(count: 10, SingleQuestionStack(LocalQuestionLoader()))
        
        XCTAssertNotNil(gamaMaster.next())
        XCTAssertNotNil(gamaMaster.next())
        XCTAssertNotNil(gamaMaster.next())
        XCTAssertNotNil(gamaMaster.next())
        XCTAssertNotNil(gamaMaster.next())
        XCTAssertNotNil(gamaMaster.next())
        XCTAssertNotNil(gamaMaster.next())
        XCTAssertNotNil(gamaMaster.next())
        XCTAssertNotNil(gamaMaster.next())
        XCTAssertNotNil(gamaMaster.next())
        XCTAssertNil(gamaMaster.next())

    }

}
