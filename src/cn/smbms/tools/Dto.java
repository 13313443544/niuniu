package cn.smbms.tools;

public class Dto {
    private String code;//请求成功或失败编码
    private String message;//处理完请求的信息
    private Object data;//响应需要携带的数据

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

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
