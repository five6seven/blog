package cn.szhtwl.base;

import cn.szhtwl.dto.ResponseDto;

/**
 * 基本Service接口，提供基本方法
 * Created by 宁采臣丶 on 2017/9/27.
 */
public interface baseService<T> {
    /**
     * 添加方法
     * @param t
     * @return
     */
    ResponseDto add(T t);

    /**
     * 删除方法
     * @param id
     * @return
     */
    ResponseDto remove(String id);

    /**
     * 修改方法
     * @param t
     * @return
     */
    ResponseDto update(T t);

    /**
     * 根据Id查询
     * @param id
     * @return
     */
    ResponseDto selectById(String id);

    /**
     * 查询所有
     * @return
     */
    ResponseDto selectAll(Integer pageNum);
}
