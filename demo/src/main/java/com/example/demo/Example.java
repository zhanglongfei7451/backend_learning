package com.example.demo;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;


public class Example {
        private SimpleDateFormat sdf = new SimpleDateFormat(TIME_STAMP_FORMAT);
        public static final String ACCESS_KEY = "AccessKey";
        public static final String TIME_STAMP = "Timestamp";
        public static final String SIGNATURE = "Signature";
        public static final String SIGNATURE_METHOD = "SignatureMethod";
        public static final String SIGNATURE_VERSION = "SignatureVersion";
        public static final String SIGNATURE_NONCE = "SignatureNonce";
        public static final String SIGNATURE_VERSION_VALUE = "V2.0";
        public static final String SIGNATURE_METHOD_VALUE = "HmacSHA1";
        public static final String TIME_STAMP_FORMAT = "yyyy-MM-dd'T'HH:mm:ss'Z'";
        public static final String URL_ENCODER_FORMAT = "%s=%s";
        public static final String ENCODING = "utf-8";
        public static final String STRING_SEPARATOR = "\n";
        public static final String PARAMETER_SEPARATOR = "&";
        public static final String SIGNING_STRING = "BC_SIGNATURE&";
        public String accessKey;
        public String secretKey;

        public String doSignature(String servletPath, String method, Map<String, Object> query) {
            try {
                servletPath = java.net.URLDecoder.decode(servletPath, ENCODING);
                query.put(ACCESS_KEY, accessKey);
                query.put(TIME_STAMP, sdf.format(new Date()));
                query.put(SIGNATURE_NONCE, UUID.randomUUID().toString().replace("-",""));
                query.put(SIGNATURE_VERSION, SIGNATURE_VERSION_VALUE);
                query.put(SIGNATURE_METHOD, SIGNATURE_METHOD_VALUE);
                ArrayList<String> parameterList = new ArrayList<>(query.keySet());
                Collections.sort(parameterList);
                List<String> list = new ArrayList<>(query.size());
                for (String name : parameterList) {
                    if (!SIGNATURE.equalsIgnoreCase(name)) {
                        String value;
                        if (query.get(name) instanceof Boolean) {
                            value = Boolean.getBoolean(name) ? "true" : "false";
                        } else {
                            value = query.get(name).toString();
                        }
                        list.add(String.format(URL_ENCODER_FORMAT, percentEncode(name), percentEncode(value)));
                    }
                }
                String canonicalizedQueryString = String.join(PARAMETER_SEPARATOR, list);
                String encryptedCanonicalizedQueryStr = encode(canonicalizedQueryString);
                StringBuilder sb = new StringBuilder();
                sb.append(method.toUpperCase());
                sb.append(STRING_SEPARATOR);
                sb.append(percentEncode(servletPath));
                sb.append(STRING_SEPARATOR);
                sb.append(encryptedCanonicalizedQueryStr);
                String signature = sign(SIGNING_STRING + secretKey, sb.toString());
                if (Objects.isNull(signature) || signature.length() == 0) {
                    return null;
                }
                return servletPath + "?" + canonicalizedQueryString + PARAMETER_SEPARATOR + String.format(URL_ENCODER_FORMAT, SIGNATURE, percentEncode(signature));
            } catch (Exception e) {
                return null;
            }
        }

        public static String percentEncode(String value) throws UnsupportedEncodingException {
            return value != null ? URLEncoder.encode(value, ENCODING).replace("+", "%20").replace("*", "%2A").replace("%7E", "~") : null;
        }

        public static String sign(String secretKey, String data) {
            try {
                Mac mac = Mac.getInstance(SIGNATURE_METHOD_VALUE);
                byte[] secretKeyByte = secretKey.getBytes(ENCODING);
                SecretKeySpec secretKeySpec = new SecretKeySpec(secretKeyByte, SIGNATURE_METHOD_VALUE);
                mac.init(secretKeySpec);
                return new String(encodeHex(mac.doFinal(data.getBytes(ENCODING))));
            } catch (NoSuchAlgorithmException | InvalidKeyException | UnsupportedEncodingException e) {
                return null;
            }
        }

        public static String encode(String data) throws UnsupportedEncodingException, NoSuchAlgorithmException {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(data.getBytes(ENCODING));
            return new String(encodeHex(hash));
        }

        protected static char[] encodeHex(final byte[] data) {
            char[] toDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
            final int l = data.length;
            final char[] out = new char[l << 1];
            // two characters form the hex value.

            for (int i = 0, j = 0; i < l; i++) {
                out[j++] = toDigits[(0xF0 & data[i]) >>> 4];
                out[j++] = toDigits[0x0F & data[i]];
            }
            return out;
        }

        public static String doGet(String httpurl) {
            HttpURLConnection connection = null;
            InputStream is = null;
            BufferedReader br = null;
            String result = null;
            try {
                URL url = new URL(httpurl);
                connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("GET");
                connection.setConnectTimeout(15000);
                connection.setReadTimeout(60000);
                connection.connect();
                if (connection.getResponseCode() == 200) {
                    is = connection.getInputStream();
                    br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
                    StringBuffer sbf = new StringBuffer();
                    Scanner scanner = new Scanner(br);
                    while (scanner.hasNextLine()) {
                        sbf.append(scanner.nextLine());
                        sbf.append("\r\n");
                    }
                    result = sbf.toString();
                }
            } catch (Exception e) {
                System.out.println(e);
            } finally {
                if (null != br) {
                    try {
                        br.close();
                        is.close();
                    } catch (IOException e) {
                        System.out.println(e);
                    }
                }
                connection.disconnect();
            }
            return result;
        }

    }
