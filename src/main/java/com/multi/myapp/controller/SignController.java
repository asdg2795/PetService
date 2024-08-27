package com.multi.myapp.controller;

import java.util.HashMap;  
import java.util.Map;
import java.util.Random;

import javax.activation.CommandMap;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.multi.myapp.service.SignService;
import com.multi.myapp.vo.SignVO;

@Controller
@RequestMapping("/sign")
public class SignController {
	@Autowired
	SignService service;
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping("/check")
	public String SignCheckPage() {
		return "sign/check";
	}
	
	@GetMapping("/signForm")
	public String SignInfoPage() {
		return "sign/signForm";
	}
	@GetMapping("/sign3")
	public String Sign3() {
		return "sign/sign3";
	}
	@GetMapping("/idCheck")
	public ModelAndView idCheck(String userid) {
		
		int result = service.idCheck(userid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.addObject("userid",userid);
		mav.setViewName("sign/idCheck");
		
		return mav;
	}
	
	@PostMapping("/userFormOk")
	public ModelAndView userFormOk(SignVO vo) {
		ModelAndView mav = new ModelAndView();
		
		try {
			int result = service.usersInsert(vo);
			
			if(result>0) {
				mav.setViewName("redirect:sign3");
			}else {
				mav.setViewName("sign/signFormResult");
			}
		}catch(Exception e) {
			e.printStackTrace();
			mav.setViewName("sign/signFormResult");
		}
		return mav;
	}
	
	@GetMapping("/login")
	public String login() {
		return "sign/login";
	}
	@PostMapping("/loginOk")
	public ModelAndView loginOk(String userid, String userpwd, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		SignVO logVO = service.loginSelect(userid,userpwd);
		
		if(logVO != null) {
			session.setAttribute("logId", logVO.getUserid());
			session.setAttribute("logName", logVO.getUsername());
			session.setAttribute("logStatus", "Y");
			
			mav.setViewName("redirect:/");
		}else {
			mav.setViewName("redirect:login");
		}
		return mav;
	}
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	@GetMapping("/findId")
	public String FindId(SignVO vo, Model model) {
		
		SignVO findVO = service.findIdSelect(vo);
		if(findVO == null) {
			model.addAttribute("check", 1);
		}else {
			model.addAttribute("check", 0);
			model.addAttribute("id",findVO.getUserid());
		}
		return "sign/findId";
		
	}

	@GetMapping("/findId2")
	public String FindId2(Model model, SignVO vo) {

		System.out.println(vo.getUsername());
		System.out.println(vo.getEmail());
		SignVO svo = service.findId(vo);
		model.addAttribute("svo", svo);
		return "sign/findId2";
	}
	@GetMapping("/findPwd")
	public String FindPwd() {
		return "sign/findPwd";
	}
	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{
		Random random = new Random();
		
		int checkNum = random.nextInt(888888)+111111;
		
		String setFrom = "asdg2795@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일입니다.";
		String content = "TEOTS비밀번호 찾기 인증번호입니다. "+"<br><br>"+"인증번호는 "+checkNum+"입니다."+"<br>"
						+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		return num;
	}
	@GetMapping("/findPwd2")
	public String FindPwd2(Model model, SignVO vo) {
		
		SignVO svo = service.findPwd(vo);
		model.addAttribute("svo",svo);
		
		return "sign/findPwd2";
	}
	
	
	@GetMapping("/findPwd3")
	public ModelAndView FindPwd3(SignVO vo) {
	
		int result = service.pwdUpdate(vo);
		ModelAndView mav = new ModelAndView();

		if(result>0) {
			mav.setViewName("sign/findPwd3");
		}else {
			mav.addObject("msg", "변경");
			mav.setViewName("sign/pwdResult");
		}
		
		return mav;		
	}
}
