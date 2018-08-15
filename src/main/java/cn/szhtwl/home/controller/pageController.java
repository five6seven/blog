package cn.szhtwl.home.controller;

import cn.szhtwl.tz.dao.MyInvitationMapper;
import cn.szhtwl.tz.services.IMyInvitaionService;
import cn.szhtwl.tz.services.IMyLabelsService;
import cn.szhtwl.tz.services.IMyNodeService;
import cn.szhtwl.tz.services.Impl.MyInvitaionServiceImpl;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by 宁采臣丶 on 2017/9/27.
 */
@Controller
@RequestMapping("/page")
public class pageController {

    @Autowired
    IMyInvitaionService myInvitaionService;

    @Autowired
    IMyNodeService myNodeService;

    @Autowired
    IMyLabelsService myLabelsService;

    @RequestMapping("/admin")
    public String login(){
        return "login";
    }

    @RequestMapping("/Index")
    public String pageIndex(HttpServletRequest request,HttpSession session){
        //查询出帖子信息返回主页
        request.setAttribute("pageUtil",myInvitaionService.selectAll(1));
        //查询出所有标签信息
        session.setAttribute("labels",myLabelsService.selectAll());
        //查询出所有热门文章 6条
        session.setAttribute("hots",myInvitaionService.selectByHot());
        return "web/mainIndex";
        }

    @RequestMapping("/topical")
    public String topical(HttpServletRequest request, Integer pageNum){
        if(pageNum == null){
            request.setAttribute("pageUtil",myInvitaionService.selectAllToWeb(1));
        }else{
            request.setAttribute("pageUtil",myInvitaionService.selectAllToWeb(pageNum));
        }
        return "web/topical";
    }

    @RequestMapping("/mentality")
    public String mentality(HttpServletRequest request, Integer pageNum){
        if(pageNum == null){
            request.setAttribute("pageUtil",myNodeService.selectAll(1));
        }else{
            request.setAttribute("pageUtil",myNodeService.selectAll(pageNum));
        }
        return "web/mentality";
    }

    @RequestMapping("/aboutMe")
    public String aboutMe(){
        return "web/aboutMe";
    }

    @RequestMapping("/words")
    public String words(){
        return "web/words";
    }

    @RequestMapping("/{id}/context")
    public String context(HttpServletRequest request, @PathVariable("id")String id){
        request.setAttribute("in",myInvitaionService.selectById(id));
        return "web/context";
    }

}
