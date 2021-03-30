# QuestionsSystem-Web
在线试题库系统，能够自动生成试卷并且打分。

该项目分成三种用户，老师和学生使用web端，即本项目，[管理员使用widows端](https://github.com/black-six/QuestionsSystem-Windows)
登陆使用，两个项目数据库互通。

本项目使用了poi工具进行word文档的生成。代码在WebContent->jsp->student->CreateTestPaper.jsp下，
我以前居然把生成试卷的代码写在了JSP页面里......

另一个有价值之处就是生成验证码的代码，在src->servlet->yzm.java中，请求这个servlet即会返回一张图片，
也就是验证码。而具体的生成验证码类在util->ImageUtils.java中，它会把图片输出到response
的输出流中，同时会将正确的验证码字符串放进request域中。

# Database
本项目使用MySQL数据库，数据库名为questions_manag，在MySQL中创建同名数据库并将数据(questions_manag.sql)导入后即可。

项目中数据库配置在src->SQL->MySQLLink.java文件中，默认URL为localhost，默认端口为3306，默认账号密码都是root，请根据自身环境进行更改！

# Run
需要安装Apache Tomcat，理论上Tomcat7、8、9应该都可以，建议使用7，因为当时编写时用的就是Tomcat7。

需要使用到的库都在WebContent/WEB-INF/lib中，除了Tomcat提供的jar库。

# Other
该项目是java web项目，使用eclipse编写，使用JSP和Servlet技术，由于是我早期作品，前端和后台使用的技术都比较老。

# License
License by [MIT License](https://github.com/black-six/QuestionsSystem-Web/blob/main/LICENSE) 
