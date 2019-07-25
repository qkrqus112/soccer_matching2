package com.soccermatching.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soccermatching.dao.MatchBoardDAO;
import com.soccermatching.dao.MemberDAO;
import com.soccermatching.dto.MatchBoardDTO;
import com.soccermatching.dto.MemberDTO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private MatchBoardDAO matchBoardDAO;

	private List<MemberDTO> getAll() {
		return memberDAO.readAll();
	}

	private List<MatchBoardDTO> get1All() {
		return matchBoardDAO.readAll();
	}
	

	@GetMapping
	public String get(Model model) {
		model.addAttribute("memberDTOList", getAll());
		model.addAttribute("matchDTOList", get1All());
		return "admin";
	}
}
