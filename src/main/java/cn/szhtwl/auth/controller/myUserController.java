package cn.szhtwl.auth.controller;

import cn.szhtwl.auth.services.MyAuthService;
import cn.szhtwl.auth.services.MyRoleService;
import cn.szhtwl.base.baseController;
import cn.szhtwl.auth.bean.MyUser;
import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.auth.services.MyUserService;
import cn.szhtwl.utils.Md5Util;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by 宁采臣丶 on 2017/9/28.
 */
@Controller
@RequestMapping("/userManager")
public class myUserController  implements baseController<MyUser> {

    @Autowired
    MyUserService myUserService;

    @Autowired
    MyAuthService myAuthService;

    @Autowired
    MyRoleService myRoleService;

    @RequestMapping("/home")
    public String home(HttpServletRequest request,Integer pageNum){
        if(pageNum == null){
            request.setAttribute("pageUtil",myUserService.selectAll(1));
        }else{
            request.setAttribute("pageUtil",myUserService.selectAll(pageNum));
        }
        request.setAttribute("url","userManager/home");
        return "auth/UserManager";
    }

    @RequestMapping("/login")
    public String login(MyUser myUser, HttpSession session){
        Subject subject = SecurityUtils.getSubject();
        AuthenticationToken token =
                new UsernamePasswordToken(myUser.getLoginName(), Md5Util.getMD5Str(myUser.getPassword()));
        try {
            subject.login(token);
            MyUser u = (MyUser) subject.getPrincipal();
            MyUser user = (MyUser) (myUserService.selectById(u.getId())).getData();
            if(user == null){
                return "login";
            }
            //查询所有菜单
            ResponseDto responseDto = myAuthService.selectTopList();
            if(responseDto.getData()!=null){
                session.setAttribute("menu",responseDto.getData());
            }
            user.setPassword(null);
            session.setAttribute("user",user);
            user.setLoginTime(new Date());
            myUserService.update(user);
        } catch (AuthenticationException e) {
            e.printStackTrace();
        }
        return "home/MainIndex";
    }

    @RequestMapping("/{id}/selectById")
    @ResponseBody
    public ResponseDto selectById(@PathVariable("id") String id) {
        return myUserService.selectById(id);
    }

    public String add(MyUser myUser, HttpServletRequest request) {
        return null;
    }

    @RequestMapping("/add")
    public String add(MyUser myUser,String[] role,HttpServletRequest request) {
        if("200".equals(myUserService.add(myUser,role).getCode())){
            return "redirect:userManager/home.jhtml";
        }
        return  null;
    }

    @RequestMapping("/{id}/remove")
    @ResponseBody
    public ResponseDto remove(@PathVariable("id") String id) {
        return  myUserService.remove(id);
    }

    public String update(MyUser myUser, HttpServletRequest request) {
        return null;
    }

    @RequestMapping("/update")
    public String update(MyUser myUser,String[] role) {
        if("200".equals(myUserService.update(myUser,role).getCode())){
            return "redirect:userManager/home.jhtml";
        }
        return  null;
    }

    @RequestMapping("/{name}/checkName")
    @ResponseBody
    public ResponseDto checkName(@PathVariable("name")String name){
       return myUserService.checkName(name);
    }
}
