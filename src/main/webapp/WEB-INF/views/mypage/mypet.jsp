<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
  main{
    align-items: center;
    display: flex;
    margin: 70px auto;
  }
  #list{ /*마이 리스트*/
    width: 180px;
    height: 700px;
    margin: 40px;
    border: 1px solid #ddd;
    border-radius: 10px;
    background-color:  white;
    box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);
   }
  #list li{
    padding: 10px;
    text-align: center;
    list-style: none;
    margin:20px 0;
  }
  #list li:active{
    	background-color:#ddd;
   }
  #list ul{
    margin:0; padding: 0;
  }
  #list li a{
    color: black;
    font-size: 1.1em;
    text-decoration:none;
  }
  #list li:hover{
      box-shadow: 0 8px 16px rgba(0,0,0,0.2), 0 4px 4px rgba(0,0,0,0.1);
      border-bottom: 1px solid #ddd;
    }
  #myPage{ /*펫 정보 창*/
    width: 1200px;
    height: 700px;
    margin: 40px 20px;
    background-color:ghostwhite;
    box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);
    display: flex;
  }
  #myPage tr td{ /*테이블 간격조절*/
    padding: 15px;
  }
  table input{
    height: 25px;
    line-height: 25px;
  }
  #pet_sub{ /*수정버튼*/
    border: 1px solid black;
    border-radius: 5px;
    width: 100px;
    height: 40px;
    background-color:black;
    color: aliceblue;
    font-size: 1.1em;
    box-shadow: 1px 3px 0 rgb(0,0,0,0.5);
  }
  #pet_sub:active{
    top: 1px;
    position: relative;
    box-shadow: 1px 1px 0 rgb(0,0,0,0.5);
  }
  #profile{
    width: 300px; height: 300px;
    border-radius: 70%;                                  
  }
  #sendButton{
    width: 100px; height: 30px; 
    line-height: 30px; vertical-align: middle;
    border: none; border-radius: 10px; 
    background-color: dimgray;
    color: white;
  }
  #sendButton:hover{
  	cursor:pointer;
  	border:1px solid black;
  	background-color:ghostwhite;
  	color:black;
  }
  #pet_sub:hover{
  	cursor:pointer;
  	background-color:ghostwhite;
    color:black;
  }
  #size{
  	width: 178px; 
  	height: 32px; 
  	text-align: center;
  }
</style>
<script>
  document.addEventListener('DOMContentLoaded', function() { //페이지 로딩이 완료되면
    // '업로드' 버튼에 클릭 이벤트 추가
    document.querySelector("#sendButton").addEventListener('click', function() {
    // 파일 입력 필드에서 파일 가져오기
    let selectFile = document.querySelector("#petimg").files[0];
      // 파일이 선택되었는지 확인
      if (selectFile) {
        // 선택한 파일을 이미지로 표시
        const file = URL.createObjectURL(selectFile);
        document.querySelector("#profile").src = file;
      }else {
        alert('파일을 선택하세요.');
      }
    });
  });
  var saveOrUpdate = 0;
  $(document).ready(function(){
     if($("#petname").val()==''){
        saveOrUpdate = 1;
     }
     
    $("#petprofile").submit(function(event){
       event.preventDefault();
       var inputimg = $("#petimg")[0].files[0];
       
       var form = new FormData($("#petprofile")[0]);
       var url="";
       console.log(form.data);
       if(saveOrUpdate == 1){
          url = "/mypage/petinput";
       }else{
          url = "/mypage/petsubmit";
       }
       $.ajax({
         type:'POST',
         url : url,
         data : form,
         dataType : 'text',
         contentType : false,
         processData : false,
         success : function(){
            alert("저장이 완료되었습니다.");
         },error : function(error){
            console.log(error);
         }
       });
       
    }) 
  });
</script>
	<main>
        <div id="list">
            <h4 style="text-align: center; margin: 20px auto;">마이페이지</h4>
            <ul>
              <li><a href="/mypage/mypageMain">정보</a></li>
              <li><a href="/mypage/mycourse">나만의 코스</a></li>
              <li><a href="/mypage/mypet">펫 정보</a> </li>
              <li><a href="/mypage/myfavorite">내 즐겨 찾기</a></li>
              <li><a href="/mypage/mywrite">내가 쓴 글</a></li>
              <li><a href="/mypage/mygroup">내 모임</a></li>
              <li><a href="/mypage/myfriend">내 친구</a></li>
              <li><a href="/mypage/applyList">모임/친구 관리</a></li>
              <li><a href="/mypage/outmember">회원탈퇴</a></li>
            </ul>          
        </div>
        <div id="myPage">
            <h2 style="margin:20px 30px;">펫 정보</h2>
            <form method="post" action="/mypage/petsubmit" enctype="multipart/form-data" style="display:flex;" id="petprofile">
            <div style="margin-top: 100px;"> 
                    <table style="margin-left: 50px;">
						<tr>
						<input type="hidden" value="${logId }" name="userid">
							<td>이름</td>
							<td><input type="text" id="petname" name="petname" required
								value="${pVO.petname }" /></td>
							<td>성격</td>
							<td><input type="text" name="petwant" id="petwant"
								required value="${pVO.petwant }" /></td>
						</tr>
						<tr>
							<td>나이</td>
							<td><select id="petage" name="petage">
									<option>파피(출생~6개월)</option>
									<option>주니어(6개월~2년)</option>
									<option>어덜트(2년~7년)</option>
									<option>시니어(7년~)</option>
								</select>
							</td>
							<td>취미</td>
							<td><input type="text" name="pethobby" id="pethobby"
								required value="${pVO.pethobby }" /></td>
						</tr>
						<tr>
							<td>성별</td>
							<td><select id="petgender" name="petgender">
								<option value="♂">♂</option>
								<option value="♀">♀</option>
							</select></td>
							<td>사이즈</td>
							<td><select id="petsize" name="petsize">
								<option>소형</option>
								<option>중형</option>
								<option>대형</option>
							</select></td>
						</tr>
						<tr>
							<td>견종</td>
							<td><input type="text" id="petkind" name="petkind"
								required value="${pVO.petkind }"/></td>
							<td>지역</td>
							<td><input type="text" id="addr" name="addr"
								required value="${pVO.addr}"/></td>
						</tr>
						<tr>
							<td>소개글</td>
							<td colspan="3"><textarea rows="8" cols="52" id="introducing"
									style="resize: none; width: 460px; height: 220px;"
									name="introducing">${pVO.introducing }</textarea></td>
						</tr>
					</table>
                    <div style="display: flex; justify-content: right;  margin-right: 80px; margin-top: 20px;"><input type="submit" id="pet_sub" value="저장하기"></div>
                         
            </div>
            <div style="margin:100px 30px;">
              <div style="display: flex; justify-content: center;" ><img id="profile" src="/img/${pVO.petimg }" alt="프로필 사진"/></div>
                <div style="display: flex; justify-content: center; margin: 10px;">
                  <label for="petimg" style="cursor: pointer; font-size: 1.1em;">
                        🐶이미지 가져오기🐶
                  </label>
                </div>
                <input type="file" id="petimg" name="petimg" accept="image/*"  style="display: none;">
                <div style="display: flex; justify-content: center;"><input type="button" value="업로드" id="sendButton"/></div> 
            </div>
           	</form>
        </div>
    </main>
