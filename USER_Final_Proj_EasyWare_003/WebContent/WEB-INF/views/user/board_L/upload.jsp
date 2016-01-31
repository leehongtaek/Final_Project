<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,
                 com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
                 java.util.*"%>


업로드 성공 !                    
<%
	MultipartRequest up = null;
	try {
		String path = "C:/Semi-Proj/workspace/USER_Final_Proj_EasyWare_003/WebContent/resources/upload"; // 저장할 디렉토리 (절대경로)
		int size = 10 * 1024 * 1024; // 10메가까지 제한 넘어서면 예외발생
		up = new MultipartRequest(request, path, size, "euc-kr", new DefaultFileRenamePolicy());
		Enumeration e = up.getFileNames(); // 폼의 이름 반환
		if (e == null) // 파일이 업로드 되지 않았을때
			response.sendRedirect("board_L_list.jsp");
	} catch (Exception e) {
		response.sendRedirect("board_L_list.jsp");
	}
%>

<%
	for (Enumeration e = up.getFileNames(); e.hasMoreElements();) {
		String strName = (String) e.nextElement();
		String fileName = up.getFilesystemName(strName);
		if (fileName != null) {
			out.print(new String(fileName.getBytes("8859_1"), "euc-kr"));
			out.println("<br>");
		}
	}
%>