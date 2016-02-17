import SwiftyJSON

extension JSON {
    static func getDateForTimestamp(timestamp: JSON) -> NSDate? {
        if let ts = timestamp.rawValue as? NSTimeInterval {
            return NSDate(timeIntervalSince1970: ts / 1000)
        } else {
            return nil
        }
    }

}