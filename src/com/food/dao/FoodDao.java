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
@Service @Transactional    //ע��  s��action��Ҫʹ�õģ�t��ʾ���ݿ����������ݿ��й�
public class FoodDao {
@Resource SessionFactory factory;//��spring�������и�bean��sessionFactory
	
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
    	String hql = "From Food food where 1=1";//��д��ѯ����Сд��ѯ���������where1=1�����ѯ������û�������ݶ�����
    	//����foodҪ������foodд��һ��
    	if(!foodname.equals("")) hql = hql + " and food.foodname like '%" + foodname + "%'";//�����������Ƿ�����ؼ��ʣ�food.foodname����food���в�ѯfoodname�ֶ�
    	Query q = s.createQuery(hql);
    	List foodList = q.list();
    	return (ArrayList<Food>) foodList;
    }

}
