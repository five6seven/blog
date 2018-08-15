package cn.szhtwl.utils;

import cn.szhtwl.auth.bean.MyAuth;
import cn.szhtwl.auth.bean.Ztree;
import cn.szhtwl.dto.ResponseDto;

import java.util.ArrayList;
import java.util.List;

/**
 * 构建Ztree权限树
 * Created by 宁采臣丶 on 2017/10/20.
 */
public class ZtreeUtil {

    private Ztree ztree;

    public  Ztree BuildTree(ResponseDto<MyAuth> responseDto){
        ztree = new Ztree();
        ztree.setId(responseDto.getData().getId());
        //名字为权限名
        ztree.setName(responseDto.getData().getName());
        //构建符合Ztree规范的权限树
        List<Ztree> ztrees = bulidChild(responseDto.getData().getMyAuthList());
        ztree.setChildren(ztrees);
        return ztree;
    }

    private List<Ztree> bulidChild(List<MyAuth> myAuths) {
        if(myAuths!=null &&myAuths.size()>0){
            //新建一个Ztree集合
            List<Ztree> ztrees = new ArrayList<Ztree>();
            for(MyAuth myAuth:myAuths){
                Ztree ztree = new Ztree();
                ztree.setId(myAuth.getId());
                ztree.setName(myAuth.getName());
                if(myAuth.getMyAuthList()!=null && myAuth.getMyAuthList().size()>0){
                    //递归调用
                    ztree.setChildren(bulidChild(myAuth.getMyAuthList()));
                }
                //添加进集合
                ztrees.add(ztree);
            }
            return ztrees;
        }
        return null;
    }


}
