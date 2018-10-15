package com.sc.player.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.sc.player.service.PlayerInfoService;
import com.sc.player.vo.PlayerInfo;

@Controller
public class UploadController extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_PATH = "C:\\jsp_study\\workspace\\sc-player\\src\\main\\webapp\\resources";

	@Autowired
	private PlayerInfoService pis;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	@RequestMapping(value = "/playerinfo/upload", method=RequestMethod.POST)
	public String fileUpload(HttpServletRequest request, HttpServletResponse response, @ModelAttribute PlayerInfo sc) throws Exception {
		System.out.println("vo값 : "+ sc);
	 	request.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");
		System.out.println(request.getContentType());
		MultipartRequest multipartReq = (MultipartRequest) request;
		MultipartFile multipartFile = multipartReq.getFile("multipartFile");

		boolean isMulti = ServletFileUpload.isMultipartContent(request);
		if (!isMulti) {
			throw new ServletException("폼태그 확인요망");
		}
		
		String uploadDir = UPLOAD_PATH + File.separator;
		System.out.println(uploadDir);
		try {
			new File(uploadDir).mkdir();
			String fName =  "/upload/"+System.currentTimeMillis() + multipartFile.getOriginalFilename();
			System.out.println(fName);
			sc.setScpropic(fName);
			multipartFile.transferTo(new File(uploadDir + fName));
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}
		int a = pis.insertPlayerInfo(sc);
		if (a==1) {
			System.out.println("추가 성공");
		}
		return "playerinfo/list";
	}
}
/*
 * protected void doPost(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException {
 * System.out.println(request.getRequestURI()); boolean isMulti =
 * ServletFileUpload.isMultipartContent(request); if (!isMulti) { throw new
 * ServletException("폼태그 확인요망"); } System.out.println("폼태그의 멀티타입 : " + isMulti);
 * String path = System.getProperty("java.io.tmpdir");
 * System.out.println("내 서버의 임시 경로 : " + path); DiskFileItemFactory dfac = new
 * DiskFileItemFactory(); dfac.setRepository(new File(path));
 * dfac.setSizeThreshold(1024 * 1024 * 5); // 5 메가바이트로 지정
 * 
 * ServletFileUpload sfu = new ServletFileUpload(dfac); try { List<FileItem>
 * fList = sfu.parseRequest(request); Map<String, String> param = new
 * HashMap<String, String>(); for (FileItem fi : fList) { if (!fi.isFormField())
 * { param.put(fi.getFieldName(), fi.getName()); File sFile = new
 * File(UPLOAD_PATH + File.separator + fi.getName()); fi.write(sFile); } else {
 * param.put(fi.getFieldName(), fi.getString("utf-8")); } } String realPath =
 * request.getRealPath("/upLoad"); System.out.println("실제 경로: " + realPath);
 * System.out.println(param); } catch (Exception e) {
 * 
 * } doGet(request, response); }
 */
