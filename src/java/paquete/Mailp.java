/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package paquete;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.swing.JOptionPane;

/**
 *
 * @author Andres
 */
public class Mailp {
    
    public void enviarMail(String mensaje, String email, String asunto) {
        try {
            //Cosas necesarias para la configuracion del correo XD
            Properties p = new Properties();
            p.put("mail.smtp.host", "smtp.gmail.com");
            p.setProperty("mail.smtp.starttls.enable", "true");
            p.setProperty("mail.smtp.port", "587");
            p.setProperty("mail.smtp.port.user", "news.of.pat@gmail.com");
            p.setProperty("mail.smtp.auth", "true");

            Session s = Session.getDefaultInstance(p, null);
            BodyPart contenido = new MimeBodyPart();
            
            //Este es el contenido del correo
            contenido.setText(mensaje);
            
            //Aqui se adjunta lo que queremos mandar, ese pdf esta dentro de la carpeta, solo cambia la ruta
            //BodyPart adjunto = new MimeBodyPart();
            //adjunto.setDataHandler(new DataHandler(new FileDataSource("ENTREGA DE PROYECTO.pdf")));//ruta del archivo, en este caso esta en la raiz del proyecto
            //adjunto.setFileName("Adjunto.pdf");//Nombre del archivo adjunto
            
            //Armamos el correo
            MimeMultipart mmp = new MimeMultipart();
            mmp.addBodyPart(contenido);
            //mmp.addBodyPart(adjunto);

            MimeMessage message = new MimeMessage(s);
            //Direccion de correo del emisor
            message.setFrom(new InternetAddress("news.of.pat@gmail.com"));
            //Direccion de correo del receptor (se saca del form)
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
            //Asunto
            message.setSubject(asunto);
            //Demas contenido previamente armado
            message.setContent(mmp);
            
            
            Transport t = s.getTransport("smtp");
            //La direccion y contraseña del correo desde el cual se va a enviar
            t.connect("news.of.pat@gmail.com", "patpatpat");
            //Se envia el correo
            System.out.println("Enviando correo...");
            t.sendMessage(message, message.getAllRecipients());
            t.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
