package com.member.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.member.model.MemberService;
import com.member.model.MemberVo;

//@WebServlet("/MemberServlet")
@MultipartConfig
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

// ##################################(刪除)############################################
		if (action.equals("delete")) { // 來自listAllEmp.jsp
//			System.out.println("刪除");
			List<String> errorMsgs = new ArrayList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			String url = "/member/listAllEmp.jsp";
			try {
				/*************************** 1.接收請求參數 ***************************************/
				String mem_no = req.getParameter("mem_no");

				/*************************** 2.開始刪除資料 ***************************************/
				MemberService memberSvc = new MemberService();
				memberSvc.deleteMem_no(mem_no);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/

				RequestDispatcher sucessView = req.getRequestDispatcher(url);
				sucessView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗: " + e);
				RequestDispatcher faileView = req.getRequestDispatcher(url);
				faileView.forward(req, res);
			}
		}
// ##################################(修改)############################################
		if (action.equals("getOne_For_Update")) {
//			System.out.println("修改");
			List<String> errorMsgs = new ArrayList<>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				String mem_no = req.getParameter("mem_no");

				/*************************** 2.開始查詢資料 ****************************************/
				MemberService memberSvc = new MemberService();
				MemberVo memberVo = memberSvc.getOneMem_no(mem_no.toUpperCase());

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("memberVo", memberVo);
				String url = "/member/update_emp_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/member/listAllEmp.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) {
//			System.out.println("確認修改");

			List<String> errorMsgs = new ArrayList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			
		

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String mem_no = req.getParameter("mem_no");
				
				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				String mem_name = req.getParameter("mem_name");
				if (mem_name == null || mem_name.trim().length() == 0) {
					errorMsgs.add("會員姓名: 請勿空白");
				} else if (!mem_name.trim().matches(enameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

				String mem_account = req.getParameter("mem_account");
				if (mem_account == null || mem_account.trim().length() == 0) {
					errorMsgs.add("帳號請勿空白");
				}

				String mem_pwd = req.getParameter("mem_pwd");
				if (mem_pwd == null || mem_pwd.trim().length() == 0) {
					errorMsgs.add("密碼請勿空白");
				}

				String mem_gender = req.getParameter("mem_gender");
				if (mem_gender == null) {
					errorMsgs.add("請填寫性別空白");
				}

				String mem_mail = req.getParameter("mem_mail");

//				String regex = "^\\w{1,63}@[a-zA-Z0-9]{2,63}\\.[a-zA-Z]{2,63}(\\.[a-zA-Z]{2,63})?$";
				if (mem_mail == null || mem_mail.trim().length() == 0) {
					errorMsgs.add("信箱請勿空白");
				} 
//				else if (!mem_mail.trim().matches(regex)) {
//					errorMsgs.add("信箱格式有誤!!");
//				}

				String pattern2 = "^[a-zA-Z]{1}[0-9]{9}$";
				String mem_id = req.getParameter("mem_id");
				if (mem_id == null) {
					errorMsgs.add("身分證請勿空白");
				} else if (!mem_id.trim().matches(pattern2)) {
					errorMsgs.add("身分證格式有誤!!");
				}

				String mem_tel = req.getParameter("mem_tel");
				if (mem_tel == null) {
					errorMsgs.add("電話請勿空白");
				} else if ((mem_tel.trim().length()) > 10) {
					errorMsgs.add("電話請輸入10碼");
				}

				String mem_status = req.getParameter("mem_status");

				Double mem_balance = 0.0;
				mem_balance = mem_balance.parseDouble(req.getParameter("mem_balance"));

				String mem_nickname = req.getParameter("mem_nickname");
				if (mem_nickname == null) {
					errorMsgs.add("綽號請勿空白");
				} else if ((mem_nickname.trim().length()) > 16) {
					errorMsgs.add("綽號長度過長");
				}

				// 圖片
				Part p = req.getPart("mem_pic");
				InputStream in = null;
				byte[] mem_pic = null;
				in = p.getInputStream();
				mem_pic = new byte[in.available()];
				in.read(mem_pic);
				in.close();

				MemberVo memVO = new MemberVo();
				memVO.setMem_no(mem_no);
				memVO.setMem_name(mem_name);
				memVO.setMem_account(mem_account);
				memVO.setMem_pwd(mem_pwd);
				memVO.setMem_gender(mem_gender);
				memVO.setMem_mail(mem_mail);
				memVO.setMem_id(mem_id);
				memVO.setMem_tel(mem_tel);
				memVO.setMem_status(mem_status);
				memVO.setMem_balance(mem_balance);
				memVO.setMem_nickname(mem_nickname);
				// 圖片
				memVO.setMem_pic(mem_pic);
//				System.out.println(memVO);

				if (!errorMsgs.isEmpty()) {
//					System.out.println("輸入格式錯誤");
					req.setAttribute("memberVo", memVO); // 含有輸入格式錯誤的memVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/member/update_emp_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
				/***************************2.開始修改資料*****************************************/
				MemberService memberSvc = new MemberService();
				MemberVo memberVo = memberSvc.updateMem_no(memVO);
				
			
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("memberVo", memberVo);
				String sucessurl = "/member/listOneEmp.jsp";
				(req.getRequestDispatcher(sucessurl)).forward(req, res);

			} 
			catch (Exception e) {
//				System.out.println("catch");
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/member/update_emp_input.jsp");
				failureView.forward(req, res);
			}
		}

// ##################################(單筆查詢)############################################
		if (action.equals("getOne_For_Display")) {
//			System.out.println("單筆查詢");

			// 查詢成功頁面
			String sucessurl = "/member/listOneEmp.jsp";
			// 錯誤頁面返回原頁面
			String faileurl = "/member/select_page.jsp";
			List<String> errorMsgs = new ArrayList<>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				String mem_no = req.getParameter("mem_no");
				if (mem_no == null || mem_no.trim().length() <= 0) {
					errorMsgs.add("請輸入會員編號");
					req.getRequestDispatcher(faileurl).forward(req, res);
					return;
				}

				String pattern = "^[Mm]{1}[0-9]{6}$";
				if (!mem_no.matches(pattern)) {
					errorMsgs.add("輸入格式錯誤");
					req.getRequestDispatcher(faileurl).forward(req, res);
					return;
				}
				/*************************** 2.開始查詢資料 *****************************************/
				MemberService memberSvc = new MemberService();
				MemberVo memberVo = memberSvc.getOneMem_no(mem_no.toUpperCase());
				if (memberVo == null) {
					errorMsgs.add("查無資料");
					req.getRequestDispatcher(faileurl).forward(req, res);
					return;
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("memberVo", memberVo);
				(req.getRequestDispatcher(sucessurl)).forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取的資料:");
				(req.getRequestDispatcher(faileurl)).forward(req, res);
				return;
			}

		}

// ##################################(新增)############################################
		if (action.equals("insert")) {
//			System.out.println("新增");

			List<String> errorMsgs = new ArrayList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//				String ename = req.getParameter("ename");
				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";

				String mem_name = req.getParameter("mem_name");
				if (mem_name == null || mem_name.trim().length() == 0) {
					errorMsgs.add("會員姓名: 請勿空白");
				} else if (!mem_name.trim().matches(enameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

				String mem_account = req.getParameter("mem_account");
				if (mem_account == null || mem_account.trim().length() == 0) {
					errorMsgs.add("帳號請勿空白");
				}

				String mem_pwd = req.getParameter("mem_pwd");
				if (mem_pwd == null || mem_pwd.trim().length() == 0) {
					errorMsgs.add("密碼請勿空白");
				}

				String mem_gender = req.getParameter("mem_gender");
				if (mem_gender == null) {
					errorMsgs.add("請填寫性別空白");
				}

				String mem_mail = req.getParameter("mem_mail");

//				String regex = "^\\w{1,63}@[a-zA-Z0-9]{2,63}\\.[a-zA-Z]{2,63}(\\.[a-zA-Z]{2,63})?$";
				if (mem_mail == null || mem_mail.trim().length() == 0) {
					errorMsgs.add("信箱請勿空白");
				} 
//				else if (!mem_mail.trim().matches(regex)) {
//					errorMsgs.add("信箱格式有誤!!");
//				}

				String pattern2 = "^[a-zA-Z]{1}[0-9]{9}$";
				String mem_id = req.getParameter("mem_id");
				if (mem_id == null) {
					errorMsgs.add("身分證請勿空白");
				} else if (!mem_id.trim().matches(pattern2)) {
					errorMsgs.add("身分證格式有誤!!");
				}

				String mem_tel = req.getParameter("mem_tel");
				if (mem_tel == null) {
					errorMsgs.add("電話請勿空白");
				} else if ((mem_tel.trim().length()) > 10) {
					errorMsgs.add("電話請輸入10碼");
				}

				String mem_status = req.getParameter("mem_status");

				Double mem_balance = 0.0;
				mem_balance = mem_balance.parseDouble(req.getParameter("mem_balance"));

				String mem_nickname = req.getParameter("mem_nickname");
				if (mem_nickname == null) {
					errorMsgs.add("綽號請勿空白");
				} else if ((mem_nickname.trim().length()) > 16) {
					errorMsgs.add("綽號長度過長");
				}

				// 圖片
				Part p = req.getPart("mem_pic");
				InputStream in = null;
				byte[] mem_pic = null;
				in = p.getInputStream();
				mem_pic = new byte[in.available()];
				in.read(mem_pic);
				in.close();

				MemberVo memVO = new MemberVo();
				memVO.setMem_name(mem_name);
				memVO.setMem_account(mem_account);
				memVO.setMem_pwd(mem_pwd);
				memVO.setMem_gender(mem_gender);
				memVO.setMem_mail(mem_mail);
				memVO.setMem_id(mem_id);
				memVO.setMem_tel(mem_tel);
				memVO.setMem_status(mem_status);
				memVO.setMem_balance(mem_balance);
				memVO.setMem_nickname(mem_nickname);
				// 圖片
				memVO.setMem_pic(mem_pic);
//				System.out.println(memVO);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memVO", memVO); // 含有輸入格式錯誤的memVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/member/addEmp.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
				/*************************** 2.開始修改資料 *****************************************/
				MemberService memberSvc = new MemberService();
				memVO = memberSvc.add(mem_name, mem_account, mem_pwd, mem_gender, mem_mail, mem_id, mem_tel, mem_status,
						mem_balance, mem_nickname, mem_pic);
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/

				req.setAttribute("memVO", memVO);
				req.getRequestDispatcher("/member/listAllEmp.jsp").forward(req, res);
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/member/addEmp.jsp");
				failureView.forward(req, res);
			}
		}
	}

//	public static void main(String[] args) {
////		String pattern = "^[A-Za-z]{1}[0-9]{7}$";
////		String str = "M0000001";
////
////		if (str.matches(pattern)) {
////			System.out.println("y");
////			return;
////		}
////		System.out.println("e");
//
//		System.currentTimeMillis();
//		System.out.println(new Date(System.currentTimeMillis()));
//
//	}
}
