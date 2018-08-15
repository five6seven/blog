package cn.szhtwl.home.services.Impl;

import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.enums.ResponseEnum;
import cn.szhtwl.home.bean.MyHome;
import cn.szhtwl.home.bean.MyHomeExample;
import cn.szhtwl.home.dao.MyHomeMapper;
import cn.szhtwl.home.services.IMyHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by 宁采臣丶 on 2017/9/28.
 */
@Service
public class MyHomeServiceImpl implements IMyHomeService {

    @Autowired
    MyHomeMapper myHomeMapper;

    @Transactional
    public ResponseDto add(MyHome myHome) {
        try{
            int flag = myHomeMapper.insert(myHome);
            if(flag >0){
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
    public ResponseDto remove(String id) {
        try{
            int flag = myHomeMapper.deleteByPrimaryKey(id);
            if(flag >0){
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
    public ResponseDto update(MyHome myHome) {
        try{
            int flag = myHomeMapper.updateByPrimaryKey(myHome);
            if(flag >0){
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
           MyHome myHome = myHomeMapper.selectByPrimaryKey(id);
            if(myHome!=null){
                return new ResponseDto(myHome, ResponseEnum.success);
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
            MyHomeExample myHomeExample =new MyHomeExample();
            myHomeExample.setOrderByClause("location");
            List<MyHome> myHomeList = myHomeMapper.selectByExample(myHomeExample);
            if(myHomeList.size()>0){
                return new ResponseDto(myHomeList, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }
}
