package com.sc.player.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.player.service.PlayerInfoService;
import com.sc.player.vo.PlayerInfo;

@Controller
public class PlayerInfoController {

	@Autowired
	private PlayerInfoService pis;
	
	@RequestMapping(value="/playerinfo", method=RequestMethod.GET)
	public @ResponseBody List<PlayerInfo> getPlayerInfoList(@ModelAttribute PlayerInfo sc) throws SQLException {
		return pis.getPlayerInfoList(sc);
	}
	
	@RequestMapping(value="/playerinfo/{scname}",method=RequestMethod.GET)
	public String getLevelInfo(
			 @ModelAttribute PlayerInfo sc,
			Model m) throws SQLException {
		m.addAttribute("piList", pis.getPlayerInfo(sc));
		return "playerinfo/list";
	}
}
