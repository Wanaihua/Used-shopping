package com.gx.service.Impl;

import com.gx.dao.IAccountdao;
import com.gx.domain.Goods;
import com.gx.domain.User;
import com.gx.domain.message;
import com.gx.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
@Service("accountService")
public class AccountServiceImpl implements AccountService {

    @Autowired
    private IAccountdao iaccountdao;

    @Override
    public List<User> userLogin(User user) {
        return iaccountdao.userLogin(user);
    }

    @Override
    public void Shopcar(String id, String useid) {
        iaccountdao.Shopcar(id,useid);
    }

    @Override
    public List<Goods> Seekgoods(String goodsname) {
        goodsname=new StringBuilder("%").append(goodsname).append("%").toString();
        return iaccountdao.Seekgoods(goodsname);
    }

    @Override
    public List<User> FindUser(String usename) {
        return iaccountdao.FindUser(usename);
    }

    @Override
    public void insert(User user) {
        iaccountdao.insert(user);
    }

    @Override
    public boolean UpdateGoodsPrice(HttpServletRequest request) {
        int id = Integer.valueOf(request.getParameter("id"));
        int bookCount = Integer.valueOf(request.getParameter("price"));
        iaccountdao.UpdateGoodsPrice(bookCount,id);
        return true;
    }

    @Override
    public boolean DeleteGoods(int id) {
        iaccountdao.DeleteGoods(id);
        return true;
    }

    @Override
    public boolean Addgoods(Goods goods) {
        iaccountdao.Addgoods(goods);
        return true;
    }

    @Override
    public boolean Deleteshopcargoods(HttpServletRequest request) {
        int id = Integer.valueOf(request.getParameter("id"));
        int goodsid = Integer.valueOf(request.getParameter("goodsid"));
        iaccountdao.Deleteshopcargoods(id,goodsid);
        return true;
    }

    @Override
    public boolean Preaserve(User user) {
        iaccountdao.Preaserve(user);
        return true;
    }

    @Override
    public boolean ChangeUserName(HttpServletRequest request) {
        int id = Integer.valueOf(request.getParameter("id"));
        String nname = request.getParameter("nname");
        iaccountdao.ChangeUserName(id,nname);
        return true;
    }

    @Override
    public boolean ban(HttpServletRequest request) {
        int id = Integer.valueOf(request.getParameter("id"));
        iaccountdao.ban(id);
        return true;
    }

    @Override
    public List<message> talk(int fromId, int toId) {
        List<message> l= iaccountdao.talk(fromId,toId);
        return l;
    }

    @Override
    public void message(message mes) {
        iaccountdao.message(mes);
    }


}

