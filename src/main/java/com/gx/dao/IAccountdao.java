package com.gx.dao;

import com.gx.domain.Goods;
import com.gx.domain.User;
import com.gx.domain.message;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Repository  //此注解代表这是一个持久层，用法类似@controller、@service
public interface IAccountdao {

    @Select("select * from user where usename=#{usename} and password=#{password}")
    public List<User> userLogin(User user);

    @Insert("insert into shopcar(goodsid,useid) values(#{arg0},#{arg1})")
    public void Shopcar(String id, String useid);

    @Select("select * from goods where nname like #{goodsname}")
    public List<Goods> Seekgoods(String goodsname);

    @Select("select * from user where usename=#{usename}")
    public List<User> FindUser(String usename);

    @Select("insert into user(nname,usename,password,ssex,phone,email,address,birthday,judge) values(#{nname},#{usename},#{password},#{ssex},#{phone},#{email},#{address},#{birthday},0)")
    public Void insert(User user);

    @Select("update goods set price=#{arg0} where id=#{arg1}")
    public void UpdateGoodsPrice(int bookCount, int id);

    @Delete("delete from goods where id=#{id}")
    public void DeleteGoods(int id);

    @Insert("insert into goods(nname,price,classify,ddescribe,useid) values(#{nname},#{price},#{classify},#{ddescribe},#{useid})")
    public void Addgoods(Goods goods);

    @Delete("delete from shopcar where useid=#{arg0} and goodsid=#{arg1}")
    public void Deleteshopcargoods(int id, int goodsid);

    @Update("update user set nname=#{nname}, usename=#{usename},ssex=#{ssex},phone=#{phone},email=#{email},address=#{address},birthday=#{birthday} where id=#{id}")
    public void Preaserve(User user);

    @Update("update user set nname=#{arg1} where id=#{arg0}")
    public void ChangeUserName(int id, String nname);

    @Update("update user set judge='-1' where id=#{id}")
    public void ban(int id);

    @Select("select * from message where FromId=#{arg0} and ToId=#{arg1} or FromId=#{arg1} and ToId=#{arg0}")
    public List<message> talk(int fromId, int toId);

    @Insert("insert into message(conten,time,FromId,ToId) values(#{conten},#{time},#{FromId},#{ToId}) ")
    public void message(message mes);
}

