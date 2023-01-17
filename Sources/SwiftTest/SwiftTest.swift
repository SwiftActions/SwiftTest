import ArgumentParser
import ShellOut

@main
struct SwiftTest: ParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "SwiftTest",
            abstract: "Proxy to the `swift test` command, executing in a specific directory."
        )
    }
    
    @Option(help: "Increase verbosity to include informational output.") var verbose: Bool = false
    @Option(help: "Path at which the command will be executed.") var workingDirectory: String
    
    func run() throws {
        var arguments: [String] = []
        
        if verbose {
            arguments.append("--verbose")
        }
        
        let output = try shellOut(to: "swift test", arguments: arguments, at: workingDirectory)
        print(output)
    }
}
