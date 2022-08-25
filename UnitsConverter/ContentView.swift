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
    func timeConversion(input: Double, inType: String, outType: String) -> Double {
        //seconds, minutes, hours, days
        switch outType {
        case "seconds": do {
            switch inType {
            case "seconds":
                return input
            case "minutes":
                return input * 60
            case "hours":
                return input * 3600
            case "days":
                return input * 86400
            default:
                return 0.0
            }
        }
        case "minutes": do {
            switch inType {
            case "seconds":
                return input / 60
            case "minutes":
                return input
            case "hours":
                return input * 60
            case "days":
                return input * 1440
            default:
                return 0.0
            }
        }
        case "hours": do {
            switch inType {
            case "seconds":
                return input / 3600
            case "minutes":
                return input / 60
            case "hours":
                return input
            case "days":
                return input * 24
            default:
                return 0.0
            }
        }
        case "days": do {
            switch inType {
            case "seconds":
                return input / 86400
            case "minutes":
                return input / 1440
            case "hours":
                return input / 24
            case "days":
                return input
            default:
                return 0.0
            }
        }
        default:
            return 0.0
        }
    }
    func volumeConversion(input: Double, inType: String, outType: String) -> Double {
        //mililiters, liters, cups, pints, gallons
        switch outType {
        case "mililiters": do {
            switch inType{
            case "mililiters":
                return input
            case "liters":
                return input * 1000
            case "cups":
                return input * 236.6
            case "pints":
                return input * 473.176473
            case "gallons":
                return input * 3785.411784
            default:
                return 0.0
            }
            
        }
        case "liters": do {
            switch inType{
            case "mililiters":
                return input * 0.001
            case "liters":
                return input
            case "cups":
                return input * 0.2366
            case "pints":
                return input * 0.473176473
            case "gallons":
                return input * 3.785411784
            default:
                return 0.0
            }
        }
        case "cups": do {
            switch inType{
            case "mililiters":
                return input * 0.00422675284
            case "liters":
                return input * 4.22675284
            case "cups":
                return input
            case "pints":
                return input * 2
            case "gallons":
                return input * 16
            default:
                return 0.0
            }
        }
        case "pints": do {
            switch inType{
            case "mililiters":
                return input *  0.00211337642
            case "liters":
                return input * 2.11337642
            case "cups":
                return input * 0.5
            case "pints":
                return input
            case "gallons":
                return input * 8
            default:
                return 0.0
            }
        }
        case "gallons": do {
            switch inType{
            case "mililiters":
                return input * 0.000264172052
            case "liters":
                return input * 0.264172052
            case "cups":
                return input * 0.0625
            case "pints":
                return input * 0.125
            case "gallons":
                return input
            default:
                return 0.0
            }
        }
        default:
            return 0.0
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
            return temperatureConversion(input: input,
                                         inType: currentInputType,
                                         outType: currentOutputType)
        } else if currentType == "Length" {
            return lengthConversion(input: input,
                                    inType: currentInputType,
                                    outType: currentOutputType)
        } else if currentType == "Time" {
            return timeConversion(input: input,
                                  inType: currentInputType,
                                  outType: currentOutputType)
        } else {
            return volumeConversion(input: input,
                                    inType: currentInputType,
                                    outType: currentOutputType)
        }
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
                    .pickerStyle(.segmented)
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
                    .pickerStyle(.segmented)
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
