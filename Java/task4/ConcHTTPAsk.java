
import java.net.*;
import java.io.*;
import java.util.regex.PatternSyntaxException;
//import tcpclient.TCPClient; //This needs to be uncommented

// This program sets up TCP connection with port-number from argument
// It takes "GET request's" from browser and forwards information to TCPClient
// It then takes the data from TCPClient and formats them in a "200 OK"- message
// and the sends information to the port. Server response shown on browser.
public class ConcHTTPAsk {
    
    public static void main(String[] args) throws IOException {
        // Initialization of HTTPAsk
        int port = Integer.parseInt(args[0]);
        ServerSocket server_socket = new ServerSocket(port);
        
       
        while (true) {
            // Sends connection_socket to a new thread
            try {
            Socket connection_socket = server_socket.accept(); // Pauses here if no request!
            Runnable r = new MyRunnable(connection_socket);
            new Thread(r).start();
            } catch (IOException e) {
                System.out.println("Exception " + e);
            }
            
        }
    }
}
