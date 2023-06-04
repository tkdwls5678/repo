<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <title>방명록 목록</title>
  <style>
    /* 스타일링을 위한 CSS */
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
  <h1 style="text-align: center;">방명록 목록</h1>
  <table>
  <tr style="background-color: rgb(240,240,240); text-align: center;">
    <td>번호</td>
    <td>작성자</td>
    <td>이메일</td>
    <td>작성일</td>
    <td>제목</td>
  </tr>
  <c:forEach var="guestbook" items="${guestbooklist}" varStatus="status">
    <tr>
      <td>${status.count}</td>
      <td>${guestbook.pers}</td>
      <td>${guestbook.email}</td>
      <td>${guestbook.date}</td>
      <td>${guestbook.title}</td>
    </tr>
  </c:forEach>
</table>

  
  
  <div class="row justify-content-center">
  <div class="col-auto">
  <button class="btn btn-primary btn-lg" type="button" data-bs-toggle="collapse"
  data-bs-target="#addForm" aria-expanded="false" aria-controls="addForm"> 등록 </button>
   <div class="collapse" id="addForm">
   	<div class="card card-body">
   		<form method="post" action="/jwbook/guestbook.nhn?action=addGuestbook"
   			enctype="multipart/form-data">
   			<h2>방명록 입력</h2>
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
    <button type="submit" class="btn btn-primary btn-lg" onclick="submitGuestbook()">입력</button>
    <button type="button" class="btn btn-primary btn-lg" onclick="clearForm()">취소</button>
    <button class="btn btn-primary btn-lg" type="button" data-bs-toggle="collapse"
  data-bs-target="#addForm" aria-expanded="false" aria-controls="addForm"> 목록 </button>
    </div>
    </div>
    </div>
   		</form>
   		</div>
   		</div>
   	</div>
   </div>
  
  
  <script>
    function showGuestbookForm() {
      document.getElementById('guestbook-form').style.display = 'block';
    }
    
    function submitGuestbook() {
      // 방명록을 제출하는 코드
      // 입력된 값은 다음과 같이 JavaScript로 가져올 수 있습니다.
      var num = document.getElementById('num').value;
      var pers = document.getElementById('pers').value;
      var email = document.getElementById('email').value;
      var date = document.getElementById('date').value;
      var title = document.getElementById('title').value;
      var content = document.getElementById('content').value;
      
      // 이후에 서버로 방명록을 전송하거나 다른 작업을 수행할 수 있습니다.
      
      // 입력 후에는 입력 폼을 숨깁니다.
      cancelGuestbook();
    }
    
    function cancelGuestbook() {
      document.getElementById('guestbook-form').style.display = 'none';
      clearForm();
    } // 취소 버튼 기능(입력창 비우기)
    function clearForm() {
    	document.getElementById("authorInput").value = "";
        document.getElementById("emailInput").value = "";
        document.getElementById("titleInput").value = "";
        document.getElementById("passwordInput").value = "";
        document.getElementById("contentInput").value = "";
        document.getElementById("addForm").classList.remove("show");
      }
    function hideAddForm() {
        document.getElementById('addForm').style.display = 'none';
      }
    
    	}

	
    }

  </script>
</body>
</html>
