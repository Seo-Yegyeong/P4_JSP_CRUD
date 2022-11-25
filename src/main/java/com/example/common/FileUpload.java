package com.example.common;


import com.example.bean.BoardVO;
import com.example.dao.BoardDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

public class FileUpload {
    public BoardVO uploadPhoto(HttpServletRequest request){ //It must be in javax.servlet.http, not jakarta.servlet.http
        String filename = "";
        int sizeLimit = 15 * 1024 * 1024;

        String realPath = request.getServletContext().getRealPath("upload");

        File dir = new  File(realPath);
        if(!dir.exists()) dir.mkdirs(); //만약에 폴더가 없다면 생성하도록

        BoardVO one = null;
        MultipartRequest multipartRequest = null;

        try{
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
            filename = multipartRequest.getFilesystemName("photo");

            one = new BoardVO();
            String seq = multipartRequest.getParameter("seq"); // 폼에 전송된 원래의 sid.
            if(seq!=null && !seq.equals("")){
                one.setSeq(Integer.parseInt(seq));
            }
            one.setCategory(multipartRequest.getParameter("category"));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setContent(multipartRequest.getParameter("content"));
            long currentTimeMillis = System.currentTimeMillis();
            Timestamp time = new Timestamp(currentTimeMillis);
            one.setModidate(time);

            if(seq!=null && !seq.equals("")){
                BoardDAO dao = new BoardDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(seq));
                if(filename!=null && oldfilename!=null)
                    FileUpload.deleteFile(request, oldfilename);
                else if(filename==null && oldfilename!=null)
                    filename = oldfilename;
            }
            one.setPhoto(filename);
        }
        catch (IOException e){
            e.printStackTrace();
        }
        return one;
    }

    public static void deleteFile(HttpServletRequest request, String filename){
        String filepath = request.getServletContext().getRealPath("upload");

        File f = new File(filepath + "/" + filename); //파일 경로를 찾아서 파일을 지워라.
        if(f.exists()) f.delete();
    }
}
