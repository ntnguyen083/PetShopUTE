package murach;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class sendMail {
    public static void sendMail(String recieverMail) {

        // Recipient's email ID needs to be mentioned.
        String to = recieverMail;

        // Sender's email ID needs to be mentioned
        String from = "nguyennguyen6616634@gmail.com";

        // Assuming you are sending email from through gmails smtp
        String host = "smtp.gmail.com";


        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        System.getenv("EMAIL");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                //setup app password reference https://support.google.com/accounts/answer/185833?hl=en
                return new PasswordAuthentication(from, "bqefqdxtiutvaklw");

            }

        });

        // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("[Pet Shop] Hóa đơn mua hàng tại Pet Shop");

            // Now set the actual message
            message.setText("Vietnam opening!");

            // Send message
            Transport.send(message);
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }

    }

    public static void main(String []args)
    {
        sendMail("20110388@student.hcmute.edu.vn");
    }
}
