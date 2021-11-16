public protocol Logger {
    
    /// Logs the given message (using StaticString parameters).
    ///
    /// - Parameters:
    ///   - message: The message to be logger.
    ///              Provided as a closure to avoid performing interpolation if
    ///              the message is not going to be logged.
    ///   - level: The severity of the message.
    ///            A logger can use this flag to decide if to log or ignore
    ///            this specific message.
    ///   - file: The file name of the file where the message was created.
    ///   - function: The function name where the message was created.
    ///   - line: The line number in the file where the message was created.
    func log(_ message: @autoclosure () -> String,
             level: LogLevel,
             file: String,
             function: String,
             line: UInt)
    
    /// Set new log level.
    /// - Parameter logLevel: New log level to be applied.
    func setLogLevel(_ logLevel: LogLevel)
    
    /// Get current log level.
    /// - Returns: Currently set log level.
    func getLogLevel() -> LogLevel
}

public extension Logger {
    
    func v(_ message: @autoclosure () -> String,
                  file: String = #fileID,
                  function: String = #function,
                  line: UInt = #line) {
        log(message(), level: .verbose, file: file, function: function, line: line)
    }
    
    func d(_ message: @autoclosure () -> String,
                  file: String = #fileID,
                  function: String = #function,
                  line: UInt = #line) {
        log(message(), level: .debug, file: file, function: function, line: line)
    }
    
    func i(_ message: @autoclosure () -> String,
                  file: String = #fileID,
                  function: String = #function,
                  line: UInt = #line) {
        log(message(), level: .info, file: file, function: function, line: line)
    }
    
    func w(_ message: @autoclosure () -> String,
                  file: String = #fileID,
                  function: String = #function,
                  line: UInt = #line) {
        log(message(), level: .warning, file: file, function: function, line: line)
    }
    
    func e(_ message: @autoclosure () -> String,
                  file: String = #fileID,
                  function: String = #function,
                  line: UInt = #line) {
        log(message(), level: .error, file: file, function: function, line: line)
    }
}
