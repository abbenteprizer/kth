import java.net.*;
import java.io.*;

public class HTTPEcho {
    public static void main( String[] args) throws IOException {
        
        int port = Integer.parseInt(args[0]); // Stores port from first arg
        String message;
        ServerSocket server_socket = new ServerSocket(port);
        
        while(true){
            try( Socket connection_socket = server_socket.accept()){
//            connection_socket.setSoTimeout(1000);
            // Create input stream
            BufferedReader in_from_client = 
                    new BufferedReader(new
                    InputStreamReader(connection_socket.getInputStream()));
            
            // Create output stream
            DataOutputStream out_to_client = 
                    new DataOutputStream(connection_socket.getOutputStream());
            
            StringBuilder sb = new StringBuilder();
            sb.append("HTTP/1.1 200 OK\r\n\r\n");
            String input = "."; // Used to not equal first while condition
            
            while(!input.equals("")){
                input = in_from_client.readLine();
                sb.append( input + "\r\n");
            }
            
            String returned_message = sb.toString();
            out_to_client.writeBytes(returned_message);
            connection_socket.close();
            }catch( IOException e ){ 
                System.out.println("Exception " + e);
            }
            
                    
        }
    }
}

