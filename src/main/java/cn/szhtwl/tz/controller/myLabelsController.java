package cn.szhtwl.tz.controller;

import cn.szhtwl.base.baseController;
import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.tz.bean.MyLabels;
import cn.szhtwl.tz.services.IMyLabelsService;
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
@RequestMapping("/labelManager")
public class myLabelsController  implements baseController<MyLabels>{

    @Autowired
    IMyLabelsService myLabelsService;

    @RequestMapping("/home")
    public String home(HttpServletRequest request){
        request.setAttribute("pageUtil",myLabelsService.selectAll());
        request.setAttribute("url","LabelManager/home");
        return "home/LabelManager";
    }
    @RequestMapping("/selectAll")
    @ResponseBody
    public ResponseDto selectAll(){
        return myLabelsService.selectAll();
    }

    @RequestMapping("/{id}/selectById")
    @ResponseBody
    public ResponseDto selectById(@PathVariable("id") String id) {
        return myLabelsService.selectById(id);
    }

    @RequestMapping("/add")
    public String add(MyLabels myLabels,HttpServletRequest request) {
        ResponseDto responseDto = myLabelsService.add(myLabels);
        if("200".equals(responseDto.getCode())){
            request.setAttribute("msg","添加成功");
        }else{
            request.setAttribute("msg","添加失败");
        }
        return "redirect:/labelManager/home.jhtml";
    }

    @RequestMapping("/{id}/remove")
    @ResponseBody
    public ResponseDto remove(@PathVariable("id")String id) {
        return myLabelsService.remove(id);
    }

    @RequestMapping("/update")
    public String update(MyLabels myLabels,HttpServletRequest request) {
        ResponseDto responseDto = myLabelsService.update(myLabels);
        if("200".equals(responseDto.getCode())){
            return "redirect:/labelManager/home.jhtml";
        }
        return null;
    }
}
