/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package efm;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import Decoder.BASE64Encoder;

public final class PasswordEncryptor {

    public static String encrypt(String aPassword) {

        String encoded = null;
        try {
            byte[] secret = generate(aPassword);
            BASE64Encoder encoder = new BASE64Encoder();
            encoded = encoder.encode(secret);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return encoded;

    }

    /**
     * @param password
     * @return
     */
    private static byte[] generate(String password)
            throws NoSuchAlgorithmException {
        MessageDigest d = null;
        d = MessageDigest.getInstance("SHA-1");
        d.reset();
        d.update(password.getBytes());
        return d.digest();
    }

}
