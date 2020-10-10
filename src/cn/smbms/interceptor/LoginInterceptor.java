package cn.smbms.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor  implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object o) throws Exception {
        //如果是登录页面，放行
        if (request.getRequestURI().contains("login")){
            return true;
        }

        //如果用户已登录也放行
        HttpSession session=request.getSession();
        if (session.getAttribute("user")!=null){
            return  true;
        }
        //用户没有登录跳转到登录页面
        request.getRequestDispatcher("/WEB-INF/Jsp/Login.jsp").forward(request,response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        System.out.println("controller执行后但未返回视图前调用此方法");
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        System.out.println("controller执行后且视图返回后调用此方法");
    }
}
