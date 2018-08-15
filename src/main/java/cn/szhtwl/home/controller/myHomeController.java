package cn.szhtwl.home.controller;

import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.base.baseController;
import cn.szhtwl.home.bean.MyHome;
import cn.szhtwl.home.services.IMyHomeService;
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
@RequestMapping("/myHomeManager")
public class myHomeController implements baseController<MyHome> {

    @Autowired
    IMyHomeService myHomeService;

    @RequestMapping("/{id}/selectById")
    @ResponseBody
    public ResponseDto selectById(@PathVariable("id") String id) {
        return  myHomeService.selectById(id);

    }

    @RequestMapping("/add")
    public String add(MyHome myHome,HttpServletRequest request) {
        ResponseDto responseDto = myHomeService.add(myHome);
        if("200".equals(responseDto.getCode())){
            return "redirect:/myHomeManager/home.jhtml";
        }
        return null;
    }

    @RequestMapping("/{id}/remove")
    @ResponseBody
    public ResponseDto remove(@PathVariable("id") String id) {
        return  myHomeService.remove(id);
    }

    @RequestMapping("/update")
    public String update(MyHome myHome, HttpServletRequest request) {
        ResponseDto responseDto = myHomeService.update(myHome);
        if("200".equals(responseDto.getCode())){
            return "redirect:/myHomeManager/home.jhtml";
        }
        return null;
    }
}

