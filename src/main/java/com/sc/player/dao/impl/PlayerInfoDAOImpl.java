package com.sc.player.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sc.player.dao.PlayerInfoDAO;
import com.sc.player.vo.PlayerInfo;

@Repository
public class PlayerInfoDAOImpl implements PlayerInfoDAO {

	@Autowired
	private SqlSession ss;
	
	@Override
	public List<PlayerInfo> selectPlayerInfoList(PlayerInfo sc) throws SQLException {
		return ss.selectList("SQL.SC_PLAYER.selectPlayerInfo",sc);
	}

	@Override
	public List<PlayerInfo> selectPlayerInfo(PlayerInfo sc) throws SQLException {
		return ss.selectList("SQL.SC_PLAYER.getPlayerInfo",sc);
	}

	@Override
	public int insertPlayerInfo(PlayerInfo sc) throws SQLException {
		return ss.insert("SQL.SC_PLAYER.insertPlayerInfo", sc);
	}

	@Override
	public int updatePlayerInfo(PlayerInfo sc) throws SQLException {
		return ss.update("SQL.SC_PLAYER.updatePlayerInfo", sc);
	}

	@Override
	public int deletePlayerInfo(int scnum) throws SQLException {
		return ss.delete("SQL.SC_PLAYER.deletePlayerInfo", scnum);
	}


}
