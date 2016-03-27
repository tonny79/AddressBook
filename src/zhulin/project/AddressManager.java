package zhulin.project;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class AddressManager {
	private static SessionFactory sessionFactory;
	static{
		try{
			sessionFactory=new Configuration().configure().buildSessionFactory();
		}catch(Throwable ex){
			System.err.println("Initial SessionFactory creation failed."+ex);
			ex.printStackTrace();
			//throw new ExceptionInInitializerError(ex);
		}
	}
	private List<Address> addresses=null;
	private boolean isLogin=false;
	
	private void loadAddresses() {
		// Load the addresses from DB
		try {
			org.hibernate.Session session = sessionFactory.getCurrentSession();
			session.beginTransaction();
			addresses = session.createCriteria(Address.class).list();
			session.getTransaction().commit();
			System.out.println("Retrieved addresses from database:"
					+ addresses.size());
		} catch (Throwable ex) {
			System.err.println("Can't retrieve address!" + ex);
			ex.printStackTrace();
			// Initialize the message queue anyway
			if (addresses == null) {
				addresses = new ArrayList<Address>();
			}
		}
	}
	
	public Address[] getAddresses(){
		this.loadAddresses();
		
		Address[] result=new Address[addresses.size()];
		Iterator<Address> iter=addresses.iterator();
		for(int i=0;i<result.length;i++){
			result[i]=iter.next();
		}
		
		Arrays.sort(result);
		
		return result;
	}
	
	public Address getAddress(int id){
		this.loadAddresses();
		for(Address address:addresses){
			if(address.getId()==id){
				return address;
			}
		}
		
		return null;
	}
	
	public void updateAddress(Address address){
		org.hibernate.Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.update(address);
		session.getTransaction().commit();
	}
	
	/*
	 * Add an address if no name found
	 * Otherwise will update the address
	 */
	public void addAddress(String name,String phone,String email,String company,String lover,String child1,String child2){
		//Refresh the address book
		this.loadAddresses();
		
		Address address=null;
		for(Iterator<Address> iter=addresses.iterator();iter.hasNext();){
			Address temp=iter.next();
			if(temp.getName().trim().equals(name.trim())){
				//Found the existed address!
				address=temp;
				break;
			}
		}
		
		if (address == null) {
			//Create new address
			address = new Address(new Date(), name, phone, email, company, lover, child1, child2);
			addresses.add(address);

			// Save to database
			try {
				org.hibernate.Session session = sessionFactory.getCurrentSession();
				session.beginTransaction();
				session.save(address);
				session.getTransaction().commit();
			} catch (Exception e) {
				System.err.println("Can't save the message to database." + e);
				e.printStackTrace();
			}
		} else {
			//Update the address
			address.setPhone(phone);
			address.setEmail(email);
			address.setCompany(company);
			address.setLover(lover);
			address.setChild1(child1);
			address.setChild2(child2);
			this.updateAddress(address);
		}
	}
	
	public void Login(String password){
		if(password!=null && password.trim().equals("vr715")){
			this.isLogin=true;
		}
	}
	
	public boolean isLogin(){
		return this.isLogin;
	}
}
