package cn.smbms.controller;

import cn.smbms.pojo.Bill;
import cn.smbms.service.bill.BillService;
import cn.smbms.service.user.UserService;
import cn.smbms.tools.Dto;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/sys/bill")
public class BillController {

    @Resource(name = "billService")
    private BillService billService;

    @RequestMapping(value = "billList")
    public String toBill(){
        return "billList";
    }

    @RequestMapping(value = "billList.json")
    @ResponseBody
    public String getBill(Model model) throws Exception {
        Bill bill = new Bill();
        bill.setProductName("");
        bill.setIsPayment(0);
        bill.setProviderId(0);
        List<Bill> bills = billService.getBillList(bill);
        System.out.println(bills);
        model.addAttribute("bills", bills);
        Dto dto = new Dto();
        dto.setData(bills);
        String json = JSON.toJSONString(dto);
        System.out.println(dto.getData());
        return json;
    }
//    @InitBinder
//    public void converter(WebDataBinder binder) {
//        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
//    }
}
