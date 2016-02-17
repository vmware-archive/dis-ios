import Nimble
import SwiftyJSON
import XCTest
@testable import dis_ios

class DisruptionTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testValidJSON() {
        
        let disruption = Disruption(json: JSON([
            "line": "District",
            "foregroundColor": "#000000",
            "backgroundColor": "#FFFFFF",
            "status": "Minor Delays",
            "startTime": "12:25",
            "endTime": "12:55",
            "startTimestamp": 1458217500000,
            "endTimestamp": 1458219300000
        ]))
        
        expect(disruption?.status).to(equal("Minor Delays"))
        expect(disruption?.startTime).to(equal(NSDate(timeIntervalSince1970: 1458217500000 / 1000)))
        expect(disruption?.endTime).to(equal(NSDate(timeIntervalSince1970: 1458219300000 / 1000)))
        expect(disruption?.line).toNot(beNil())

    }

    func testMissingLineInvalidJSON() {
        let disruptionWithNilLine = Disruption(json: JSON([
            "line": nil,
            "status": "Minor Delays",
            ]))
        
        expect(disruptionWithNilLine).to(beNil())
        
        let disruptionWithoutLineKey = Disruption(json: JSON([
            "status": "Minor Delays"
            ]))
        
        expect(disruptionWithoutLineKey).to(beNil())
    }

    func testMissingOptionalValues() {
        let disruption = Disruption(json: JSON([
            "line": "District",
            "foregroundColor": "#000000",
            "backgroundColor": "#FFFFFF",
            "status": nil,
            "startTime": nil,
            "endTime": nil,
            "startTimestamp": nil,
            "endTimestamp": nil
        ]))
        
        expect(disruption?.line.name).to(equal("District"))
        expect(disruption?.status).to(beNil())
        expect(disruption?.startTime).to(beNil())
        expect(disruption?.endTime).to(beNil())

    }
    
}
