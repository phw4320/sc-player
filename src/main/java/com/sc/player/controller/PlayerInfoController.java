package com.sc.player.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.player.service.PlayerInfoService;
import com.sc.player.vo.PlayerInfo;

@Controller
public class PlayerInfoController {

	
	private static final String UPLOAD_PATH = "C:\\jsp_study\\workspace\\sc-player\\src\\main\\webapp\\resources";
	
	@Autowired
	private PlayerInfoService pis;

	@RequestMapping(value = "/playerinfo", method = RequestMethod.GET)
	public @ResponseBody List<PlayerInfo> getPlayerInfoList(@ModelAttribute PlayerInfo sc) throws SQLException {
		return pis.getPlayerInfoList(sc);
	}

	/*
	 * @RequestMapping(value="/playerinfo/{scname}",method=RequestMethod.GET) public
	 * String getLevelInfo(
	 * 
	 * @ModelAttribute PlayerInfo sc, Model m) throws SQLException {
	 * m.addAttribute("piList", pis.getPlayerInfo(sc)); return "playerinfo/list"; }
	 */

	@RequestMapping(value = "/playerinfo/{scnum}", method = RequestMethod.GET)
	public @ResponseBody List<PlayerInfo> getLevelInfo(@ModelAttribute PlayerInfo sc) throws SQLException {

		return pis.getPlayerInfo(sc);
	}

	@RequestMapping(value = "/playerinfo/view/{scnum}", method = RequestMethod.GET)
	public @ResponseBody List<PlayerInfo> getLevelInfo2(@RequestBody PlayerInfo sc) throws SQLException {
		System.out.println("scnum의 값 :" + sc.getScnum());
		return pis.getPlayerInfo(sc);
	}

	@RequestMapping(value = "/playerinfo/{scnum}", method = RequestMethod.PUT)
	@ResponseBody
	public Integer updatePlayerInfoList(@RequestBody PlayerInfo sc, @PathVariable Integer scnum) throws SQLException {
		System.out.println(sc);
		sc.setScnum(scnum);

		return pis.updatePlayerInfo(sc);
	}

	@RequestMapping(value = "/playerinfo/{scnum}", method = RequestMethod.DELETE)
	@ResponseBody
	public Integer deleteLevelInfoList(@RequestBody PlayerInfo sc,
			@PathVariable Integer scnum) throws SQLException {
		String path = UPLOAD_PATH + sc.getScpropic();
		System.out.println(path);
		File file = new File(path);
		if(file.exists() == true){
			file.delete();
		}
		return pis.deletePlayerInfo(scnum);
	}

}
