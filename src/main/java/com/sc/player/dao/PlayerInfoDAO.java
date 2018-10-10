package com.sc.player.dao;

import java.sql.SQLException;
import java.util.List;

import com.sc.player.vo.PlayerInfo;

public interface PlayerInfoDAO {
	public List<PlayerInfo> selectPlayerInfoList(PlayerInfo sc) throws SQLException;
	public List<PlayerInfo> selectPlayerInfo(PlayerInfo sc) throws SQLException;
	public int insertPlayerInfo(PlayerInfo sc) throws SQLException;
	public int updatePlayerInfo(PlayerInfo sc) throws SQLException;
	public int deletePlayerInfo(int scnum) throws SQLException;
}
