import Foundation

public final class SimpleLogger: Logger {
    private var currentLogLevel: LogLevel = .none
    
    public init() {}
    
    /// Set new log level.
    /// - Parameter logLevel: New log level to be applied.
    public func setLogLevel(_ logLevel: LogLevel) {
        self.currentLogLevel = logLevel
    }

    /// Get current log level.
    /// - Returns: Currently set log level.
    public func getLogLevel() -> LogLevel {
        return currentLogLevel
    }
    
    public func log(_ message: @autoclosure () -> String, level: LogLevel, file: String, function: String, line: UInt) {
        if currentLogLevel <= level {
            print("\(tag(level)) \(file):\(line) \(message())")
        }
    }
    
    private func tag(_ level: LogLevel) -> String {
        let prefix: String
        switch level {
        case .none:
            prefix = "[⚪️|NONE]"
        case .verbose:
            prefix = "[🟢|VERB]"
        case .debug:
            prefix = "[🔵|DEBG]"
        case .info:
            prefix = "[🟡|INFO]"
        case .warning:
            prefix = "[🟠|WARN]"
        case .error:
            prefix = "[🔴|ERRO]"
        }
        let time = Date().timeIntervalSinceReferenceDate

        return prefix + String(
            format: "%02.0f:%02.0f:%02.0f.%03.f]:",
            floor(time / 3600.0).truncatingRemainder(dividingBy: 24),
            floor(time / 60.0).truncatingRemainder(dividingBy: 60),
            floor(time).truncatingRemainder(dividingBy: 60),
            floor(time * 1000).truncatingRemainder(dividingBy: 1000)
        )
    }
}
