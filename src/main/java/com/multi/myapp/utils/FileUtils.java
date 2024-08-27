package com.multi.myapp.utils;

import com.multi.myapp.vo.ImageVO;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Component
public class FileUtils {

    private final String uploadPath = Paths.get("D:", "Spring", "final_project", "src", "main", "webapp", "store").toString();
    public List<ImageVO> uploadFiles(List<MultipartFile> multipartFileList) {
        return multipartFileList.stream()
                .filter(multipartFile -> !multipartFile.isEmpty())
                .map(this::uploadFile)
                .collect(Collectors.toList());
    }

    public ImageVO uploadFile(MultipartFile multipartFile) {
        if (multipartFile.isEmpty()) {
            return null;
        }

        String saveName = generateSaveFilename(multipartFile.getOriginalFilename());
        String uploadPath = getUploadPath() + File.separator + saveName;
        File uploadFile = new File(uploadPath);

        try {
            multipartFile.transferTo(uploadFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return ImageVO.builder()
                .uploadfilename(multipartFile.getOriginalFilename())
                .storefilename(saveName)
                .build();
    }

    private String generateSaveFilename(String filename) {
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        String extension = StringUtils.getFilenameExtension(filename);
        return uuid + "." + extension;
    }

    private String getUploadPath() {
        return makeDirectories(uploadPath);
    }

    private String getUploadPath(final String addPath) {
        return makeDirectories(uploadPath + File.separator + addPath);
    }

    private String makeDirectories(String path) {
        File dir = new File(path);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        return dir.getPath();
    }

}
