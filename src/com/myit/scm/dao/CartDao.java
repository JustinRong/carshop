package com.myit.scm.dao;

import java.util.List;
import java.util.Map;

import com.myit.scm.entity.Cart;

public interface CartDao {

	//��Ӽ�¼�����ﳵcart��
	public int insertOneCart(Cart cart);
	
	//��ѯ��ǰ�û����ﳵ�����м�¼���ܺ�
	public int selectAllThings(int cartUserId);
	
	//ͨ��userID����ѯ���ﳵ�Ƿ��м�¼
	public List<Cart> selectThingsByUserId(int cartUserId);
	
	//ͨ��userid��carBrand����ѯ���ﳵ���Ƿ��м�¼
	public Cart selectByUserIdAndCarBrand(int cartUserId,String carBrand);
	
	//�������ݿ��й��ﳵ����Ʒ��Ϣ
	public int updateCartByUserId(Cart cart);
	
	//��ѯ���ﳵ�����е���Ʒ��Ϣ
	public List<Cart> selectCartAll();
	
	//����cart_id�����ҹ��ﳵ��Ϣ
	public Cart selectOneByCartId(int cartId);
	
	//����ɹ��󽫽���״̬��Ϊ1
	public int updateCartIsPay(int cartId);
	
	//����cartUserID����ѯ���ﳵ���ѹ�������Ϣ
	public List<Cart> selectByCartUserId(int cartUserId);
	
	//����Cart�е�cartid��carid��ɾ������
  	public int deleteByCartIdAndCarId(Cart cart);
  	
  	//��ѯ�Ѿ��µ���û����Ķ�����Ϣ
  	public List<Cart> selectAllOrder();
  	
  	//���¶�������
  	public int updateCartOrder(int cartId);
}
