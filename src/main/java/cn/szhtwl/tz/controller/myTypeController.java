package cn.szhtwl.tz.controller;

import cn.szhtwl.base.baseController;
import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.tz.bean.MyType;
import cn.szhtwl.tz.services.IMyTypeService;
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
@RequestMapping("/typeManager")
public class myTypeController implements baseController<MyType> {

    @Autowired
    IMyTypeService MyTypeService;

    @RequestMapping("/{id}/selectById")
    @ResponseBody
    public ResponseDto selectById(@PathVariable("id")String id) {
        return MyTypeService.selectById(id);
    }

    @RequestMapping("/type_add")
    public String add(MyType myType,HttpServletRequest request) {
        ResponseDto responseDto = MyTypeService.add(myType);
        if("200".equals(responseDto.getCode())){
            return "redirect:/typeManager/home.jhtml";
        }
        return null;
    }

    @RequestMapping("/{id}/remove")
    @ResponseBody
    public ResponseDto remove(@PathVariable("id")String id) {
        return MyTypeService.remove(id);
    }

    @RequestMapping("/update")
    public String update(MyType myType, HttpServletRequest request) {
        ResponseDto responseDto = MyTypeService.update(myType);
        if("200".equals(responseDto.getCode())){
            return "redirect:/typeManager/home.jhtml";
        }
        return null;
    }
}
