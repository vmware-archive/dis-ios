import SwiftyJSON

public struct Disruption {
    
    let line: Line
    let status: String?
    let startTime: NSDate?
    let endTime: NSDate?
    
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
        self.endTime = JSON.getDateForTimestamp(json["endTimestamp"])
    }

}
