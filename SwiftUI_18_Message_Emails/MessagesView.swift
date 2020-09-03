
import SwiftUI
import MessageUI

struct MessagesView: View {
    
    @State private var phone = ""
    @State private var message = ""
    
    private let messageComposeViewControllerDelegate = MessageDelegate()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Telefono", text: self.$phone)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.phonePad)
                TextField("Message", text: self.$message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    self.sendMessage()
                }) {
                    Text("Enviar el mensaje")
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundColor(.red)
                        .bold()
                }
                Spacer()
            }
            .navigationBarTitle("Message")
            .padding()
        }
    }
}

extension MessagesView {
    class MessageDelegate: NSObject, MFMessageComposeViewControllerDelegate {
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            controller.dismiss(animated: true)
        }
    }
    
    func sendMessage() {
        if MFMessageComposeViewController.canSendText() {
            let viewController = UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController
            let sms = MFMessageComposeViewController()
            sms.body = self.message
            sms.recipients = [self.phone]
            
            sms.messageComposeDelegate = messageComposeViewControllerDelegate
            viewController?.present(sms, animated: true)
        } else {
            print("No se puede enviar el mensaje")
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
