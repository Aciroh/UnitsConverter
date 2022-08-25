import SwiftUI

//Must have 4 views
//One for each of the following:
//Temperature, Length, Time, Volume
struct ContentView: View {
    
    func temperatureConversion(input: Double, inType: String, outType: String) -> Double{
        if outType == "Celsius" {
            if inType == "Celsius" {
                return input
            } else if inType == "Kelvin" {
                return (input - 272.15)
            } else {
                return ((input - 32) * 0.5556)
            }
        } else if outType == "Fahrenheit" {
            if inType == "Celsius" {
                return ((input * 1.8) + 32)
            } else if inType == "Kelvin" {
                return ((((input - 273.15) * 9) / 5 ) + 32)
            } else {
                return input
            }
        } else {
            if inType == "Celsius" {
                return input + 273.15
            } else if inType == "Kelvin" {
                return input
            } else {
                return ((input + 459.67) * (5/9))
            }
        }
    }
    func lengthConversion(input: Double, inType: String, outType: String) -> Double {
        if outType == "meters" {
            if inType == "meters" {
                return input
            } else if inType == "kilometers" {
                return (input * 1000)
            } else if inType == "feet" {
                return (input * 0.3048)
            } else if inType == "yards" {
                return (input * 0.9144)
            } else {
                return (input * 1609.344)
            }
        } else if outType == "kilometers" {
            if inType == "meters" {
                return (input / 1000)
            } else if inType == "kilometers" {
                return input
            } else if inType == "feet" {
                return ((input * 0.3048) / 1000)
            } else if inType == "yards" {
                return ((input * 0.9144) / 1000)
            } else {
                return (input * 1.609344)
            }
        } else if outType == "feet" {
            if inType == "meters" {
                return (input * 3.2808399)
            } else if inType == "kilometers" {
                return ((input * 3280.8399))
            } else if inType == "feet" {
                return input
            } else if inType == "yards" {
                return (input * 3)
            } else {
                return (input * 5280)
            }
            
        } else if outType == "yards" {
            if inType == "meters" {
                return (input * 1.0936133)
            } else if inType == "kilometers" {
                return ((input * 1093.6133))
            } else if inType == "feet" {
                return (input / 3)
            } else if inType == "yards" {
                return input
            } else {
                return (input * 1760)
            }
        } else {
            if inType == "meters" {
                return (input * 0.000621371192)
            } else if inType == "kilometers" {
                return ((input * 0.621371192))
            } else if inType == "feet" {
                return (input * 0.000189393939)
            } else if inType == "yards" {
                return (input * 0.000568181818)
            } else {
                return input
            }
        }
        
    }
    
    let conversionType = ["Temperature", "Length", "Time", "Volume"]
    @State var currentType = "Temperature"
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    let lengthUnits = ["meters", "kilometers", "feet", "yards", "miles"]
    let timeUnits = ["seconds", "minutes", "hours", "days"]
    let volumeUnits = ["mililiters", "liters", "cups", "pints", "gallons"]
    @State var currentInputType = "Celsius"
    @State var currentOutputType = "Celsius"
    @State var input = 0.0
    var output: Double {
        if currentType == "Temperature" {
            return temperatureConversion(input: input, inType: currentInputType, outType: currentOutputType)
        } else if currentType == "Length" {
            return lengthConversion(input: input, inType: currentInputType, outType: currentOutputType)
        }
        return 0.0
    }
    let format = FloatingPointFormatStyle<Double>.number
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Conversion Type", selection: $currentType) {
                        ForEach(conversionType, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Select conversion type:")
                }
                Section {
                    Picker("Input Type", selection: $currentInputType) {
                        switch currentType {
                        case "Temperature":
                            ForEach(temperatureUnits, id:\.self) {
                                Text($0)
                            
                        }
                        case "Length":
                            ForEach(lengthUnits, id:\.self) {
                                Text($0)
                            
                        }
                        case "Time":
                            ForEach(timeUnits, id:\.self) {
                                Text($0)
                            
                        }
                        case "Volume":
                            ForEach(volumeUnits, id:\.self) {
                                Text($0)
                            
                        }
                        default:
                            Text("None")
                        }
                    }
                    TextField("Input", value: $input, format: format)
                } header: {
                    Text("Input type:")
                }
                Section {
                    Picker("Output Type", selection: $currentOutputType) {
                        switch currentType {
                        case "Temperature":
                            ForEach(temperatureUnits, id:\.self) {
                                Text($0)
                            
                        }
                        case "Length":
                            ForEach(lengthUnits, id:\.self) {
                                Text($0)
                            
                        }
                        case "Time":
                            ForEach(timeUnits, id:\.self) {
                                Text($0)
                            
                        }
                        case "Volume":
                            ForEach(volumeUnits, id:\.self) {
                                Text($0)
                            
                        }
                        default:
                            Text("None")
                        }
                    }
                    Text(output, format: format)
                } header: {
                    Text("Output type:")
                }
            }
            .navigationTitle("UnitsConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
