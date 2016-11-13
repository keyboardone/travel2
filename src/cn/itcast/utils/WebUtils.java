package cn.itcast.utils;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.itcast.domain.Category;
import cn.itcast.domain.Product;
import cn.itcast.service.BusinessService;
import cn.itcast.service.impl.BusinessServiceImpl;

public class WebUtils {
	
	public static <T> T request2Bean(HttpServletRequest request,Class<T> beanClass){
		try{
			
			T bean = beanClass.newInstance();
			Map map = request.getParameterMap();
			BeanUtils.populate(bean, map);
			return bean;
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public static void copyBean(Object src, Object dest) {
		try {
			BeanUtils.copyProperties(dest, src); // beanUtils只支持8种基本数据类型的转换，所以要写一个方法将String转换为date
		} catch (Exception e) {
			throw new RuntimeException(e); // 一律转成运行时异常外抛
		}
	}
	public static Product upload(HttpServletRequest request,String uploadPath){
		try{
			Product product = new Product();
			
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding(request.getCharacterEncoding());
			List<FileItem> list = upload.parseRequest(request);
			for(FileItem item : list){
				if(item.isFormField()){
					String inputName = item.getFieldName();
					String value = item.getString("UTF-8");
					if("category_id".equals(inputName)){
						BusinessService service = new BusinessServiceImpl();
						Category c = service.findCategory(value);
						product.setCategory(c);
					}else{
						BeanUtils.setProperty(product, inputName, value);
					}
				}else{
					String filename = item.getName();
					filename = filename.substring(filename.lastIndexOf("\\")+1);
					String savepath = uploadPath;
					String saveFilename = UUID.randomUUID().toString() + filename;
					
					InputStream in = item.getInputStream();
					FileOutputStream out = new FileOutputStream(savepath + "\\" + saveFilename);
					int len = 0;
					byte buffer[] = new byte[1024];
					while((len=in.read(buffer))>0){
						out.write(buffer,0,len);
					}
					in.close();
					out.close();
					item.delete();
					product.setImage(saveFilename);
				}
			}
			product.setId(UUID.randomUUID().toString());
			return product;
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}
	
}	
