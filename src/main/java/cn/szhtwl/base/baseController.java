package cn.szhtwl.base;

import cn.szhtwl.dto.ResponseDto;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by 宁采臣丶 on 2017/9/27.
 */
public interface baseController<T> {

    /**
     * 查询单个信息
     */
    ResponseDto selectById(String id);

    /**
     * 添加
     */
    String add(T t,HttpServletRequest request);

    /**
     * 删除
     */
    ResponseDto remove(String id);

    /**
     * 修改
     */
    String update(T t,HttpServletRequest request);
}
