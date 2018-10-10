package com.sc.player.service;

import java.sql.SQLException;
import java.util.List;

import com.sc.player.vo.PlayerInfo;

public interface PlayerInfoService {
	public List<PlayerInfo> getPlayerInfoList(PlayerInfo sc) throws SQLException;
	public List<PlayerInfo> getPlayerInfo(PlayerInfo sc) throws SQLException;
	public int insertPlayerInfo(PlayerInfo sc) throws SQLException;
	public int updatePlayerInfo(PlayerInfo sc) throws SQLException;
	public int deletePlayerInfo(int scnum) throws SQLException;
}
