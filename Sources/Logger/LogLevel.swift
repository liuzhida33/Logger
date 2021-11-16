/// Log levels for internal logging mechanism.
public enum LogLevel: UInt8, Comparable {
    
    /// Logging is disabled
    case none = 255
    /// All logs are monitored.
    case verbose = 0
    /// Only debug logs and of higher importance are logged.
    case debug = 1
    /// Only info logs and of higher importance are logged.
    case info = 2
    /// Only warning logs and of higher importance are logged.
    case warning = 3
    /// Only error logs and of higher importance are logged.
    case error = 4
    
    public static func < (lhs: LogLevel, rhs: LogLevel) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
