package com.sapsecopssolutions.utils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBUtil {
    private static String jdbcURL;
    private static String jdbcUsername;
    private static String jdbcPassword;
    private static String jdbcDb;

    static {
        try {
            Class.forName("org.postgresql.Driver");

            // Try environment variables first
            String envURL = System.getenv("POSTGRES_URL");
            String envUser = System.getenv("POSTGRES_USER");
            String envPass = System.getenv("POSTGRES_PASSWORD");
            String envDb = System.getenv("POSTGRES_DB");

            if (envURL != null && envUser != null && envPass != null) {
                jdbcURL = envURL;
                jdbcUsername = envUser;
                jdbcPassword = envPass;
                jdbcDb = envDb;
                System.out.println("DB config loaded from environment variables.");
            } else {
                // fallback to application.properties
                try (InputStream input = DBUtil.class.getClassLoader().getResourceAsStream("application.properties")) {
                    if (input == null) {
                        System.err.println("application.properties not found, and environment variables not set.");
                    } else {
                        Properties prop = new Properties();
                        prop.load(input);
                        jdbcURL = prop.getProperty("jdbc.url");
                        jdbcUsername = prop.getProperty("jdbc.username");
                        jdbcPassword = prop.getProperty("jdbc.password");
                        jdbcDb = prop.getProperty("jdbc.db");
                        System.out.println("DB config loaded from application.properties");
                    }
                }
            }

            if (jdbcURL != null && jdbcDb != null && !jdbcURL.endsWith(jdbcDb)) {
                if (!jdbcURL.endsWith("/")) {
                    jdbcURL += "/";
                }
                jdbcURL += jdbcDb;
            }

            if (jdbcURL == null || jdbcUsername == null || jdbcPassword == null) {
                System.err.println("DB credentials are missing!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws Exception {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }
}
