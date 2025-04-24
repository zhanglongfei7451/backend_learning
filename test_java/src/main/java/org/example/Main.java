package org.example;

import org.jasypt.encryption.pbe.PooledPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.SimpleStringPBEConfig;

public class Main {

        public static void main(String[] args) {
            PooledPBEStringEncryptor encryptor = new PooledPBEStringEncryptor();
            SimpleStringPBEConfig config = new SimpleStringPBEConfig();
            config.setPassword("password");
            config.setAlgorithm("PBEWithMD5AndDES");
            config.setKeyObtentionIterations("1000");
            config.setPoolSize("1");
            config.setProviderName("SunJCE");
            config.setSaltGeneratorClassName("org.jasypt.salt.RandomSaltGenerator");
            config.setIvGeneratorClassName("org.jasypt.iv.NoIvGenerator");
            config.setStringOutputType("base64");
            encryptor.setConfig(config);

            String s = encryptor.encrypt("dVg!1B2lo");
            System.out.println("encryped: " + s);

            String s1 = encryptor.decrypt("uRz16bhztK0qMoOam/Mva7C43YbPYfHw");
            System.out.println("decryped: " + s1);
        }
}