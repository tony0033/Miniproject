package bean;

import java.sql.*;
import java.util.ArrayList;

import bean.VoteDTO;
import bean.DBConnectionMgr;

public class VoteDAO {
	DBConnectionMgr pool;
	Connection con;
	PreparedStatement ps ;
	ResultSet rs;
	public VoteDAO() {
		pool= DBConnectionMgr.getInstance();	
	}
	public VoteDTO select(String voteId) throws Exception {
		con = pool.getConnection();
		String sql = "select * from vote where voteId =?";
		ps = con.prepareStatement(sql);
		ps.setString(1,voteId);
		 rs = ps.executeQuery();
		 VoteDTO dto =null ;
		 while(rs.next()){
				dto = new VoteDTO();
				dto.setVoteId(rs.getString(1));
				dto.setVoteName(rs.getString(2));
				dto.setVoteContent(rs.getString(3));
				dto.setVoteDate(rs.getString(4));
			}
		 pool.freeConnection(con, ps);
		 return dto;
	}
	public ArrayList selectAll() throws Exception {
		ArrayList list = new ArrayList();
		con = pool.getConnection();
		String sql = "select * from vote";
		ps = con.prepareStatement(sql);
		 rs = ps.executeQuery();
		 VoteDTO dto =null ;
		 while(rs.next()){
				dto = new VoteDTO();
				dto.setVoteId(rs.getString(1));
				dto.setVoteName(rs.getString(2));
				dto.setVoteContent(rs.getString(3));
				dto.setVoteDate(rs.getString(4));
				list.add(dto);
			}
		 pool.freeConnection(con, ps);
		 return list;
	}
	
	public void insert(VoteDTO dto) throws Exception {
		con = pool.getConnection();
		String sql = "insert into vote values (?,?,?,?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getVoteId());
		ps.setString(2, dto.getVoteName());
		ps.setString(3, dto.getVoteContent());
		ps.setString(4, dto.getVoteDate());
		ps.executeUpdate();
		pool.freeConnection(con, ps);
	}
	public void delete(String id ) throws Exception {
		con = pool.getConnection();
		String sql = "delete from vote where voteId = ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.executeUpdate();
		pool.freeConnection(con, ps);
	}
	public void updateAll(VoteDTO dto) throws Exception {
		con = pool.getConnection();
		String sql = "update vote set voteName=?,voteContent=?,voteDate = ? where voteId = ?";
		ps = con.prepareStatement(sql);
		ps.setString(4, dto.getVoteId());
		ps.setString(1, dto.getVoteName());
		ps.setString(2, dto.getVoteContent());
		ps.setString(3, dto.getVoteDate());
		ps.executeUpdate();
		pool.freeConnection(con, ps);
	}
	public void update(VoteDTO dto ,String s) throws Exception {
		con = pool.getConnection();
		String sql = "update vote set " + s +" = ? where voteId = ?";
		ps = con.prepareStatement(sql);
		ps.setString(2, dto.getVoteId());
		ps.setString(1, dto.getVoteName());
		ps.executeUpdate();
		pool.freeConnection(con, ps);
	}
	
}
