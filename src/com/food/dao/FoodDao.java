package com.food.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.food.model.Food;
@Service @Transactional    //注解  s在action里要使用的，t表示数据库的事物，与数据库有关
public class FoodDao {
@Resource SessionFactory factory;//在spring配置中有个bean叫sessionFactory
	
	public void addFood(Food food){
		Session s= factory.getCurrentSession();
		s.save(food);
		
	}
	
	public void deleteFood(Integer foodid){
		Session s= factory.getCurrentSession();
		Object food= s.load(Food.class, foodid);
		s.delete(food);
		
	}
	
    public void UpdateFood(Food food) throws Exception {
        Session s = factory.getCurrentSession();
        s.update(food);
    }
    
    public ArrayList<Food> QueryAllFood() {
        Session s = factory.getCurrentSession();
        String hql = "From Food";
        Query q = s.createQuery(hql);
        List foodList = q.list();
        return (ArrayList<Food>) foodList;
    }
    
    public Food GetFoodById(Integer foodid) {
        Session s = factory.getCurrentSession();
        Food food = (Food)s.get(Food.class, foodid);
        return food;
    }
    
    public ArrayList<Food> QueryFood(String foodname) { 
    	Session s = factory.getCurrentSession();
    	String hql = "From Food food where 1=1";//大写查询对象，小写查询对象别名，where1=1避免查询不出或没输入内容而报错
    	//上行food要与下行food写成一样
    	if(!foodname.equals("")) hql = hql + " and food.foodname like '%" + foodname + "%'";//在搜索栏中是否输入关键词，food.foodname是在food表中查询foodname字段
    	Query q = s.createQuery(hql);
    	List foodList = q.list();
    	return (ArrayList<Food>) foodList;
    }

}
