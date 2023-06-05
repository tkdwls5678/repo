<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<meta charset="EUC-KR">
<title>방명록 수정</title>
<style>
table {
  border-collapse: collapse;
  width: 80%;
  background-color: rgb(3, 181, 148); /* 초록색 배경 색상 */
  border: 1px solid green;
    margin: 0 auto;
    margin-top: 50px;
  margin-bottom: 50px;
   padding: 10px;
   font-weight: bold;

}
table-container {
  border-spacing: 5px; /* 표 안쪽 간격 조정 */
  table-layout: fixed; /* 표 너비 고정 */
  margin-top: 50px;
  margin-bottom: 50px;
  margin-left: auto;
  margin-right: auto;
  max-width: 800px; /* Updated max-width value */
}
th, td {
  padding: 8px;
  border-style: double;
  border: 3px solid gray; /* 이중선 테두리 색상 */
}

.button-container {
  text-align: center; /* 가운데 정렬 */
  margin-top: 30px; /* 버튼과 표 사이의 간격 조정 */

.btn {
  margin-top: 10px; /* 버튼들 사이의 간격 조정 */
   height: 50px;
}
</style>
</head>
<body>
	<h2 style="text-align: center;">방명록 수정</h2>
    <div class="container">
    <div class="table-container">
      <div class="col-auto">
        <table class="table">
          <tbody>
            <tr>
              <td>
                <label for="authorInput" class="form-label">작성자:</label>
              </td>
              <td>
                <input type="text" class="form-control" id="authorInput">
              </td>
            </tr>
            <tr>
              <td>
                <label for="emailInput" class="form-label">이메일:</label>
              </td>
              <td>
                <input type="text" class="form-control" id="emailInput">
              </td>
            </tr>
            <tr>
              <td>
                <label for="titleInput" class="form-label">제목:</label>
              </td>
              <td>
                <input type="text" class="form-control" id="titleInput">
              </td>
            </tr>
            <tr>
              <td>
                <label for="passwordInput" class="form-label">비밀번호:</label>
              </td>
              <td>
                <input type="password" class="form-control" id="passwordInput">
              </td>
            </tr>
          </tbody>
        </table>
        <textarea cols="50" rows="5" name="content" class="form-control" id="contentInput"></textarea>
    <button type="submit" class="btn btn-primary btn-lg">수정</button>
    <button type="button" class="btn btn-primary btn-lg" onclick="clearForm()">삭제</button>
    <a href="javascript:history.back()" class="btn btn-primary btn-lg"> 목록 </a>
    </div>
    </div>
    </div>
    <script>
    function clearForm() {
    	document.getElementById("authorInput").value = "";
        document.getElementById("emailInput").value = "";
        document.getElementById("titleInput").value = "";
        document.getElementById("passwordInput").value = "";
        document.getElementById("contentInput").value = "";
      }
    </script>
    

</body>
</html>
