package cn.szhtwl.auth.services.Impl;

import cn.szhtwl.auth.bean.MyUser;
import cn.szhtwl.auth.bean.MyUserExample;
import cn.szhtwl.auth.dao.MyUserMapper;
import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.enums.ResponseEnum;
import cn.szhtwl.auth.services.MyUserService;
import cn.szhtwl.utils.Md5Util;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by 宁采臣丶 on 2017/9/28.
 */
@Service
public class MyUserServiceImpl implements MyUserService {

    @Resource
    MyUserMapper myUserMapper;

    @Transactional
    public ResponseDto add(MyUser myUser,String[] rid) {
        try{
            String id= UUID.randomUUID().toString();
            id = id.replaceAll("-","");
            myUser.setId(id);
            myUser.setPassword(Md5Util.getMD5Str(myUser.getPassword()));
            myUser.setLoginTime(new Date());
            int a  = myUserMapper.insertSelective(myUser);
            for(String r:rid){
                int b = myUserMapper.insertUserToRole(myUser.getId(),r);
            }
            if(a>=1){
                return new ResponseDto(null, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch(Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    public ResponseDto add(MyUser myUser) {
        return null;
    }

    @Transactional
    public ResponseDto remove(String id) {
        try{
            myUserMapper.deleteUserToRole(id);
            int a  = myUserMapper.deleteByPrimaryKey(id);
            if(a>=1){
                return new ResponseDto(null, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch(Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    public ResponseDto update(MyUser myUser) {
        return null;
    }

    @Transactional
    public ResponseDto update(MyUser myUser,String[] roles) {
        try{
            //先删除所有的关系
            myUserMapper.deleteUserToRole(myUser.getId());
            //重新插入关系
            for(String r:roles){
                int b = myUserMapper.insertUserToRole(myUser.getId(),r);
            }
            int a  = myUserMapper.updateByPrimaryKeySelective(myUser);
            if(a>=1){
                return new ResponseDto(null, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch(Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    public ResponseDto selectById(String id) {
        try{
            MyUser myUser  = myUserMapper.selectByPrimaryKey(id);
            if(myUser!=null){
                return new ResponseDto(myUser, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch(Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    public ResponseDto selectAll(Integer pageNum) {
        try{
            PageHelper.startPage(pageNum,5);
            MyUserExample myUserExample = new MyUserExample();
            List<MyUser> myUserList  = myUserMapper.selectByExample(myUserExample);
            PageInfo pageInfo = new PageInfo(myUserList);
            pageInfo.getTotal();
            if(myUserList.size()>0){
                return new ResponseDto(pageInfo, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch(Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    /**
     * 用户登录方法(调用Shiro)
     * @param myUser
     * @return
     */
    public ResponseDto login(MyUser myUser) {
       /* try{
            MyUserExample myUserExample = new MyUserExample();
            MyUserExample.Criteria criteria = myUserExample.createCriteria();
            criteria.andLoginNameEqualTo(myUser.ge)
            List<MyUser> myUserList  = myUserMapper.selectByExample(myUserExample);
            if(myUserList.size()>0){
                return new ResponseDto(myUserList, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch(Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }*/
       return null;
    }

    public ResponseDto checkName(String name) {
         try{
             String flag = myUserMapper.checkName(name);
             if(flag!=null && !"".equals(flag)){
                 return new ResponseDto(1,ResponseEnum.success);
             }else{
                 return new ResponseDto(0,ResponseEnum.success);
             }
         }catch(Exception e){
             e.printStackTrace();
             return new ResponseDto(0,ResponseEnum.error);
         }
    }
}
