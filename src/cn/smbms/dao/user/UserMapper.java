package cn.smbms.dao.user;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import cn.smbms.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {


    public int checkUserCode(@Param("userCode") String userCode);

    /**
     * 增加用户信息
     *
     * @param
     * @param user
     * @return
     * @throws Exception
     */
    public int add(User user);

    /**
     * 通过userCode获取User
     *
     * @param
     * @param userCode
     * @return
     * @throws Exception
     */
    public User getLoginUser(@Param("userCode") String userCode);

    /**
     * 通过条件查询-userList
     *
     * @param
     * @param
     * @param
     * @return
     * @throws Exception
     */
    public List<User> getUserList(Map<String, Object> param);

    /**
     * 通过条件查询-用户表记录数
     *
     * @param
     * @param userName
     * @param userRole
     * @return
     * @throws Exception
     */
    public int getUserCount(@Param("userName") String userName, @Param("userRole") int userRole);

    /**
     * 通过userId删除user
     *
     * @param
     * @return
     * @throws Exception
     */
    public int deleteUserById(@Param("id") Integer id);


    /**
     * 通过userId获取user
     *
     * @param
     * @param id
     * @return
     * @throws Exception
     */
    public User getUserById(@Param("id") String id);

    /**
     * 修改用户信息
     *
     * @param
     * @param user
     * @return
     * @throws Exception
     */
    public int modify(User user);


    /**
     * 修改当前用户密码
     *
     * @param
     * @param id
     * @param
     * @return
     * @throws Exception
     */
    public int updatePwd(@Param("id") int id, @Param("userPassword") String userPassword);


}
