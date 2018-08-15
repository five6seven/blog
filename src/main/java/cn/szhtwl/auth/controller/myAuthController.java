package cn.szhtwl.auth.controller;

import cn.szhtwl.auth.bean.Ztree;
import cn.szhtwl.base.baseController;
import cn.szhtwl.auth.bean.MyAuth;
import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.auth.services.MyAuthService;
import cn.szhtwl.utils.ZtreeUtil;
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
@RequestMapping("/authManager")
public class myAuthController implements baseController<MyAuth> {
    @Autowired
    MyAuthService myAuthService;

    ResponseDto responseDto;

    ZtreeUtil ztreeUtil;

    @RequestMapping("/home")
    public String home(HttpServletRequest request, Integer pageNum){
        if(pageNum == null){
            request.setAttribute("pageUtil",myAuthService.selectAll(1));
        }else{
            request.setAttribute("pageUtil",myAuthService.selectAll(pageNum));
        }
        request.setAttribute("url","authManager/home");
        return "auth/AuthManager";
    }

    /**
     * 查询所有权限用于用户查看
     * @return
     */
    @RequestMapping("/selectAll")
    @ResponseBody
    public Ztree selectAll(){
        responseDto = myAuthService.selectTopList();
        ztreeUtil = new ZtreeUtil();
        return  ztreeUtil.BuildTree(responseDto);
    }

    /**
     * 根据Id查询信息
     * @param id
     * @return
     */
    @RequestMapping("/{id}/selectById")
    @ResponseBody
    public ResponseDto selectById(@PathVariable("id") String id) {
        responseDto = myAuthService.selectById(id);
        return  responseDto;
    }

    @RequestMapping("/add")
    public String add(MyAuth myAuth,HttpServletRequest request) {
        if("200".equals(myAuthService.add(myAuth).getCode())){
            return "redirect:userManager/home.jhtml";
        }
        return  null;
    }

    @RequestMapping("/{rid}/selectAllAuthByRoleId")
    @ResponseBody
    public ResponseDto selectAllAuthByRoleId(@PathVariable("rid") String rid){
        return myAuthService.selectAllAuthByRoleId(rid);
    }

    @RequestMapping("/{id}/remove")
    @ResponseBody
    public ResponseDto remove(@PathVariable("id") String id) {
        return  myAuthService.remove(id);
    }

    @RequestMapping("/update")
    public String update(MyAuth myAuth,HttpServletRequest request) {
        if("200".equals(myAuthService.update(myAuth).getCode())){
            return "redirect:userManager/home.jhtml";
        }
        return  null;
    }
}
