package cn.szhtwl.tz.services;

import cn.szhtwl.base.baseService;
import cn.szhtwl.dto.ResponseDto;
import cn.szhtwl.tz.bean.MyLabels;

/**
 * Created by 宁采臣丶 on 2017/9/28.
 */
public interface IMyLabelsService extends baseService<MyLabels> {
    ResponseDto selectAll();
}
