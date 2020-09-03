
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MessagesView().tabItem {
                Image(systemName: "message.fill")
            }
            EmailView().tabItem {
                Image(systemName: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
