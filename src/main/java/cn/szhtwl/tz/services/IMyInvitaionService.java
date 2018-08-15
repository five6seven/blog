package cn.szhtwl.tz.services;

import cn.szhtwl.base.baseService;
import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.tz.bean.MyInvitation;

/**
 * Created by 宁采臣丶 on 2017/9/28.
 */
public interface IMyInvitaionService  extends baseService<MyInvitation> {
    ResponseDto selectByHot();

    ResponseDto add(MyInvitation myInvitation,String id);

    ResponseDto selectAllToWeb(Integer pageNum);
}
