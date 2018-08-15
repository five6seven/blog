package cn.szhtwl.tz.services.Impl;

import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.enums.ResponseEnum;
import cn.szhtwl.tz.bean.MyInvitation;
import cn.szhtwl.tz.bean.MyLabels;
import cn.szhtwl.tz.bean.MyLabelsExample;
import cn.szhtwl.tz.dao.MyLabelsMapper;
import cn.szhtwl.tz.services.IMyLabelsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * Created by 宁采臣丶 on 2017/9/28.
 */
@Service
public class MyLabelsServiceImpl implements IMyLabelsService {

    @Autowired
    MyLabelsMapper myLabelsMapper;

    @Transactional
    public ResponseDto add(MyLabels myLabels) {
        try{
            String id= UUID.randomUUID().toString();
            id = id.replaceAll("-","");
            myLabels.setId(id);
            int flag = myLabelsMapper.insertSelective(myLabels);
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
            int flag = myLabelsMapper.deleteByPrimaryKey(id);
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
    public ResponseDto update(MyLabels myLabels) {
        try{
            int flag = myLabelsMapper.updateByPrimaryKey(myLabels);
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
            MyLabels myLabels = myLabelsMapper.selectByPrimaryKey(id);
            if(myLabels!=null){
                return new ResponseDto(myLabels, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    public ResponseDto selectAll() {
        try{
            MyLabelsExample myLabelsExample = new MyLabelsExample();
            List<MyLabels> myLabelsList = myLabelsMapper.selectByExample(myLabelsExample);
            if(myLabelsList.size()>0){
                return new ResponseDto(myLabelsList, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }

    public ResponseDto selectAll(Integer pageNum) {
        return null;
    }
}
