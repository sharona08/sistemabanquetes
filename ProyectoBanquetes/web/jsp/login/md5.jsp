<%-- 
    Document   : md5
    Created on : Sep 17, 2010, 9:43:34 AM
    Author     : maya
--%>


<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.security.MessageDigest"%>
<html>
    <body>

        <%!
            public String stringToMD5(String password) {
                String md5Password = "";
                try {
                    // Create a new instance of MessageDigest, using MD5. SHA and other
                    // digest algorithms are also available.
                    MessageDigest alg = MessageDigest.getInstance("MD5");

                    // Reset the digest, in case it's been used already during this section of code
                    // This probably isn't needed for pages of 210 simplicity
                    alg.reset();

                    // Calculate the md5 hash for the password. md5 operates on bytes, so give
                    // MessageDigest the byte verison of the string
                    alg.update(password.getBytes());

                    // Create a byte array from the string digest
                    byte[] digest = alg.digest();

                    // Convert the hash from whatever format it's in, to hex format
                    // which is the normal way to display and report md5 sums
                    // This is done byte by byte, and put into a StringBuffer
                    StringBuffer hashedpasswd = new StringBuffer();
                    String hx;
                    for (int i = 0; i < digest.length; i++) {
                        hx = Integer.toHexString(0xFF & digest[i]);
                        //0x03 is equal to 0x3, but we need 0x03 for our md5sum
                        if (hx.length() == 1) {
                            hx = "0" + hx;
                        }
                        hashedpasswd.append(hx);
                    }

                    // Print out the string hex version of the md5 hash
                    md5Password = hashedpasswd.toString();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                return md5Password;
            }
        %>

        <%= stringToMD5("12345")%>
        
    </body>
</html>