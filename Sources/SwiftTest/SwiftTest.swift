import ArgumentParser
import ShellOut

@main
struct SwiftBuild: ParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "SwiftTest"
        )
    }
    
    @Option var verbose: Bool = false
    @Option var githubWorkspace: String
    
    func run() throws {
        var arguments: [String] = []
        
        if verbose {
            arguments.append("--verbose")
        }
        
        let shellout = try shellOut(to: "swift test", arguments: arguments, at: githubWorkspace)
        print(shellout)
    }
}
