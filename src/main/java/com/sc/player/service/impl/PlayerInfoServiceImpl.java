package com.sc.player.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sc.player.dao.PlayerInfoDAO;
import com.sc.player.service.PlayerInfoService;
import com.sc.player.vo.PlayerInfo;

@Service
public class PlayerInfoServiceImpl implements PlayerInfoService{

	@Autowired
	private PlayerInfoDAO pdao;
	
	@Override
	public List<PlayerInfo> getPlayerInfoList(PlayerInfo sc) throws SQLException {
		return pdao.selectPlayerInfoList(sc);
	}

	@Override
	public List<PlayerInfo> getPlayerInfo(PlayerInfo sc) throws SQLException {
		return pdao.selectPlayerInfo(sc);
	}

	@Override
	public int insertPlayerInfo(PlayerInfo sc) throws SQLException {
		return pdao.insertPlayerInfo(sc);
	}

	@Override
	public int updatePlayerInfo(PlayerInfo sc) throws SQLException {
		return pdao.updatePlayerInfo(sc);
	}

	@Override
	public int deletePlayerInfo(int scnum) throws SQLException {
		return pdao.deletePlayerInfo(scnum);
	}

}
