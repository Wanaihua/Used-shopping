package com.gx.service;


import com.gx.domain.Goods;
import com.gx.domain.User;
import com.gx.domain.message;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface AccountService {

    //用户登录
    public List<User> userLogin(User user);

    //添加购物车
    public void Shopcar(String id, String useid);

    //查询商品
    public List<Goods> Seekgoods(String goodsname);

    //查询用户
    public List<User> FindUser(String usename);

    //注册
    public void insert(User user);

    //修改商品价格
    public boolean UpdateGoodsPrice(HttpServletRequest request);

    //下架商品
    public boolean DeleteGoods(int id);

    //发布商品
    public boolean Addgoods(Goods goods);

    //删除购物车
    public boolean Deleteshopcargoods(HttpServletRequest request);

    //修改个人信息
    public boolean Preaserve(User user);

    //修改非法用户名
    public boolean ChangeUserName(HttpServletRequest request);

    //封禁用户
    public boolean ban(HttpServletRequest request);

    //查询信息
    public List<message> talk(int fromId, int toId);

    //发送信息
    public void message(message mes);
}

