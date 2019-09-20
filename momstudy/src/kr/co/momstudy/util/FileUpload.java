package kr.co.momstudy.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.FileDAO;
import kr.co.momstudy.repository.vo.FileVO;
import net.coobird.thumbnailator.Thumbnails;

public class FileUpload  {
	private HttpServletRequest req;
	private MultipartRequest request;
	private int groupCode;
	private FileDAO dao;
			
	public FileUpload(HttpServletRequest req ,String type ) throws ServletException, IOException {
		this.req = req;
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(FileDAO.class);
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String filePath = "/" + type + sdf.format(new Date());
		File fi = new File("c:/java/upload" + filePath);
		if(!fi.exists()) {
			fi.mkdirs();
		}

		this.request = new MultipartRequest(req,fi.getPath(), 1024*1024*100 ,"utf-8",
				new MomstudyFileRenamePolicy() 
				);
	}
	
	public MultipartRequest getRequest() {
		return request;
	}


	
	public void upload() throws ServletException, IOException {
		

		Enumeration<String> names = request.getFileNames();
		
		groupCode = dao.selectGroupCode();
		
		while(names.hasMoreElements()) {
			String fName = names.nextElement();
			File f = request.getFile(fName);
			if(f != null) {
				FileVO file = new FileVO();
				file.setGroupCode(groupCode);
				String orgName = request.getOriginalFileName(fName);
				file.setOrgName(orgName);
				String systemName = request.getFilesystemName(fName);
				file.setSystemName(systemName);
				file.setPath(f.getParent());
				Thumbnails.of(new File(f.getParent(),systemName)).forceSize(300, 200).outputFormat("jpg").toFile(new File(f.getParent(),"thumb_" + systemName));
				dao.insertFile(file);
			}
			}	
		}
		
	public int getGroupCode() {
		return groupCode;
	}
		
}
