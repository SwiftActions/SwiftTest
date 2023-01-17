import XCTest
@testable import SwiftTest

final class SwiftTestTests: ExecutableTestCase {
    
    func testDefaultExecution() throws {
        try process.run()
        process.waitUntilExit()
        
        XCTAssertEqual(error, """
        Error: Missing expected argument '--working-directory <working-directory>'
        
        OVERVIEW: Proxy to the `swift test` command, executing in a specific directory.
        
        USAGE: SwiftTest [--verbose <verbose>] --working-directory <working-directory>
        
        OPTIONS:
          --verbose <verbose>     Increase verbosity to include informational output.
                                  (default: false)
          --working-directory <working-directory>
                                  Path at which the command will be executed.
          -h, --help              Show help information.
        
        
        """)
    }
    
    func testHelpExecution() throws {
        process.arguments = ["--help"]
        try process.run()
        process.waitUntilExit()
        
        XCTAssertEqual(output, """
        OVERVIEW: Proxy to the `swift test` command, executing in a specific directory.
        
        USAGE: SwiftTest [--verbose <verbose>] --working-directory <working-directory>
        
        OPTIONS:
          --verbose <verbose>     Increase verbosity to include informational output.
                                  (default: false)
          --working-directory <working-directory>
                                  Path at which the command will be executed.
          -h, --help              Show help information.
        
        
        """)
    }
}
