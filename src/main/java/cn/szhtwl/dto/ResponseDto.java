package cn.szhtwl.dto;

import cn.szhtwl.enums.ResponseEnum;

/**
 * Created by 宁采臣丶 on 2017/9/19.
 */
public class ResponseDto<T> {
    private T data; //传入的返回数据
    private String code;  //状态码
    private String message; //返回信息

    public ResponseDto(){}

    public ResponseDto(T data, ResponseEnum responseEnum) {
        this.data = data;
        this.code =responseEnum.getCode();
        this.message = responseEnum.getMessage();
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
