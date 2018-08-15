package cn.szhtwl.utils.shiro;

import cn.szhtwl.auth.bean.MyAuth;
import cn.szhtwl.auth.bean.MyAuthExample;
import cn.szhtwl.auth.dao.MyAuthMapper;
import cn.szhtwl.auth.services.MyAuthService;
import cn.szhtwl.dto.ResponseDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by 宁采臣丶 on 2017/9/28.
 */
public class FilterChainDefinitionMapBuilder {

    @Autowired
    MyAuthService myAuthService;

    public LinkedHashMap<String, String> build(){
        LinkedHashMap<String, String> linkhashmap = new
                LinkedHashMap<String, String>();
        ResponseDto responseDto = myAuthService.selectAllToShiro();
        List<MyAuth> myAuthList = (List<MyAuth>) responseDto.getData();
        //key不能为NUll 否则报chainName cannot be null or empty异常
        for(int i=0;i<myAuthList.size();i++){
            if(myAuthList.get(i).getUrl()!=null){
                if("/logout".equals(myAuthList.get(i).getUrl())){
                    linkhashmap.put(myAuthList.get(i).getUrl(),"logout");
                }else{
                    linkhashmap.put(myAuthList.get(i).getUrl(),"authc");
                }

            }
        }
        linkhashmap.put("/**", "anon");
        return linkhashmap;
    }
}
