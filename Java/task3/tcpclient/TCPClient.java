package tcpclient;

import java.net.*;
import java.io.*;

public class TCPClient {

    // Sends and receives information with server
    public static String askServer(String hostname, int port, String ToServer) throws IOException {

        // Sets up socket
        Socket clientSocket = new Socket(hostname, port);
        int timeout_delay = 2000; // Socket timeout in ms
        int max_message_length = 4000; // Max length of message
        clientSocket.setSoTimeout(timeout_delay); // Initialize the socket timeout, in case of no response from server
        DataOutputStream outToServer = new DataOutputStream(clientSocket.getOutputStream()); // Sets up outputStream to server
        outToServer.writeBytes(ToServer + '\n'); // Sends the string ToServer to the server

        StringBuilder sb = new StringBuilder();

        try {
            // Takes the output from the server
            BufferedReader inFromServer = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));

            // Turns message from server in to the stringbuilder
            String messageFromServer; // Stores the received message
            while ((messageFromServer = inFromServer.readLine()) != null) {
                sb.append(messageFromServer);
                sb.append('\n');
                if (sb.length() > max_message_length) { // This is max length of message
                    break;
                }
            } 
        } catch (SocketTimeoutException s) {
            sb.append("*****Socket timeout!******\n");
        }
        clientSocket.close();
        // Returns message as string
        String message = sb.toString();
        return message;
    }
    public static String askServer(String hostname, int port) throws IOException {
        return askServer(hostname, port, "");
    }
}
