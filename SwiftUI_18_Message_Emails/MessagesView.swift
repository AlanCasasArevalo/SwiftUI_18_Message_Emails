
import SwiftUI
import MessageUI

struct MessagesView: View {
    
    @State private var phone = ""
    @State private var message = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Telefono", text: self.$phone)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.namePhonePad)
                TextField("Message", text: self.$message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    
                }) {
                    Text("Enviar el mensaje")
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundColor(.red)
                        .bold()
                }
            }
            .navigationBarTitle("Message")
            .padding()
        }
    }
}

extension MessagesView {
    
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
