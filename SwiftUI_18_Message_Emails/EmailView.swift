
import SwiftUI
import MessageUI

struct EmailView: View {
    
    @State private var email = ""
    @State private var message = ""
    @State private var subject = ""
    
    private let mailComposeViewControllerDelegate = EmailDelegate()

    var body: some View {
        NavigationView {
            VStack {
                TextField("email", text: self.$email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                TextField("Asunto", text: self.$subject)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Message", text: self.$message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    self.sendEmail()
                }) {
                    Text("Enviar el email")
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundColor(.red)
                        .bold()
                }
                Spacer()
            }
            .navigationBarTitle("Email")
            .padding()
        }
    }
}


extension EmailView {
    class EmailDelegate: NSObject, MFMailComposeViewControllerDelegate {
        func messageComposeViewController(_ controller: MFMailComposeViewController, didFinishWith result: MessageComposeResult) {
            controller.dismiss(animated: true)
        }
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let viewController = UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController
            let email = MFMailComposeViewController()
            email.setSubject(self.subject)
            email.setToRecipients([self.email])
            email.setMessageBody(self.message, isHTML: false)
                        
            email.mailComposeDelegate = self.mailComposeViewControllerDelegate
            
            viewController?.present(email, animated: true)
        } else {
            print("No se puede enviar el mensaje")
        }
    }
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView()
    }
}
