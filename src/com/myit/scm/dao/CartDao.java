package com.myit.scm.dao;

import com.myit.scm.entity.Cart;

public interface CartDao {

	//��Ӽ�¼�����ﳵcart��
	public int insertOneCart(Cart cart);
	
	//��ѯ��ǰ�û����ﳵ�����м�¼���ܺ�
	public int selectAllThings(int cartUserId);
	
	//ͨ��userID����ѯ���ﳵ�Ƿ��м�¼
	public Cart selectThingsByUserId(int cartUserId);
	
	//ͨ��userid��carBrand����ѯ���ﳵ���Ƿ��м�¼
	public Cart selectByUserIdAndCarBrand(int cartUserId,String carBrand);
	
	//�������ݿ��й��ﳵ����Ʒ��Ϣ
	public int updateCartByUserId(Cart cart);
}
