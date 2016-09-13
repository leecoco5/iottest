<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.padding{
	padding: 5px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>


function pre(){
	location.href="../code/code.jsp"
}

 function address(){
	new daum.Postcode({ //팝업에서 검색 결과 항목 클릭했을때 작성 실행할 코드를 작성
		oncomplete: function(data){	//각 주소 노출 구칙에 따라 주소 조합
									//내려오는 변수가 없는 경우 공백('')을 가짐
			var fullAddr =""; //최종 주소 변수
			var extraAddr=""; //조합형 주소 변수
			
			if(data.userSelectedType === 'R'){ //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
												//사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;
			}else{
				fullAddr = data.jibunAddress;
			}
			if(data.userSelectedType === 'R'){  //사용자가 선택한 주소가 도로명 타입일때 조합한다
				if(data.bname !== ''){		//법정동명이 있을 경우 추가한다.
					extraAddr += data.bname;
				}
			//건물명이 있을 경우 추가
			if(data.buildngName !== ''){
				extraAddr += (extraAddr !== '' ? ', '+data.buildingName : data.buildingName);
			}
			//조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만듬
			fullAddr += (extraAddr !== '' ?  ', ('+ extraAddr +')' : '');
			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('address').value = fullAddr;	
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('address2').focus();
		}
	}).open();
	
} 
 function address1(){
		new daum.Postcode({ //팝업에서 검색 결과 항목 클릭했을때 작성 실행할 코드를 작성
			oncomplete: function(data){	//각 주소 노출 구칙에 따라 주소 조합
										//내려오는 변수가 없는 경우 공백('')을 가짐
				var fullAddr =""; //최종 주소 변수
				var extraAddr=""; //조합형 주소 변수
				
				if(data.userSelectedType === 'R'){ //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
													//사용자가 도로명 주소를 선택했을 경우
					fullAddr = data.roadAddress;
				}else{
					fullAddr = data.jibunAddress;
				}
				if(data.userSelectedType === 'R'){  //사용자가 선택한 주소가 도로명 타입일때 조합한다
					if(data.bname !== ''){		//법정동명이 있을 경우 추가한다.
						extraAddr += data.bname;
					}
				//건물명이 있을 경우 추가
				if(data.buildngName !== ''){
					extraAddr += (extraAddr !== '' ? ', '+data.buildingName : data.buildingName);
				}
				//조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만듬
				fullAddr += (extraAddr !== '' ?  ', ('+ extraAddr +')' : '');
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('exec').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('addr').value = fullAddr;	
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById('addr1').focus();
			}
		}).open();
		
	} 


</script>
</head>
<body>

<div style = "width:1250px; height: 500px; background: red;"> 
	
	
	<h2>선택된 상품</h2>
		<table width="80%">
			<thead>
				<tr>
				<td><input type="checkbox" onclick=""><br><br><br><br><br></td>
				<td >상품정보<br><br><br></td>
				<td>수량</td>
				<td>판매가</td>
				<td >배송비</td>
				<td>합계</td>
				
				</tr>
				
				<tr>
					<td><input type="checkbox" onclick="" id="del" value="${buy.productnum}"></td>
					<td>${buy.productname}</td>
					<td>${buy.count}</td>
					<td>${buy.price }</td>
					<td>3000</td>
					<td>${buy.count*buy.price+3000}</td>
				</tr>
					
		 	
			 	<tr height="180" align="right">
					<td colspan="10">할인상품 구매시 할일 적용 금액은 아래 결제에정금액에서 확인 가능합니다</td>
				</tr>
	
		
		
				<tr>
					<td colspan="9" align="right">
							
							<input type="button" value="이전" onclick="pre()">
					</td>		
				</tr>	
			</thead>	
		</table>
		
</div>
	
<div style="width: 1250px; height: 300%; float: left; background: blue;">
	
		
	<h2>주문자 정보</h2>
		<table>
				<tr>
					<td class="padding">이름 :
					<input type="text" name="name" id="name" ></td>
				</tr>
				<tr>
					<td class="padding">주소 :
						<input type="text" id=post>
						<input type="button" onclick="address()" value="우편번호 찾기"><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button"  id="address"  style="width:500px;">기본주소<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text"  id="address2" style="width:500px;">나머지주소
					</td>
				</tr>
				<tr>
					<td class="padding">집 전화 :
						<select name="Tle">
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="041">041</option>
							<option value="051">051</option>
							<option value="061">061</option>
						</select>
							-<input type="text" id="tel">
							-<input type="text" id="tel">
					</td>
				</tr>
				
				<tr>
					<td class="padding">휴대 전화 :
					<select name="Tle">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						</select>
						-<input type="text" id="tel">
						-<input type="text" id="tel"></td>
				</tr>
				<tr>
					<td class="padding">메일 주소 :
						<input type="text" id="email">
						@
						<input type="text" id="email">
							<select name="email">
							<option value="input">직접입력</option>
							<option value="choose">-이메일 선택</option>
							<option value="naver">naver.com</option>
							<option value="daum">daum.net</option>
							<option value="nate">nate.com</option>
							<option value="hotmail">hotmail.com</option>
							</select>
					</td>
						<tr>
							
							<td>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							이메일틀 통해 주문처리과정을 보내드립니다<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							이메일 주소란에 반드시 수신가능한 이메일 입력해주세요
							</td>
						</tr>
					<tr>
							<td class="padding">주문조회 비밀번호 :
							<input type="text" name="password">(주문조회시 필요합니다 4자리에서 12자리 영문또는 숫자 대소문자 구분)</td>
					</tr>
					<tr>
							<td class="padding">주문조회 비밀번호 확인 :
							<input type="text" name="password"></td>
					</tr>
					<tr>
							<td class="padding">비회원 구매 및 결제 :
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							비회원 구매 및 결제 개인정보취급방침에 대하여 동의합니다
							<input type="radio" name="radio">동의함
							<input type="radio" name="radio">동의 안함</td>
					</tr>
					<tr>
							<td class="padding">개인정보 방침 :
							<textarea name="memo" maxlength="300" cols="80"></textarea></td>
					</tr>
			
	</table>
</div>
<div style ="width:1250px; height:300%; float:left; background: green;">

	<h2>배송지 정보</h2>
		<table>
				<tr>
					<td class="padding" > 배송지 선택 :
					<input type="radio" name="infosame">주문자 정보와동일
					<input type="radio" name="infosame">새로운 배송지</td>	
				</tr>
				<tr>
					<td class="padding">이름 :
					<input type="text" name="name" id="name" ></td>
				</tr>
				<tr>
					<td class="padding">주소 :
						<input type="text"  id="exec">
						<input type="button" onclick="address1()" value="우편번호 찾기"><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text"  id="addr" style="width:500px;">기본주소<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text"  id="addr1" style="width:500px;" >나머지주소
					</td>
				</tr>
				<tr>
					<td class="padding">집 전화 :
						<select name="Tle">
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="041">041</option>
							<option value="051">051</option>
							<option value="061">061</option>
						</select>
							-<input type="text" id="tel">
							-<input type="text" id="tel">
					</td>
				</tr>
				
				<tr>
					<td class="padding">휴대 전화 :
						<select name="Tle">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							</select>
							-<input type="text" id="tel">
							-<input type="text" id="tel">
					</td>
				</tr>
			
				<tr>
						<td class="padding">배송메시지 :
						<textarea name="memo" maxlength="300" cols="80"></textarea></td>
				</tr>
				
				
	
		</table>
	</div>
	<div style ="width: 1250px; height: 200px; float:left; background: orange;">
			<div style ="width: 700px; height: 200px; float:right;  background: write;">
			<h2>총 결제금액</h2>
				<ul>
					<li><strong>총상품금액</strong>
					${buy.price}</li>
					<li><strong>배송비</strong>
					3000</li>
					<li><strong>추가 할인금액</strong>
					0</li>
					<li><strong>총 결제 금액</strong>
					${buy.count*buy.price+3000 }</li>			
				</ul>
			</div>
		
	</div>

</body>

</html>