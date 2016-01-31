/**
 *	@see 
 *  @author  By Beyeong Gi Kim
 *  @version 1.0 ver 
 *  
 */


/**
 * 
 * @see 게시판의 해당번호게시물을 삭제
 */
	/*function del(board_num){
					alert(board_num);
		if(confirm("정말로 삭제 하시겠습니까?")){
			location="mem.kosta?cmd=memdel&board_num="+board_num;
		}*/
		
/**
 * 
 * @see 해당 URL 로 이동한다.
 * @param url (String)
 */
function goUrl(url) {
	location= url;
}



/**
 * 
 * @see history에서 뒤로가기 한다.
 * @param url (String)
 */
function back() {
	history.back();
}




/**
 * 
 * @see 해당 URL 로 이동한다.
 * @returns String : 현재 시간 날짜를 반환한다.
 * 
 */
function today(){
	var day= new Date();
	return day;
}