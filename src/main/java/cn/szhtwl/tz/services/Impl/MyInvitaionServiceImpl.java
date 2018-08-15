package cn.szhtwl.tz.services.Impl;

import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.enums.ResponseEnum;
import cn.szhtwl.tz.bean.MyInvitation;
import cn.szhtwl.tz.bean.MyInvitationExample;
import cn.szhtwl.tz.dao.MyInvitationMapper;
import cn.szhtwl.tz.services.IMyInvitaionService;
import cn.szhtwl.utils.invitaionUtil;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by 宁采臣丶 on 2017/9/28.
 */
@Service
public class MyInvitaionServiceImpl implements IMyInvitaionService {

    @Autowired
    MyInvitationMapper myInvitationMapper;

    @Transactional
    public ResponseDto add(MyInvitation myInvitation,String lId) {
        String iId=UUID.randomUUID().toString();
        iId = iId.replaceAll("-","");
        try{
            myInvitation.setId(iId);
            myInvitation.setSubContext(invitaionUtil.getContent(myInvitation.getContext()));
            myInvitation.setStatus(0);
            myInvitation.setuNumber(1);
            myInvitation.setuPraise(1);
            myInvitation.setCreateTime(new Date());
            int flag =myInvitationMapper.insert(myInvitation);
            int b = myInvitationMapper.insertLable4In(iId,lId);
            if(b>0 && flag>0){
                return new ResponseDto(null, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    public ResponseDto add(MyInvitation myInvitation) {
        return null;
    }

    @Transactional
    public ResponseDto remove(String id) {
        try{
            myInvitationMapper.deleteLabelsById(id);
            int flag = myInvitationMapper.deleteByPrimaryKey(id);
            if(flag>0){
                return new ResponseDto(null, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    @Transactional
    public ResponseDto update(MyInvitation myInvitation) {
        try{
            int a =  myInvitationMapper.deleteLabelsById(myInvitation.getId());
            int b = myInvitationMapper.insertLable4In(myInvitation.getId(),myInvitation.getMyLabels().getId());
            int flag = myInvitationMapper.updateByPrimaryKeySelective(myInvitation);
            if(a>0 && b>0 && flag>0){
                return new ResponseDto(null, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    public ResponseDto selectById(String id) {
        try{
            MyInvitation myInvitation = myInvitationMapper.selectByPrimaryKey(id);
            if(myInvitation!=null){
                return new ResponseDto(myInvitation, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    public ResponseDto selectAll(Integer pageNum) {
        try{
            PageHelper.startPage(pageNum,6);
            MyInvitationExample myInvitationExample = new MyInvitationExample();
            //根据时间排序
            myInvitationExample.setOrderByClause("create_time desc");
            List<MyInvitation> myInvitationList = myInvitationMapper.selectByExample(myInvitationExample);
            PageInfo<MyInvitation> pageInfo  =new PageInfo<MyInvitation>(myInvitationList);
            if(myInvitationList.size()>0){
                return new ResponseDto(pageInfo, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    public ResponseDto selectAllToWeb(Integer pageNum) {
        try{
            PageHelper.startPage(pageNum,6);
            MyInvitationExample myInvitationExample = new MyInvitationExample();
            //根据时间排序
            myInvitationExample.setOrderByClause("create_time desc");
            //查询除未审核和已删除之外的帖子
            MyInvitationExample.Criteria criteria = myInvitationExample.createCriteria();
            criteria.andStatusNotEqualTo(0).andStatusNotEqualTo(-1);
            List<MyInvitation> myInvitationList = myInvitationMapper.selectByExample(myInvitationExample);
            PageInfo<MyInvitation> pageInfo  =new PageInfo<MyInvitation>(myInvitationList);
            if(myInvitationList.size()>0){
                return new ResponseDto(pageInfo, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    public ResponseDto selectByHot() {
        try{
            PageHelper.startPage(1,6);
            MyInvitationExample myInvitationExample = new MyInvitationExample();
            myInvitationExample.setOrderByClause("create_time desc");
            //查询热门
            MyInvitationExample.Criteria criteria = myInvitationExample.createCriteria();
            criteria.andStatusEqualTo(2);
            List<MyInvitation> myInvitationList = myInvitationMapper.selectByExample(myInvitationExample);
            if(myInvitationList.size()>0){
                return new ResponseDto(myInvitationList, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }
}
