<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
  <h4>���� ������</h4>
    <form action="mailSending.do" method="post">
      <div>
        <input type="text" name="tomail" size="120"
        style="width: 100%" placeholder="����� �̸���"
        class="form-control">
      </div>
      <div align="center">
        <!-- ���� -->
        <input type="text" name="title" size="120"
        style="width: 100%" placeholder="������ �Է����ּ���"
        class="form-control">
      </div>
        <p>
          <div align="center">
          <!-- ���� -->
            <textarea name="content" cols="120" rows="12"
            style="width: 100%; resize: none" placeholder="����#"
            class="form-control"></textarea>
          </div>
        <p>
      <div align="center">
        <input type="submit" value="���� ������" class="btn btn-warning">
      </div>
    </form>
</body>
</html>