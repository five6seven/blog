package cn.szhtwl.enums;

/**
 * Created by 宁采臣丶 on 2017/9/19.
 * 返回状态码枚举
 */
public enum  ResponseEnum {
    success("200","返回正常"),
    error("500","服务器返回异常"),
    info("400","客户端传递数据异常");
    private String code;
    private String message;

    ResponseEnum(){}

    ResponseEnum(String code, String message) {
        this.code = code;
        this.message = message;
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
