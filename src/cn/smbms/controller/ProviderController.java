package cn.smbms.controller;

import cn.smbms.pojo.Bill;
import cn.smbms.pojo.Provider;
import cn.smbms.service.provider.ProviderService;
import cn.smbms.tools.Dto;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value = "/sys/provider")
public class ProviderController {

    @Resource(name = "providerService")
    private ProviderService providerService;


    @RequestMapping(value = "providerList")
    public String toBill(){
        return "providerList";
    }

    @RequestMapping(value = "providerList.json")
    @ResponseBody
    public String getBill(Model model) throws Exception {
        Provider provider = new Provider();
        List<Provider> providers = providerService.getProviderList(provider.getProCode(), provider.getProName());
        model.addAttribute("providers", providers);
        Dto dto = new Dto();
        dto.setData(providers);
        String json = JSON.toJSONString(dto);
        System.out.println(dto.getData());
        return json;
    }
}
