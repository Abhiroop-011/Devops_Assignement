import java.io.OutputStream;
import java.net.InetSocketAddress;
import com.sun.net.httpserver.HttpServer;

public class HelloWorldServer {
    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);
        server.createContext("/", t -> {
            String response = "<h1>Hello World from Java</h1>";
            t.sendResponseHeaders(200, response.length());
            try (OutputStream os = t.getResponseBody()) { os.write(response.getBytes()); }
        });
        server.start();
    }
}