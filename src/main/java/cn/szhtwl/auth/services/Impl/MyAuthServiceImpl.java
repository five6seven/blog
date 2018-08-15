package cn.szhtwl.auth.services.Impl;

import cn.szhtwl.auth.bean.MyAuth;
import cn.szhtwl.auth.bean.MyAuthExample;
import cn.szhtwl.auth.dao.MyAuthMapper;
import cn.szhtwl.auth.dao.MyRoleMapper;
import cn.szhtwl.auth.services.MyRoleService;
import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.enums.ResponseEnum;
import cn.szhtwl.auth.services.MyAuthService;
import cn.szhtwl.utils.CharToString;
import cn.szhtwl.utils.PageUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.logging.log4j.core.util.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.UUID;

/**
 * Created by 宁采臣丶 on 2017/9/26.
 */
@Service
public class MyAuthServiceImpl implements MyAuthService {
    @Autowired
    MyAuthMapper myAuthMapper;

    ResponseDto responseDto;

    MyAuthExample myAuthExample;

    List<MyAuth> myAuthList;

    /**
     * 查询所有权限构建菜单
     * @return
     */
    public ResponseDto selectTopList() {
        MyAuthExample myAuthExample = new MyAuthExample();
        MyAuthExample.Criteria c= myAuthExample.createCriteria();
        c.andPaternalIsNull();
        List<MyAuth> alist = myAuthMapper.selectByExample(myAuthExample);
        MyAuth myauth = createTree(alist.get(0));
        responseDto = new ResponseDto(myauth, ResponseEnum.success);
        return responseDto;
    }

    /**
     * 创建权限树
     * @param myAuth
     * @return
     */
    private MyAuth createTree(MyAuth myAuth){
        MyAuthExample authExample;
        MyAuthExample.Criteria c;
        if(myAuth.getMyAuthList().size()>0){
            //将该权限的子权限遍历
            for(MyAuth my :myAuth.getMyAuthList()){
                authExample  = new MyAuthExample();
                c = authExample.createCriteria();
                //为菜单的权限项
                c.andPaternalEqualTo(my.getId());
                //将查询到的所有子权限放入到Auths
                List<MyAuth> myList = myAuthMapper.selectByExample(authExample);
                if(myList.size() >0){
                    my.setMyAuthList(myList);
                    createTree(my);
                }else{
                    my.setMyAuthList(null);
                }
            }
        }
        return myAuth;
    }
    public ResponseDto selectAlltoMenu() {
    /*
        myAuthExample = new MyAuthExample();
        try{
            //排序方式
            myAuthExample.setOrderByClause("ocode");
            MyAuthExample.Criteria criteria = myAuthExample.createCriteria();
            //遍历所有为菜单的权限
            criteria.andIsmenuEqualTo(1);
            myAuthList =  myAuthMapper.selectByExample(myAuthExample);
            //封装进返回dto中
            return responseDto = new ResponseDto(myAuthList, ResponseEnum.success);
        }catch (Exception e){
            e.printStackTrace();
            return responseDto = new ResponseDto(null, ResponseEnum.error);
        }*/
        return null;
    }


    /**
     * 根据用户Id查询其拥有的所有角色
     * @param roleId
     * @return
     */
    public ResponseDto selectAllAuthByRoleId(String roleId) {
       try{
           List<MyAuth> myAuthList =  myAuthMapper.selectAllAuthByRoleId(roleId);
           if(myAuthList.size()>0){
               return new ResponseDto(myAuthList,ResponseEnum.success);
           }else {
               return new ResponseDto(null,ResponseEnum.info);
           }
       }catch (Exception e){
           e.printStackTrace();
           return new ResponseDto(null,ResponseEnum.error);
       }
    }

    /**
     * 查询所有权限
     * @return
     */
    public ResponseDto selectAll(Integer pageNum){
        myAuthExample = new MyAuthExample();
        try{
            PageHelper.startPage(pageNum,10);
            myAuthExample.setOrderByClause("ocode");
            MyAuthExample.Criteria criteria = myAuthExample.createCriteria();
            myAuthList = myAuthMapper.selectByExample(myAuthExample);
            PageInfo<MyAuth> pageInfo = new PageInfo<MyAuth>(myAuthList);
            if(myAuthList.size()>0){
                return responseDto = new ResponseDto(pageInfo,ResponseEnum.success);
            }else{
                return responseDto = new ResponseDto(null,ResponseEnum.success);
            }
        }catch (Exception e){
            e.printStackTrace();
            return  responseDto = new ResponseDto(null,ResponseEnum.error);
        }
    }

    public ResponseDto selectAllToShiro(){
        myAuthExample = new MyAuthExample();
        try{
            myAuthExample.setOrderByClause("ocode");
            MyAuthExample.Criteria criteria = myAuthExample.createCriteria();
            myAuthList = myAuthMapper.selectByExample(myAuthExample);
            if(myAuthList.size()>0){
                return responseDto = new ResponseDto(myAuthList,ResponseEnum.success);
            }else{
                return responseDto = new ResponseDto(null,ResponseEnum.success);
            }
        }catch (Exception e){
            e.printStackTrace();
            return  responseDto = new ResponseDto(null,ResponseEnum.error);
        }
    }

    /**
     * 根据Id查询单个权限
     * @param id
     * @return
     */
    public ResponseDto selectById(String id) {
        try{
            MyAuth myAuth = myAuthMapper.selectByPrimaryKey(id);
            if(myAuth!=null){
                return new ResponseDto(myAuth,ResponseEnum.success);
            }else{
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch(Exception e){
            return new ResponseDto(null,ResponseEnum.error);
        }

    }

    /**
     * 添加方法
     * @param myAuth
     * @return
     */
    @Transactional
    public ResponseDto add(MyAuth myAuth) {
        try{
            String id=UUID.randomUUID().toString();
            id = id.replaceAll("-","");
            myAuth.setName(CharToString.toString(myAuth.getName()));
            myAuth.setId(id);
            int a  = myAuthMapper.insert(myAuth);
            if(a>=1){
                return new ResponseDto(null,ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch(Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    /**
     * 删除方法
     * @param id
     * @return
     */
    @Transactional
    public ResponseDto remove(String id) {
        try{
            myAuthMapper.deleteR4auth(id);
            int a  = myAuthMapper.deleteByPrimaryKey(id);
            if(a>=1){
                return new ResponseDto(null,ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch(Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    /**
     * 修改方法
     * @param myAuth
     * @return
     */
    @Transactional
    public ResponseDto update(MyAuth myAuth) {
        try{
            int a  = myAuthMapper.updateByPrimaryKey(myAuth);
            if(a>=1){
                return new ResponseDto(null,ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch(Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

}
