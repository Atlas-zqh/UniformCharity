package nju.utils;

import nju.domain.*;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * Created by keenan on 22/05/2017.
 */
@Intercepts({
        @Signature(type = Executor.class, method = "update", args = {MappedStatement.class, Object.class}),
        @Signature(type = Executor.class, method = "query", args = {MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class})
})
public class DBInterceptor implements Interceptor {
    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        String key = "20170522";
        String methodName = invocation.getMethod().getName();
        Object parameter = invocation.getArgs()[1];
        if (parameter instanceof User) {
            User user = (User) parameter;
            if (methodName.equals("update")) {
                user.setUsername(EncryptionUtil.encrypt(key, user.getUsername()));
                user.setPassword(EncryptionUtil.encrypt(key, user.getPassword()));
                user.setWechatID(EncryptionUtil.encrypt(key, user.getWechatID()));
                user.setPhone(EncryptionUtil.encrypt(key, user.getPhone()));
                user.setRealName(EncryptionUtil.encrypt(key, user.getRealName()));
                user.setEmail(EncryptionUtil.encrypt(key, user.getEmail()));
                user.setPersonID(EncryptionUtil.encrypt(key, user.getPersonID()));
            }
        } else if (parameter instanceof Order) {
            Order order = (Order) parameter;
            if (methodName.equals("update")) {
                order.setBuyerID(EncryptionUtil.encrypt(key, order.getBuyerID()));
                order.setDonorID(EncryptionUtil.encrypt(key, order.getDonorID()));
            }
        } else if (parameter instanceof Clothes) {
            Clothes clothes = (Clothes) parameter;
            if (methodName.equals("update")) {
                clothes.setDonorID(EncryptionUtil.encrypt(key, clothes.getDonorID()));
            }
        } else if (parameter instanceof Post) {
            Post post = (Post) parameter;
            if (methodName.contains("update")) {
                post.setPost_uid(EncryptionUtil.encrypt(key, post.getPost_uid()));
            }
        } else if (parameter instanceof Reply) {
            Reply reply = (Reply) parameter;
            if (methodName.equals("update")) {
                reply.setReply_uid(EncryptionUtil.encrypt(key, reply.getReply_uid()));
            }
        }

        Object returnValue = invocation.proceed();
        System.out.println("=====");
        if (returnValue instanceof ArrayList<?>) {
            System.out.println("!!!!!!!");
            List<?> list = (ArrayList<?>) returnValue;
            for (Object val : list) {
                if (val instanceof User) {
                    User user = (User) val;
                    user.setUsername(EncryptionUtil.decrypt(key, user.getUsername()));
                    user.setPassword(EncryptionUtil.decrypt(key, user.getPassword()));
                    user.setWechatID(EncryptionUtil.decrypt(key, user.getWechatID()));
                    user.setPhone(EncryptionUtil.decrypt(key, user.getPhone()));
                    user.setRealName(EncryptionUtil.decrypt(key, user.getRealName()));
                    user.setEmail(EncryptionUtil.decrypt(key, user.getEmail()));
                    user.setPersonID(EncryptionUtil.decrypt(key, user.getPersonID()));
                } else if (val instanceof Order) {
                    Order order = (Order) val;
                    order.setBuyerID(EncryptionUtil.decrypt(key, order.getBuyerID()));
                    order.setDonorID(EncryptionUtil.decrypt(key, order.getDonorID()));
                } else if (val instanceof Clothes) {
                    Clothes clothes = (Clothes) val;
                    clothes.setDonorID(EncryptionUtil.decrypt(key, clothes.getDonorID()));
                } else if (val instanceof Post) {
                    Post post = (Post) val;
                    post.setPost_uid(EncryptionUtil.decrypt(key, post.getPost_uid()));
                } else if (val instanceof Reply) {
                    Reply reply = (Reply) val;
                    reply.setReply_uid(EncryptionUtil.decrypt(key, reply.getReply_uid()));
                } else if (val instanceof CreditRecord) {
                    CreditRecord creditRecord = (CreditRecord) val;
                    ((CreditRecord) val).setUserid(EncryptionUtil.decrypt(key, creditRecord.getUserid()));
                }

            }
        } else if (returnValue instanceof User) {
            System.out.println("here");
            User user = (User) returnValue;
            user.setUsername(EncryptionUtil.decrypt(key, user.getUsername()));
            user.setPassword(EncryptionUtil.decrypt(key, user.getPassword()));
            user.setWechatID(EncryptionUtil.decrypt(key, user.getWechatID()));
            user.setPhone(EncryptionUtil.decrypt(key, user.getPhone()));
            user.setRealName(EncryptionUtil.decrypt(key, user.getRealName()));
            user.setEmail(EncryptionUtil.decrypt(key, user.getEmail()));
            user.setPersonID(EncryptionUtil.decrypt(key, user.getPersonID()));
        }
        return returnValue;
    }

    @Override
    public Object plugin(Object o) {
        return Plugin.wrap(o, this);
    }

    @Override
    public void setProperties(Properties properties) {
    }
}
