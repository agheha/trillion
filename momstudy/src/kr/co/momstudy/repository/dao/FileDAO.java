package kr.co.momstudy.repository.dao;

import kr.co.momstudy.repository.vo.FileVO;

public interface FileDAO {

	public int selectGroupCode();

	public void insertFile(FileVO file);

	public FileVO selectOneFile(int fno);

}
