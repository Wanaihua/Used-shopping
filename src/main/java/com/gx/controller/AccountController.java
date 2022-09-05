package com.gx.controller;

import com.gx.domain.Goods;
import com.gx.domain.User;
import com.gx.domain.message;
import com.gx.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class AccountController {

    @Autowired
    private AccountService accountService;

    @RequestMapping("/AiHua")
    public String goToAiHua(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return "index";
    }

    //登录
    @RequestMapping("/account/userLogin")
    public String userLogin(User user, HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<User> l=accountService.userLogin(user);
        if(l.isEmpty()) {
            request.setAttribute("useid",0);
            return "user_login";
        }
        User userr=l.get(0);
        int useId=userr.getId();
        if(userr.getJudge()==-1) {
            request.setAttribute("useid",-1);
            return "user_login";
        }else if(userr.getJudge()==1){
            request.setAttribute("useid",useId);
            return "index1";
        }else{
            request.setAttribute("useid",useId);
            return "index_top";
        }
    }

    //注册
    @RequestMapping("/accont/insert")
    public  String insert(User user,HttpServletRequest request, HttpServletResponse response) throws IOException{
        List<User> has=accountService.FindUser(user.getUsename());
        if(has.isEmpty()){
            accountService.insert(user);
            request.setAttribute("ac",1);
            return "user_register";
        }else{
            request.setAttribute("have",1);
            return "user_register";
        }
    }

    // 卖家信息页
    @RequestMapping("/account/information")
    public String information(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String Id=request.getParameter("useid");
        if(request.getParameter("FromId")!=null){
            int FromId=Integer.parseInt(request.getParameter("FromId"));
            request.setAttribute("FromId",FromId);
        }
        request.setAttribute("useid", Id);
        return "want";
    }

    //加入购物车
    @RequestMapping("/account/Shopcar")
    public String Shopcar(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String id=request.getParameter("id");
        String useid=request.getParameter("uuid");
        accountService.Shopcar(id,useid);
        return "shopcaryes";
    }

    //查询商品
    @RequestMapping("/account/Seekgoods")
    public String Seekgoods(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String Goodsname=request.getParameter("goodsname");
        List<Goods> l=accountService.Seekgoods(Goodsname);
        request.setAttribute("list",l);
        return "index_seek";
    }

    //修改商品价格
    @RequestMapping("/account/UpdateGoods")
    public String UpdateServlet(HttpServletRequest request, HttpServletResponse response)throws IOException{
        int id=Integer.valueOf(request.getParameter("useid"));
        boolean b=accountService.UpdateGoodsPrice(request);
        request.setAttribute("useid",id);
        return "mygoods";
    }

    //删除商品
    @RequestMapping("/account/DeleteGoods")
    public String UpdateGoods(HttpServletRequest request, HttpServletResponse response)throws IOException{
        int id = Integer.valueOf(request.getParameter("id"));
        boolean d=accountService.DeleteGoods(id);
        String useid=request.getParameter("Useid");
        request.setAttribute("id", useid);
        return "mygoods";
    }

    //发布商品
    @RequestMapping("/account/Addgoods")
    public String Addgoods(HttpServletRequest request, HttpServletResponse response,Goods goods)throws IOException{
        int id = Integer.valueOf(request.getParameter("id"));
        boolean a=accountService.Addgoods(goods);
        request.setAttribute("useid", id);
        return "addgoodssuccess";
    }

    //删除购物车
    @RequestMapping("/account/Deleteshopcargoods")
    public String Deleteshopcargoods(HttpServletRequest request, HttpServletResponse response,Goods goods)throws IOException {
        int id = Integer.valueOf(request.getParameter("id"));
        boolean d=accountService.Deleteshopcargoods(request);
        request.setAttribute("useid",id);
        return "shopcar_1";
    }

    //修改个人信息
    @RequestMapping("/account/Preserve")
    public String Preaserve(HttpServletRequest request, HttpServletResponse response,User user)throws IOException {
        boolean p=accountService.Preaserve(user);
        request.setAttribute("yes",1);
        return "myself";
    }

    //修改用户用户名
    @RequestMapping("/account/ChangeUserName")
    public String ChangeUserName(HttpServletRequest request, HttpServletResponse response)throws IOException {
        boolean c=accountService.ChangeUserName(request);
        int iid=Integer.valueOf(request.getParameter("iid"));
        request.setAttribute("useid", iid);
        request.setAttribute("yes",1);
        return "index2";
    }

    //封禁用户
    @RequestMapping("/account/ban")
    public String ban(HttpServletRequest request, HttpServletResponse response)throws IOException {
        boolean c=accountService.ban(request);
        int iid=Integer.valueOf(request.getParameter("iid"));
        request.setAttribute("useid", iid);
        request.setAttribute("yes",2);
        return "index2";
    }

    //查询信息
    @RequestMapping("/account/talk")
    public String talk(HttpServletRequest request, HttpServletResponse response)throws IOException {
        int FromId=Integer.parseInt(request.getParameter("FromId"));
        int ToId=Integer.parseInt(request.getParameter("ToId"));
        String name=request.getParameter("name");
        List<message> list=accountService.talk(FromId,ToId);
        request.setAttribute("name",name);
        request.setAttribute("list",list);
        request.setAttribute("FromId",FromId);
        request.setAttribute("ToId",ToId);
        return "talk";
    }

    //发送信息
    @RequestMapping("/account/message")
    public String message(HttpServletRequest request, HttpServletResponse response,message mes)throws IOException {
        accountService.message(mes);
        request.setAttribute("name",request.getParameter("name"));
        return talk(request,response);
    }
}

