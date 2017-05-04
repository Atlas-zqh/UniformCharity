package test.utilTest;

import nju.utils.EncryptionUtil;
import org.junit.Assert;
import org.junit.Test;
import test.BaseTest;

/**
 * 加密解密工具的测试类
 * <p>
 * Created by keenan on 03/05/2017.
 */
public class TestEncryptionUtil extends BaseTest {
    @Test
    public void testEncryption() {
        String key = "20898765";
        String data = "19970723 Nanjing 南京";

        Assert.assertEquals(EncryptionUtil.encrypt(key, data), "9BA57A5057B38D54F82D4E747C3F84D9670BDF961F3A4775");
    }

    @Test
    public void testDecryption() {
        String key = "20898765";
        String encryptRes = "9BA57A5057B38D54F82D4E747C3F84D9670BDF961F3A4775";

        Assert.assertEquals(EncryptionUtil.decrypt(key, encryptRes), "19970723 Nanjing 南京");
    }

}
