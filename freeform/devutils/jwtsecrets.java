import java.util.Base64;
import java.security.SecureRandom;

public class jwtsecrets {
    public static void main(String[] args) {
        SecureRandom random = new SecureRandom();
        byte[] key = new byte[64]; // 512 bits
        random.nextBytes(key);
        String secret = Base64.getEncoder().encodeToString(key);
        System.out.println(secret);
    }
}
