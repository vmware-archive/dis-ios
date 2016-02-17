import Foundation

extension NSDate {
    static func getFormattedTimeString(date: NSDate?) -> String? {
        if let d = date {
            return NSDateFormatter.localizedStringFromDate(d, dateStyle: .NoStyle, timeStyle: .ShortStyle)
        } else {
            return nil
        }
    }
}