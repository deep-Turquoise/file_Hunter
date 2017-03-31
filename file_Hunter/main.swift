//  main.swift

import Foundation

func start_Hunting(location: String, params: [String]) {
    let starting_Point = "/Volumes/" + location + "/"
    
    for iter in FileManager.default.enumerator(atPath: starting_Point)! {
        for param in params {
            if (iter as! String).lowercased().contains(param.lowercased()) == true {
                print(starting_Point + (iter as! String))
            }
        }
    }
}

func input_Parameters(inputs: inout [String]) {
    var user_Input = gather_Input(prompt: "Please enter a search parameter(enter \"stop\" once compelte): ")
    if user_Input == "stop" { return }
    else {
        inputs.append(user_Input)
        input_Parameters(inputs: &inputs)
    }
}

func gather_Input(prompt: String) -> String {
    print(prompt)
    let location:String = readLine()!
    return location
}

func main() {
    print("File Hunter 1.0\n\n")
    
    let location = gather_Input(prompt: "Please enter a file head: ")
    var strings_To_Search_For = [String]()
    input_Parameters(inputs: &strings_To_Search_For)
    
    print("\n\n\nBeginning Search!\n\n\n")
    start_Hunting(location: location, params: strings_To_Search_For)
    
    print("\n\nShutting Down")
}

main()

