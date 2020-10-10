package cn.smbms.controller;

import cn.smbms.exception.LoginException;
import cn.smbms.pojo.Bill;
import cn.smbms.pojo.User;
import cn.smbms.service.user.UserService;
import cn.smbms.tools.Dto;
import cn.smbms.tools.PageSupport;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/sys/user")
public class UserController {

    @Resource(name = "userService")
    private UserService userService;

    @RequestMapping("/checkUserCode")
    @ResponseBody
    public String checkUserCode(String userCode) {
        Dto dto = new Dto();
        if (userService.checkUserCode(userCode)) {
            dto.setCode("1000");
            dto.setMessage("已被使用");
        } else {
            dto.setCode("200");
            dto.setMessage("可以使用");
        }
        String json = JSON.toJSONString(dto);
        System.out.println(json);
        return json;
    }

    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(String userCode, String userPassword, HttpServletRequest request) {
        User user = userService.login(userCode, userPassword);
        if (user == null) {
            System.out.println(userCode);
//              request.setAttribute("msg", "用户名或密码错误");
            throw new LoginException("用户名或密码错误");
//             return "Login";
        } else {
            System.out.println(userCode);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            return "redirect:/sys/bill/billList";
        }
    }

//    @ExceptionHandler(value = RuntimeException.class)
//    public String handlerException(RuntimeException e, HttpServletRequest request) {
//        request.setAttribute("e", e);
//        return "Login";
//    }

    @RequestMapping(value = "userList")
    public String toBill() {
        return "userList";
    }

//    @RequestMapping(value = "userList.json")
//    @ResponseBody
//    public String getBill(Model model, HttpServletRequest request) {
//        User user = new User();
//        Map<String, Object> param = new HashMap();
//        param.put("userName", request.getParameter("userName"));
//        param.put("userRole", request.getParameter("userRole"));
//        System.out.println(request.getParameter("userName"));
//        System.out.println(request.getParameter("userRole"));
//        param.put("startIndex", 1);
//        param.put("pageSize", 20);
//        Dto dto = new Dto();
//        List<User> users = userService.getUserList(param);
//        for (User user1 : users) {
//            System.out.println(user1.getUserName());
//        }
//        dto.setData(users);
//        String json = JSON.toJSONString(dto);
////        model.addAttribute("users", users);
//        return json;
//    }

    @RequestMapping(value = "userList.json")
    @ResponseBody
    public String getBill1(Model model, HttpServletRequest request) {
        User user = new User();
        user.setUserName(request.getParameter("userName"));
        int userRole = Integer.parseInt(request.getParameter("userRole"));
        user.setUserRole(userRole);
        PageSupport page = new PageSupport();
        page.setPageSize(10);
        page.setCurrentPageNo(0);
        Map<String, Object> param = new HashMap();
        param.put("user", user);
        param.put("p", page);
        Dto dto = new Dto();
        List<User> users = userService.getUserList(param);
        for (User user1 : users) {
            System.out.println(user1.getUserName());
        }
        dto.setData(users);
        String json = JSON.toJSONString(dto);
//        model.addAttribute("users", users);
        return json;
    }

    @RequestMapping(value = "/logout.do")
    public String drop(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return "Login";
    }

    @RequestMapping(value = "changePwd")
    public String pwdmodify(String oldpassword, String newpassword, String rnewpassword, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        System.out.println("旧密码" + oldpassword + "新密码" + newpassword + "新密码" + rnewpassword);
        Boolean logto = false;
        if (user.getUserPassword().equals(oldpassword)) {
            if (newpassword.equals(rnewpassword)) {
                Boolean flag = userService.updatePwd(user.getId(), newpassword);
                if (flag == true) {
                    logto = true;
                }
            }
        }
        if (logto == true) {
            request.setAttribute("msg", "密码修改成功，请重新登录");
            return "Login";
        } else {
            request.setAttribute("msg", "输入有误，请重新输入");
            return "pwdmodify";
        }

    }

    @RequestMapping(value = "change")
    public String doAddUser2() {
        return "pwdmodify";
    }


    @RequestMapping(value = "useradd")
    public String addUser() {
        return "useradd";
    }

    @RequestMapping(value = "useradd.do", method = RequestMethod.POST)
    public String add(User user, @RequestParam("photos") MultipartFile[] photos, HttpServletRequest request) {
        List<String> extName = new ArrayList<>();
        extName.add(".png");
        extName.add(".jpg");
        extName.add(".gif");
        List<String> imgPaths = new ArrayList<>();
        for (int i = 0; i < photos.length; i++) {
            MultipartFile photo = photos[i];
            //验证图片是否传入
            if (photo != null) {
                //获取文件名
                String oldFileName = photo.getOriginalFilename();
                System.out.println(oldFileName);
                //获取文件后缀名
                String hz = oldFileName.substring(oldFileName.lastIndexOf("."));
                //验证是否是指定的图片格式
                if (extName.contains(hz)) {
                    //验证文件大小
                    if (photo.getSize() <= 5000000) {
                        //获取文件需要存在服务器的地址
                        String newFilePath = request.getServletContext().getInitParameter("imagepath");
                        //设置新文件名称
                        String newFileName = UUID.randomUUID().toString() + hz;

                        //当前日期为文件夹名字
                        String newPath = new SimpleDateFormat("yyyyMMdd").format(new Date());

                        //根据地址和名称创建文件对象File
                        File file = new File(newFilePath + "/" + newPath + "/" + newFileName);
                        System.out.println(newFileName);
                        //判断对象是否存在，如果不存在创建（制作路径）
                        if (!file.exists()) {
                            file.mkdirs();
                        }

                        //将传入文件内容复制到新文件中
                        try {
                            photo.transferTo(file);
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                        //配置图片虚拟路径，保存到user对象，传入service，进行保存
                        String relationPath = "/images/" + newFileName;
                    } else {
                        System.out.println("文件太大了");
                    }
                } else {
                    System.out.println("文件格式不对");
                }
            }
        }

        if (userService.add(user)) {
            return "redirect:/sys/user/userList.html";
        } else {
            return "forward:/sys/user/addUser.html";
        }
    }


    @RequestMapping(value = "del")
    @ResponseBody
    public String del(Integer id) {
        Dto dto = new Dto();
        if (userService.deleteUserById(id)){
            dto.setCode("1000");
            dto.setMessage("删除成功");
        } else {
            dto.setCode("200");
            dto.setMessage("删除失败");
        }
        String json = JSON.toJSONString(dto);
        System.out.println(json);
        return json;
    }

    @RequestMapping(value = "upd/{id}")
    public String getUserById(HttpServletRequest request, @PathVariable String id) {
        request.setAttribute("user", userService.getUserById(id));
        return "usermodify";
    }

    @RequestMapping(value = "userupd.do", method = RequestMethod.POST)
    public String updUser(User user, HttpServletRequest request) {
        if (userService.modify(user)) {
            System.out.println("111");
            return "redirect:/sys/user/userList";
        } else {
            System.out.println("111");
            request.setAttribute("user", user);
            return "usermodify";
        }
    }

    @RequestMapping(value = "getuser/{id}")
    public String getUser(HttpServletRequest request, @PathVariable String id) {
        request.setAttribute("user", userService.getUserById(id));
        return "userdetail";
    }

    @InitBinder
    public void converter(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }
}
