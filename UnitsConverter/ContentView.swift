import SwiftUI

//Must have 4 views
//One for each of the following:
//Temperature, Length, Time, Volume
struct ContentView: View {
    
    let conversionType = ["Temperature", "Length", "Time", "Volume"]
    @State var currentType = "Temperature"
    
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
