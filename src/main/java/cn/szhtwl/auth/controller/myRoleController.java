package cn.szhtwl.auth.controller;

import cn.szhtwl.base.baseController;
import cn.szhtwl.auth.bean.MyRole;
import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.auth.services.MyRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by 宁采臣丶 on 2017/9/27.
 */
@Controller
@RequestMapping("/roleManager")
public class myRoleController implements baseController<MyRole> {

    @Autowired
    MyRoleService myRoleService;

    @RequestMapping("/home")
    public String home(HttpServletRequest request, Integer pageNum){
        if(pageNum == null){
            request.setAttribute("pageUtil",myRoleService.selectAll(1));
        }else{
            request.setAttribute("pageUtil",myRoleService.selectAll(pageNum));
        }
        request.setAttribute("url","roleManager/home");
        return "auth/RoleManager";
    }

    @RequestMapping("/selectAll")
    @ResponseBody
    public ResponseDto selectAll(Integer pageNum){
        return myRoleService.selectAllToPage();
    }
    @RequestMapping("/{id}/selectById")
    @ResponseBody
    public ResponseDto selectById(@PathVariable("id") String id) {
        return myRoleService.selectById(id);
    }

    public String add(MyRole myRole, HttpServletRequest request) {
        return null;
    }

    @RequestMapping("/add")
    public String  add(MyRole myRole,String ids) {
        ResponseDto responseDto = myRoleService.add(myRole,ids);
        if("200".equals(responseDto.getCode())){
            return "redirect:/roleManager/home.jhtml";
        }
        return null;
    }

    @RequestMapping("{id}/remove")
    @ResponseBody
    public ResponseDto remove(@PathVariable("id") String id) {
        return myRoleService.remove(id);
    }

    @RequestMapping("/update")
    public String update(MyRole myRole,HttpServletRequest request) {
        ResponseDto responseDto = myRoleService.update(myRole);
        if("200".equals(responseDto.getCode())){
            return "redirect:/roleManager/home.jhtml";
        }
        return null;
    }
}
