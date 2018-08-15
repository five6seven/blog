package cn.szhtwl.tz.services.Impl;

import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.enums.ResponseEnum;
import cn.szhtwl.tz.bean.MyNode;
import cn.szhtwl.tz.bean.MyNodeExample;
import cn.szhtwl.tz.dao.MyNodeMapper;
import cn.szhtwl.tz.services.IMyNodeService;
import cn.szhtwl.utils.DateToString;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.logging.log4j.core.util.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * Created by 宁采臣丶 on 2017/9/28.
 */
@Service
public class MyNodeServiceImpl implements IMyNodeService {

    @Autowired
    MyNodeMapper myNodeMapper;

    @Transactional
    public ResponseDto add(MyNode myNode) {
        try{
            String id = UUID.randomUUID().toString();
            id=id.replaceAll("-","");
            myNode.setId(id);
            int flag = myNodeMapper.insert(myNode);
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
            int flag = myNodeMapper.deleteByPrimaryKey(id);
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
    public ResponseDto update(MyNode myNode) {
        try{
            int flag = myNodeMapper.updateByPrimaryKey(myNode);
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
            MyNode mynode = myNodeMapper.selectByPrimaryKey(id);
            if(mynode!=null){
                return new ResponseDto(mynode, ResponseEnum.success);
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
            MyNodeExample myNodeExample = new MyNodeExample();
            myNodeExample.setOrderByClause("create_time desc");
            List<MyNode> myNodeList = myNodeMapper.selectByExample(myNodeExample);
            PageInfo<MyNode> pageInfo = new PageInfo<MyNode>(myNodeList);
            if(myNodeList.size()>0){
                return new ResponseDto(pageInfo, ResponseEnum.success);
            }else {
                return new ResponseDto(null,ResponseEnum.info);
            }
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseDto(null,ResponseEnum.error);
        }
    }
}
