package cn.szhtwl.auth.services.Impl;

import cn.szhtwl.auth.bean.MyRole;
import cn.szhtwl.auth.bean.MyRoleExample;
import cn.szhtwl.auth.dao.MyRoleMapper;
import cn.szhtwl.auth.services.MyRoleService;
import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.enums.ResponseEnum;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by 宁采臣丶 on 2017/9/28.
 */
@Service
public class MyRoleServiceImpl implements MyRoleService {

    @Autowired
    MyRoleMapper myRoleMapper;

    MyRoleExample myRoleExample;

    @Transactional
    public ResponseDto add(MyRole myRole) {
       return null;
    }

    @Transactional
    public ResponseDto remove(String id) {
        try{
            int b = myRoleMapper.deleteAuthsByRole(id);
            int flag = myRoleMapper.deleteByPrimaryKey(id);
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
    public ResponseDto update(MyRole myRole) {
        try{
            int flag = myRoleMapper.updateByPrimaryKey(myRole);
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

    public ResponseDto selectById(String id) {
        try{
            MyRole myRole =  myRoleMapper.selectByPrimaryKey(id);
            if(myRole!=null){
                return new ResponseDto(myRole, ResponseEnum.success);
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
            PageHelper.startPage(pageNum,5);
            myRoleExample = new MyRoleExample();
            List<MyRole> myRolesList =  myRoleMapper.selectByExample(myRoleExample);
            PageInfo<MyRole> pageInfo  = new PageInfo<MyRole>(myRolesList);
            if(myRolesList.size()>0){
                return new ResponseDto(pageInfo, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    public ResponseDto selectAllRoleByUserId(String userId) {
        try{
            List<MyRole> myRolesList =  myRoleMapper.selectAllRoleByUserId(userId);
            if(myRolesList.size()>0){
                return new ResponseDto(myRolesList, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    public ResponseDto selectAllToPage() {
        try{
            myRoleExample = new MyRoleExample();
            List<MyRole> myRolesList =  myRoleMapper.selectByExample(myRoleExample);
            if(myRolesList.size()>0){
                return new ResponseDto(myRolesList, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    public ResponseDto add(MyRole myRole, String ids) {
        String id= UUID.randomUUID().toString();
        id = id.replaceAll("-","");
        ObjectMapper mapper = new ObjectMapper();
        JavaType javaType = mapper.getTypeFactory().constructCollectionType(ArrayList.class, String.class);
        try{
            List<String> list =mapper.readValue(ids,javaType);
            myRole.setId(id);
            int flag = myRoleMapper.insert(myRole);
            for(String s:list){
                myRoleMapper.inserAuth(id,s);
            }
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
}
