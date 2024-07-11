package com.nongnghiepxanh.util;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.nongnghiepxanh.constant.Constant;

public class FileUploadUtil {

    public static String saveFile(MultipartFile multipartFile) throws IOException {
        // Đường dẫn thư mục lưu file
        String uploadDir = Constant.FILE_PATH;

        File uploadDirFile = new File(uploadDir);

        // Tạo thư mục nếu nó chưa tồn tại
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs();
        }

        // Tạo tên file duy nhất bằng UUID
        String fileExtension = getFileExtension(multipartFile.getOriginalFilename());
        String uniqueFileName = UUID.randomUUID().toString() + fileExtension;
        

        // Đường dẫn của file được lưu
        String filePath = uploadDir + File.separator + uniqueFileName;

        // Lưu file
        File file = new File(filePath);
        multipartFile.transferTo(file);
         
        return uniqueFileName;
    }

    // Hàm để lấy phần mở rộng của file
    private static String getFileExtension(String fileName) {
        if (fileName == null || fileName.lastIndexOf(".") == -1) {
            return "";
        }
        return fileName.substring(fileName.lastIndexOf("."));
    }
}
