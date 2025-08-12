package com.sapsecopssolutions.utils;

import org.junit.jupiter.api.Test;

import java.sql.Connection;

import static org.junit.jupiter.api.Assertions.*;

public class DBUtilTest {

    @Test
    public void testGetConnection() {
        try (Connection conn = DBUtil.getConnection()) {
            assertNotNull(conn, "Connection should not be null");
            assertFalse(conn.isClosed(), "Connection should be open");
        } catch (Exception e) {
            fail("Exception occurred while getting DB connection: " + e.getMessage());
        }
    }
}
