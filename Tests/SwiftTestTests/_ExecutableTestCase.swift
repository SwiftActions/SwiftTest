import XCTest
@testable import SwiftTest

class ExecutableTestCase: XCTestCase {
    
    var processName: String { "SwiftTest" }
    
    let outputPipe: Pipe = Pipe()
    let errorPipe: Pipe = Pipe()
    
    /// Returns path to the built products directory.
    private var productsDirectory: URL {
        #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
        #else
        return Bundle.main.bundleURL
        #endif
    }
    
    lazy var process: Process = {
        let process = Process()
        process.executableURL = productsDirectory.appendingPathComponent(processName)
        process.standardOutput = outputPipe
        process.standardError = errorPipe
        return process
    }()
    
    var output: String? {
        let data = outputPipe.fileHandleForReading.readDataToEndOfFile()
        return String(data: data, encoding: .utf8)
    }
    
    var error: String? {
        let data = errorPipe.fileHandleForReading.readDataToEndOfFile()
        return String(data: data, encoding: .utf8)
    }
}
