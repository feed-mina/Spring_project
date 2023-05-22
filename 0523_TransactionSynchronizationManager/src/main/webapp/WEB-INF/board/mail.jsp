<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
  <h4>메일 보내기</h4>
    <form action="mailSending.do" method="post">
      <div>
        <input type="text" name="tomail" size="120"
        style="width: 100%" placeholder="상대의 이메일"
        class="form-control">
      </div>
      <div align="center">
        <!-- 제목 -->
        <input type="text" name="title" size="120"
        style="width: 100%" placeholder="제목을 입력해주세요"
        class="form-control">
      </div>
        <p>
          <div align="center">
          <!-- 내용 -->
            <textarea name="content" cols="120" rows="12"
            style="width: 100%; resize: none" placeholder="내용#"
            class="form-control"></textarea>
          </div>
        <p>
      <div align="center">
        <input type="submit" value="메일 보내기" class="btn btn-warning">
      </div>
    </form>
</body>
</html>