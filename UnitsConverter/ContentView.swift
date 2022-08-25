import SwiftUI

//Must have 4 views
//One for each of the following:
//Temperature, Length, Time, Volume
struct ContentView: View {
    
    let conversionType = ["Temperature", "Length", "Time", "Volume"]
    @State var currentType = "Temperature"
    
    var body: some View {
        Section{
            Picker("Conversion Type", selection: $currentType) {
                ForEach(
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
