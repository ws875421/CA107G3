package com.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberService;
import com.member.model.MemberVo;

//@WebServlet("/MemberServlet")
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
			System.out.println("刪除");
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
			System.out.println("修改");

		}

// ##################################(單筆查詢)############################################
		if (action.equals("getOne_For_Display")) {
			System.out.println("單筆查詢");

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

	}

	public static void main(String[] args) {
//		String pattern = "^[A-Za-z]{1}[0-9]{7}$";
//		String str = "M0000001";
//
//		if (str.matches(pattern)) {
//			System.out.println("y");
//			return;
//		}
//		System.out.println("e");
		
		System.currentTimeMillis();
		System.out.println(new Date(System.currentTimeMillis()));
		
		
		

	}
}
