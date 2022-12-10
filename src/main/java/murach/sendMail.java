package murach;

import bean.OderBean;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Properties;

public class sendMail {
    public static void sendMail(String recieverMail, List<OderBean> listOder) {

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
            message.setText("Hóa đơn của mua hàng của quý khách tại cửa hàng Pet Shop:");
            message.setText("Số lượng x Tên sản phẩm");
            message.setText("_____________________________________________________________");
            for (OderBean oder: listOder) {
                message.setText(oder.getAmount() + " | " + oder.getNameProduct() );
            }
            message.setText("Cảm ơn quý khách đã ủng hộ cửa hàng của chúng ta. Hẹn gặp lại");

            // Send message
            Transport.send(message);
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }

    }

}
