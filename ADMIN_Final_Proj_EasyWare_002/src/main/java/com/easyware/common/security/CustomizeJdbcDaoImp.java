/**
* 작업 날짜 : 2015. 11. 12.
* 구현 내용 :   
*  
* @author By Byeong Gi Kim 
*/
package com.easyware.common.security;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.jdbc.JdbcDaoImpl;

public class CustomizeJdbcDaoImp extends JdbcDaoImpl {
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		List<UserDetails> users = loadUsersByUsername(username);

		if (users.size() == 0) {
			logger.debug(username + "유저가 존재하지 않습니다.");

			UsernameNotFoundException ue = new UsernameNotFoundException(
					messages.getMessage("JdbcDaoImpl.notFound", new Object[] { username }, "Username {0} not found"));
			System.out.println("========================= 유저 확인 ===================== " + username);
			throw ue;
		}

		System.out.println("=========================유저 권한 생성 ===================== " + username);
		Member_Vo_Security user = (Member_Vo_Security) users.get(0);

		if (getEnableAuthorities()) {
			user.setAuthorities(loadUserAuthorities(username));
		}

		return user;
	}

	
	/*
	
	private String mem_code; 		// 1.  사원번호
	private String mem_id;			// 2.  아이디
	private String mem_pwd;			// 3.  패스워드
	private String mem_name;		// 4.  이름
	private int posit_num;			// 5.  직급번호
	private int dept_num;			// 6.  부서번호
	private String mem_tel;			// 7.  전화번호
	private String mem_email;		// 8.  이메일
	private String mem_hiredate; 		// 9. 입사일
	private String mem_birthdate; 		// 10. 생년월일
	private String mem_post;			// 11. 우편번호
	private String mem_roadaddr;		// 12. 도로명주소
	private String mem_jibunaddr;		// 13. 지번 주소
	private String mem_detailaddr;		// 14. 상세주소
	private String mem_state;  		// 15. 멤버 상태
	
	*/
	
	@Override
	protected List<UserDetails> loadUsersByUsername(String username) {
		return getJdbcTemplate().query(getUsersByUsernameQuery(), new String[] { username },
				new RowMapper<UserDetails>() {

					@Override
					public UserDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
						String mem_code  =rs.getString(1); 		// 1.  사원번호
						String mem_id	 =rs.getString(2);		// 2.  아이디
						String mem_pwd	 =rs.getString(3);		// 3.  패스워드
						String mem_name  =rs.getString(4);		// 4.  이름
						int dept_num	 =rs.getInt(5);			// 5.  부서번호
						int posit_num	 =rs.getInt(6);		    // 6.  직급번호
						String mem_tel	 =rs.getString(7);		// 7.  전화번호
						String mem_email =rs.getString(8);		// 8.  이메일
						String mem_hiredate  =rs.getString(9); 		// 9. 입사일
						String mem_birthdate =rs.getString(10); 	// 10. 생년월일
						String mem_post		 =rs.getString(11);		// 11. 우편번호
						String mem_roadaddr  =rs.getString(12);		// 12. 도로명주소
						String mem_jibunaddr =rs.getString(13);		// 13. 지번 주소
						String mem_detailaddr=rs.getString(14);		// 14. 상세주소
						String mem_state =rs.getString(15);  	// 15. 멤버 상태
						return new Member_Vo_Security(mem_code, mem_id, mem_pwd, mem_name, dept_num, posit_num, mem_tel, 
								mem_email, mem_hiredate, mem_birthdate, mem_post, mem_roadaddr, mem_jibunaddr, mem_detailaddr, mem_state);
					}

				});
	}

	@Override
	protected List<GrantedAuthority> loadUserAuthorities(String username) {
		return getJdbcTemplate().query(getAuthoritiesByUsernameQuery(), new String[] { username },
				new RowMapper<GrantedAuthority>() {

					@Override
					public GrantedAuthority mapRow(ResultSet rs, int rowNum) throws SQLException {
						String roleName = rs.getString(1);
						return new SimpleGrantedAuthority(roleName);
					}

				});
	}

	@Override
	protected List<GrantedAuthority> loadGroupAuthorities(String username) {
		return super.loadGroupAuthorities(username);
	}


	
}
