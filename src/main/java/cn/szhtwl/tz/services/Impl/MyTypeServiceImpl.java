package cn.szhtwl.tz.services.Impl;

import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.enums.ResponseEnum;
import cn.szhtwl.tz.bean.MyType;
import cn.szhtwl.tz.bean.MyTypeExample;
import cn.szhtwl.tz.dao.MyTypeMapper;
import cn.szhtwl.tz.services.IMyTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by 宁采臣丶 on 2017/9/28.
 */
@Service
public class MyTypeServiceImpl implements IMyTypeService{

    @Autowired
    MyTypeMapper myTypeMapper;

    @Transactional
    public ResponseDto add(MyType myType) {
        try{
            int flag = myTypeMapper.insert(myType);
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
    public ResponseDto remove(String id) {
        try{
            int flag = myTypeMapper.deleteByPrimaryKey(id);
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
    public ResponseDto update(MyType myType) {
        try{
            int flag = myTypeMapper.updateByPrimaryKey(myType);
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
            MyType myType =  myTypeMapper.selectByPrimaryKey(id);
            if(myType!=null){
                return new ResponseDto(myType, ResponseEnum.success);
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
            MyTypeExample myTypeExample = new MyTypeExample();
            List<MyType> myTypelist =  myTypeMapper.selectByExample(myTypeExample);
            if(myTypelist.size()>0){
                return new ResponseDto(myTypelist, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }
}
