<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<meta charset="EUC-KR">
<title>���� ����</title>
</head>
<body>
	<h2>���� ����</h2>
    <div class="container">
    <div class="table-container">
      <div class="col-auto">
        <table class="table">
          <tbody>
            <tr>
              <td>
                <label for="authorInput" class="form-label">�ۼ���:</label>
              </td>
              <td>
                <input type="text" class="form-control">
              </td>
            </tr>
            <tr>
              <td>
                <label for="emailInput" class="form-label">�̸���:</label>
              </td>
              <td>
                <input type="text" class="form-control">
              </td>
            </tr>
            <tr>
              <td>
                <label for="titleInput" class="form-label">����:</label>
              </td>
              <td>
                <input type="text" class="form-control">
              </td>
            </tr>
            <tr>
              <td>
                <label for="passwordInput" class="form-label">��й�ȣ:</label>
              </td>
              <td>
                <input type="password" class="form-control">
              </td>
            </tr>
          </tbody>
        </table>
        <textarea cols="50" rows="5" name="content" class="form-control"></textarea>
    <button type="submit" class="btn btn-primary btn-lg">�Է�</button>
    <button type="button" class="btn btn-primary btn-lg" onclick="clearForm()">���</button>
    <button class="btn btn-primary btn-lg" type="button" data-bs-toggle="collapse"
  data-bs-target="#addForm" aria-expanded="false" aria-controls="addForm"> ��� </button>
    </div>
    </div>
    </div>
    <hr>
    <a href="javascript:history.back()" class="btn btn-primary"> << Back </a>

</body>
</html>