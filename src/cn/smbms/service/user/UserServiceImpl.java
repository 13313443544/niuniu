package cn.smbms.service.user;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cn.smbms.dao.user.UserMapper;
import cn.smbms.pojo.User;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * service层捕获异常，进行事务处理
 * 事务处理：调用不同dao的多个方法，必须使用同一个connection（connection作为参数传递）
 * 事务完成之后，需要在service层进行connection的关闭，在dao层关闭（PreparedStatement和ResultSet对象）
 *
 * @author Administrator
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource(name = "userMapper")
    private UserMapper userMapper;


    @Override
    public boolean checkUserCode(String userCode) {
        if (userMapper.checkUserCode(userCode) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean add(User user) {
        if (userMapper.add(user) > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public User login(String userCode, String userPassword) {
        User user = null;
        user = userMapper.getLoginUser(userCode);
        //匹配密码
        if (null != user) {
            if (!user.getUserPassword().equals(userPassword))
                user = null;
        }
        return user;
    }

    @Override
    public List<User> getUserList(Map<String, Object> param) {
        List<User> list = userMapper.getUserList(param);
        if (list != null) {
            return list;
        }
        return null;
    }


    @Override
    public int getUserCount(String queryUserName, int queryUserRole) {
        return userMapper.getUserCount(queryUserName, queryUserRole);
    }

    @Override
    public User selectUserCodeExist(String userCode) {
        return userMapper.getLoginUser(userCode);
    }

    @Override
    public boolean deleteUserById(Integer delId) {
        if (userMapper.deleteUserById(delId) > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public User getUserById(String id) {
        User user = userMapper.getUserById(id);
        if (user != null) {
            return user;
        }
        return null;
    }

    @Override
    public boolean modify(User user) {
        if (userMapper.modify(user) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean updatePwd(int id, String pwd) {
        if (userMapper.updatePwd(id, pwd) > 0) {
            return true;
        }
        return false;
    }
}
