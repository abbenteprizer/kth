
import java.net.*;
import java.io.*;
import java.util.regex.PatternSyntaxException;
import tcpclient.TCPClient;

public class MyRunnable implements Runnable {

    private Socket connection_socket;
    private int port;
    private String hostname;
    private String toServer;
        
     
    public MyRunnable(Socket connection_socket) {
        this.connection_socket = connection_socket;
    }

    @Override
    public void run() {
        try {
            // Create input stream
            BufferedReader in_from_browser
                    = new BufferedReader(new InputStreamReader(connection_socket.getInputStream()));

            // Create output stream
            DataOutputStream out_to_browser
                    = new DataOutputStream(connection_socket.getOutputStream());

            // Receive GET message
            StringBuilder sb = new StringBuilder();
            String input = ".";

            // Will receive something that looks like this in while loop
            // GET /ask?hostname=time.nist.gov&port=13 HTTP/1.1
            // Host: hostname.domain
            while (!input.equals("")) {
                input = in_from_browser.readLine();
                sb.append(input + "\r\n");
            }

            try {
                // String manipulation to extract arguments hostname, port and toServer
                String urlString = sb.toString();
                System.out.println(urlString);

                String[] splitString = urlString.split("hostname=");
                String[] splithostname = splitString[1].split("&");
                hostname = splithostname[0];

                String[] splitPort = urlString.split("port=");
                if (urlString.length() - urlString.replace("&", "").length() > 1) { // Checks number of "&"
                    String[] splitHTTP = splitPort[1].split("&");
                    port = Integer.parseInt(splitHTTP[0]);
                } else {
                    String[] splitHTTP = splitPort[1].split(" ");
                    port = Integer.parseInt(splitHTTP[0]);
                }

                if (urlString.length() - urlString.replace("&", "").length() > 1) {
                    String[] splitAmp = urlString.split("&");
                    String[] splitSpace = splitAmp[2].split(" ");
                    toServer = splitSpace[0];
                } else {
                    toServer = "";
                }
                
                try {
                    String serverOutput = TCPClient.askServer(hostname, port, toServer);// toServer last arg
                    System.out.printf("%s:%d says:\n%s", hostname, port, serverOutput);
                    out_to_browser.writeBytes("HTTP/1.1 200 OK\r\n\r\n" + serverOutput); // No first part?
                } catch (IOException ex) {
                    System.err.println(ex);
                }

                // For debugging    
//                                sb.append(hostname + "\r\n" + port + "\r\n" + toServer);
//                                String returned_message = sb.toString();
//                                out_to_browser.writeBytes(returned_message);
            } catch (PatternSyntaxException p) {
                out_to_browser.writeBytes("400");
            } catch (ArrayIndexOutOfBoundsException e) {
                out_to_browser.writeBytes("404");
            }
            
            connection_socket.close();
        } catch (IOException e) {
            System.out.println("Error " + e);
        }
    }
}
