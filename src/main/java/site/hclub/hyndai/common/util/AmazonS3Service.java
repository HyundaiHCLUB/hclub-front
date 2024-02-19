package site.hclub.hyndai.common.util;

import com.amazonaws.SdkClientException;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import site.hclub.hyndai.config.AmazonS3Config;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AmazonS3Service {

    @Value("${cloud-aws-s3-bucket}")
    private String S3Bucket;

    @Autowired
    private final AmazonS3 amazonS3Client;

    @Autowired
    private final AmazonS3Config config;

    public String uploadImage(String directoryPath, MultipartFile image) throws IOException {
        String filePath = directoryPath+"/";
        String fileName = image.getOriginalFilename();
        String originalName = filePath+ URLEncoder.encode(fileName,"UTF-8");
        ObjectMetadata objectMetaData = new ObjectMetadata();

        objectMetaData.setContentType(image.getContentType());
        objectMetaData.setContentLength(image.getSize());

        amazonS3Client.putObject(
                new PutObjectRequest(S3Bucket, originalName, image.getInputStream(),objectMetaData)
                        .withCannedAcl(CannedAccessControlList.PublicRead)
        );
        return amazonS3Client.getUrl(S3Bucket, originalName).toString();

    }

    public List<String> uploadImages(String directoryPath, List<MultipartFile> multipartFiles) throws IOException {
        String filePath = directoryPath+"/";
        List<String> returnURL = new ArrayList<>();
        for(MultipartFile multipartFile : multipartFiles) {
            String fileName = multipartFile.getOriginalFilename();
            String originalName = filePath+ URLEncoder.encode(fileName,"UTF-8");

            ObjectMetadata objectMetaData = new ObjectMetadata();

            objectMetaData.setContentType(multipartFile.getContentType());
            objectMetaData.setContentLength(multipartFile.getSize());

            amazonS3Client.putObject(
                    new PutObjectRequest(S3Bucket, originalName, multipartFile.getInputStream(),objectMetaData)
                            .withCannedAcl(CannedAccessControlList.PublicRead)
            );

            returnURL.add(amazonS3Client.getUrl(S3Bucket, originalName).toString());
        }

        return returnURL;
    }


    public void deleteImage(String fileName) throws IOException{
        final AmazonS3 s3Client = config.amazonS3Client();

        try {
            s3Client.deleteObject(S3Bucket, fileName);
        } catch (SdkClientException e){
            throw new IOException("이미지 삭제 중 에러 발생", e);
        }
    }


}
