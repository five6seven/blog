package cn.szhtwl.tz.controller;

import cn.szhtwl.base.baseController;
import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.tz.bean.MyNode;
import cn.szhtwl.tz.services.IMyNodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by 宁采臣丶 on 2017/9/28.
 */
@Controller
@RequestMapping("/nodeManager")
public class myNodeController implements baseController<MyNode> {

    @Autowired
    IMyNodeService myNodeService;

    @RequestMapping("/home")
    public String home(HttpServletRequest request, Integer pageNum){
        if(pageNum == null){
            request.setAttribute("pageUtil",myNodeService.selectAll(1));
        }else{
            request.setAttribute("pageUtil",myNodeService.selectAll(pageNum));
        }
        request.setAttribute("url","nodeManager/home");
        return "home/NodeManager";
    }

    @RequestMapping("/{id}/selectById")
    @ResponseBody
    public ResponseDto selectById(@PathVariable("id") String id) {
        return myNodeService.selectById(id);
    }

    @RequestMapping("/add")
    public String add(MyNode myNode,HttpServletRequest request) {
        ResponseDto responseDto = myNodeService.add(myNode);
        if("200".equals(responseDto.getCode())){
            return "redirect:/nodeManager/home.jhtml";
        }
        return null;
    }

    @RequestMapping("/{id}/remove")
    @ResponseBody
    public ResponseDto remove(@PathVariable("id")String id) {
        return myNodeService.remove(id);
    }

    @RequestMapping("/update")
    public String update(MyNode myNode,HttpServletRequest request) {
        ResponseDto responseDto = myNodeService.update(myNode);
        if("200".equals(responseDto.getCode())){
            return "redirect:/typeManager/home.jhtml";
        }
        return null;
    }
}
