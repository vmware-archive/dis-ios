import SwiftyJSON

public struct Disruption {
    
    let line: Line
    let status: String?
    let startTime: NSDate?
    let earliestEndTime: NSDate?
    let latestEndTime: NSDate?
    
    init?(json: JSON) {
        let lineJSON = JSON([
            "name": json["line"].stringValue,
            "backgroundColor": json["backgroundColor"].stringValue,
            "foregroundColor": json["foregroundColor"].stringValue
        ])
        
        guard let line = Line(json: lineJSON) else {
            return nil
        }
        
        self.line = line
        self.status = json["status"].string
        self.startTime = JSON.getDateForTimestamp(json["startTimestamp"])
        self.earliestEndTime = JSON.getDateForTimestamp(json["earliestEndTimestamp"])
        self.latestEndTime = JSON.getDateForTimestamp(json["latestEndTimestamp"])
    }

}
