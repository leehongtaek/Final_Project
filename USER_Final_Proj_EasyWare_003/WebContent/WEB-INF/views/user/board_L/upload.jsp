<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,
                 com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
                 java.util.*"%>


���ε� ���� !                    
<%
	MultipartRequest up = null;
	try {
		String path = "C:/Semi-Proj/workspace/USER_Final_Proj_EasyWare_003/WebContent/resources/upload"; // ������ ���丮 (������)
		int size = 10 * 1024 * 1024; // 10�ް����� ���� �Ѿ�� ���ܹ߻�
		up = new MultipartRequest(request, path, size, "euc-kr", new DefaultFileRenamePolicy());
		Enumeration e = up.getFileNames(); // ���� �̸� ��ȯ
		if (e == null) // ������ ���ε� ���� �ʾ�����
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