package com.sc.player.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	/*@RequestMapping(value="/playerinfo/{scname}",method=RequestMethod.GET)
	public String getLevelInfo(
			 @ModelAttribute PlayerInfo sc,
			Model m) throws SQLException {
		m.addAttribute("piList", pis.getPlayerInfo(sc));
		return "playerinfo/list";
	} */
	
	
	@RequestMapping(value="/playerinfo/{scnum}",method=RequestMethod.GET)
	public @ResponseBody List<PlayerInfo> getLevelInfo(@RequestBody PlayerInfo sc) throws SQLException {
		return pis.getPlayerInfo(sc);
	}
		
	
	@RequestMapping(value="/playerinfo/view/{scnum}",method=RequestMethod.GET)
	public @ResponseBody List<PlayerInfo> getLevelInfo2(@RequestBody PlayerInfo sc) throws SQLException {
		System.out.println("scnum의 값 :" + sc.getScnum());
		return pis.getPlayerInfo(sc);
	}
	/*
	@RequestMapping(value="/levelinfo/{linum}",method=RequestMethod.PUT)
	@ResponseBody 
	public Integer updateLevelInfoList(@RequestBody LevelInfo li, @PathVariable Integer linum) throws SQLException {
		System.out.println(li);
		ObjectMapper m = new ObjectMapper();
		m.readValue(src, valueType)
		li.setLinum(linum);
		
		return lis.updateLevelInfo(li);
	}
	

	@RequestMapping(value="/levelinfo/{linum}",method=RequestMethod.DELETE)
	@ResponseBody 
	public String deleteLevelInfoList(
			@PathVariable int linum) throws SQLException {

		return lis.deleteLevelInfo(linum)+""; 
	}
	*/
}
