package site.hclub.hyndai.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import site.hclub.hyndai.domain.club.Club;

import javax.sql.DataSource;

@Configuration
@MapperScan(value = "site.hclub.hyndai.mapper")
@PropertySource("classpath:application.yml")
public class DataConfig {

    @Value("${driver-class-name}")
    private String driverClassName;
    @Value("${jdbc-url}")
    private String jdbcUrl;
    @Value("${user-name}")
    private String userName;
    @Value("${password}")
    private String password;


    @Bean
    public SqlSessionTemplate sqlSessionTemplate() throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory(dataSource()));
    }

    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
        sessionFactoryBean.setDataSource(dataSource);

        // Register type aliases
        org.apache.ibatis.session.Configuration configuration = new org.apache.ibatis.session.Configuration();
        configuration.getTypeAliasRegistry().registerAlias("club", site.hclub.hyndai.domain.club.Club.class);
        configuration.getTypeAliasRegistry().registerAlias("memberClub", site.hclub.hyndai.domain.club.MemberClub.class);
        configuration.getTypeAliasRegistry().registerAlias("clubNotice", site.hclub.hyndai.domain.club.ClubNotice.class);
        configuration.getTypeAliasRegistry().registerAlias("clubHistory", site.hclub.hyndai.domain.club.ClubHistory.class);
        configuration.getTypeAliasRegistry().registerAlias("clubLike", site.hclub.hyndai.domain.club.ClubLike.class);


        configuration.getTypeAliasRegistry().registerAlias("clubCreateRequest", site.hclub.hyndai.dto.request.ClubCreateRequest.class);
        configuration.getTypeAliasRegistry().registerAlias("memberClubCreateRequest", site.hclub.hyndai.dto.request.MemberClubCreateRequest.class);
        configuration.getTypeAliasRegistry().registerAlias("clubUpdateRequest", site.hclub.hyndai.dto.request.ClubUpdateRequest.class);
        configuration.getTypeAliasRegistry().registerAlias("noticeCreateRequest", site.hclub.hyndai.dto.request.NoticeCreateRequest.class);
        configuration.getTypeAliasRegistry().registerAlias("likeRequest", site.hclub.hyndai.dto.request.LikeRequest.class);

        configuration.getTypeAliasRegistry().registerAlias("clubHistoryGetResponse", site.hclub.hyndai.dto.response.ClubHistoryGetResponse.class);
        configuration.getTypeAliasRegistry().registerAlias("clubLikeResponse", site.hclub.hyndai.dto.response.ClubLikeResponse.class);


        sessionFactoryBean.setConfiguration(configuration);

        Resource[] resources = new PathMatchingResourcePatternResolver()
                .getResources("classpath:mapper/*.xml");
        sessionFactoryBean.setMapperLocations(resources);
        return sessionFactoryBean.getObject();
    }

    @Bean
    public PlatformTransactionManager transactionManager(DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    @Bean
    public BasicDataSource dataSource() {
        BasicDataSource basicDataSource = new BasicDataSource();
        basicDataSource.setDriverClassName(driverClassName);
        basicDataSource.setUrl(jdbcUrl);
        basicDataSource.setUsername(userName);
        basicDataSource.setPassword(password);
        return basicDataSource;
    }
}
