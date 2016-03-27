package zhulin.project;

import java.util.*;
import javax.persistence.*;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="ZLAddressBook")
public class Address implements Comparable<Address>{
	private int id;
	private Date createdDate;
	private String name;
	private String phone;
	private String email;
	private String company;
	private String lover;
	private String child1;
	private String child2;
	
	private Address(){
	}
	
	public Address(Date createdDate,String name,String phone,String email,String company,String lover,String child1,String child2){
		this.createdDate=createdDate;
		this.name=name;
		this.phone=phone;
		this.email=email;
		this.company=company;
		this.lover=lover;
		this.child1=child1;
		this.child2=child2;
	}
	
	@Id
	@GeneratedValue(generator="increment")
	@GenericGenerator(name="increment", strategy = "increment")
	public int getId(){
		return this.id;
	}
	
	private void setId(int id){
		this.id=id;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CreatedDate")
	public Date getCreatedDate(){
		return this.createdDate;
	}
	
	private void setCreatedDate(Date createdDate){
		this.createdDate=createdDate;
	}
	
	public String getName(){
		return this.name;
	}
	
	private void setName(String name){
		this.name=name;
	}
	
	public String getPhone(){
		return this.phone;
	}
	
	public void setPhone(String phone){
		this.phone=phone;
	}
	
	public String getEmail(){
		return this.email;
	}
	
	public void setEmail(String email){
		this.email=email;
	}
	
	public String getLover(){
		return this.lover;
	}
	
	public void setLover(String lover){
		this.lover=lover;
	}
	
	public String getChild1(){
		return this.child1;
	}
	
	public void setChild1(String child1){
		this.child1=child1;
	}
	
	public String getChild2(){
		return this.child2;
	}
	
	public void setChild2(String child2){
		this.child2=child2;
	}
	
	public String getCompany(){
		return this.company;
	}
	
	public void setCompany(String company){
		this.company=company;
	}

	@Override
	public int compareTo(Address a) {
		return this.id-a.id;
	}

}
