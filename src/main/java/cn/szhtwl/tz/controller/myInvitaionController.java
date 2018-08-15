package cn.szhtwl.tz.controller;

import cn.szhtwl.base.baseController;
import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.tz.bean.MyInvitation;
import cn.szhtwl.tz.services.IMyInvitaionService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * Created by 宁采臣丶 on 2017/9/28.
 */
@Controller
@RequestMapping("/inManager")
public class myInvitaionController implements baseController<MyInvitation> {

    @Autowired
    IMyInvitaionService myInvitaionService;

    @RequestMapping("/home")
    public String home(HttpServletRequest request, Integer pageNum){
        if(pageNum == null){
            request.setAttribute("pageUtil",myInvitaionService.selectAllToWeb(1));
        }else{
            request.setAttribute("pageUtil",myInvitaionService.selectAllToWeb(pageNum));
        }
        request.setAttribute("url","inManager/home");
        return "home/InManager";
    }

    @RequestMapping("/{id}/selectById")
    @ResponseBody
    public ResponseDto selectById(@PathVariable("id") String id) {
        return myInvitaionService.selectById(id);
    }

    public String add(MyInvitation myInvitation, HttpServletRequest request) {
        return null;
    }

    @RequestMapping("/add")
    public String add(MultipartFile picture,MyInvitation myInvitation,@RequestParam(value = "lId") String lId) throws IOException {
        if(picture.getSize()>0){
            String fileName = new Date().getTime()+picture.getOriginalFilename().substring(picture.getOriginalFilename().indexOf('.'));
            String path = this.getClass().getResource("/").getPath();
            File file = new File("D:\\work\\workspace\\myblog\\src\\main\\webapp\\resources\\images\\pictures\\"+fileName);
            picture.transferTo(file);
            myInvitation.setImg(fileName);
        }
        ResponseDto responseDto = myInvitaionService.add(myInvitation,lId);
        if("200".equals(responseDto.getCode())){
            return "redirect:/inManager/home.jhtml";
        }
        return null;
    }

    @RequestMapping("/{id}/remove")
    @ResponseBody
    public ResponseDto remove(@PathVariable("id") String id) {
        return myInvitaionService.remove(id);
    }

    @RequestMapping("/update")
    public String update(MyInvitation myInvitation,HttpServletRequest request) {
        ResponseDto responseDto = myInvitaionService.update(myInvitation);
        if("200".equals(responseDto.getCode())){
            return "redirect:/inManager/home.jhtml";
        }
        return null;
    }
}
