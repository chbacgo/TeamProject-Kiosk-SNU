<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hongsuji
  Date: 2023/07/12
  Time: 11:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=deevice-width, initial-scale=1,minimum-scale=1,maxmun-scale=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="<c:url value="/css/inside/inside_notice.css"/>">
        
        <link href="https://cdn.jsdelivr.net/gh/sunn-us/SUITE/fonts/static/woff2/SUITE.css" rel="stylesheet">

<style>
    body {font-family: 'SUITE', sans-serif;}
</style>
        <title>snu_notice_page</title>
    </head>
        <body>
            <div id="body">
                <a href="<c:url value="/inside/notice"/>"><img src="<c:url value="/img/inside/beforBtn.png"/>" alt=""></a>

                <section id="allWrap"><!--전체 감싸는 박스-->
                    <p id="title">공지사항</p>
                    <hr>
                    <div id="tableWrap">
                        <table>
                            <div id="trTitle">
                                <div id="noticeTitle">${notice.title}</div><div id="writer"><span>작성자:</span>관리자</div><div id="date" style="font-size: 15px; margin-left: 20px"><span>등록일:</span>${notice.dateTime}</div>
                            </div>
                            <div id="content">
                                <p>${notice.content}</p>
                            </div>
                        </table>
                    </div>
                </section>
            </div>
        </body>
    
 </html>