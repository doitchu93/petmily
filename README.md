# :dog2:**Petmily**

> 유기 동물 입양, 자원봉사 매칭 서비스 웹사이트

<br>

## 목차

[1. 제작 기간](#1-제작-기간)<br>
[2. 참여 인원](#2-참여-인원)<br>
[3. 사용 기술](#3-사용-기술)<br>
[4. ERD](#4-erd)<br>
[5. 담당 기능](#5-담당-기능)

<br>

## 1. 제작 기간

- 2022.05.30 ~ 2022.07.07
- 기획, 설계 2주 / 개발 : 3주

<br>

## 2. 참여 인원

<table>
    <tr align=center>
        <td width=200px><b>유형두</b></td>
        <td width=200px>팀원 1</td>
        <td width=200px>팀원 2</td>
        <td width=200px>팀원 3</td>
    </tr>
    <tr align=center>
        <td>
            <b>
                메인 페이지<br>
                회원가입<br>
                로그인<br>
                아이디 / 비밀번호 찾기
            </b>
        </td>
        <td>
            입양 게시 / 후기<br>
            봉사 게시 / 후기
        </td>
        <td>
            단체 신청<br>
            공지사항<br>
            1:1 문의
        </td>
        <td>
            마이 페이지
        </td>
    </tr>
</table>

<br>

## 3. 사용 기술

### Back-End

- Java 8
- ORACLE 11G

### Front-End

- JavaScript
- HTML5 / CSS3

<br>

## 4. ERD

<p align="center"><img src="https://user-images.githubusercontent.com/102894238/200003167-93190f2c-8cad-422e-8e8b-f5ac24d7970f.png" width=80%/></p>

<br>

## 5. 담당 기능

<details><summary><b>5.1. 메인 페이지 펼치기</b></summary><div markdown="1">

### 5.1. 메인 페이지

<p align="center"><img src="https://user-images.githubusercontent.com/102894238/200451216-49da747d-702f-4fdc-b028-bc9137e1c140.png" width=80%/></p>

- 입양 후기, 봉사 후기, 공지사항의 게시글을 가져와 목록으로 보여줍니다.<br>
[:pushpin:코드 보기](https://github.com/doitchu93/petmily/blob/f2b18926f928bed420472ee28701c57e4f84e503/petmily/WebContent/views/common/main.jsp#L222-L346)

- 로그인 후 session에 담긴 사용자의 정보를 표시합니다.<br>
[:pushpin:코드 보기](https://github.com/doitchu93/petmily/blob/f2b18926f928bed420472ee28701c57e4f84e503/petmily/WebContent/views/common/header.jsp#L155-L204)

</div></details>

<br>

<details><summary><b>5.2. 회원가입 펼치기</b></summary><div markdown="1">

### 5.2. 회원가입

<p align="center"><img src="https://user-images.githubusercontent.com/102894238/200457569-fec6ed0b-1f73-49c8-b39f-d3a549730960.png" width=80%/></p>

- 각각의 입력 부분에 AJAX와 정규표현식을 활용하여 조건 검사 및 결과를 실시간으로 표시합니다.<br>
[:pushpin:코드 보기](https://github.com/doitchu93/petmily/blob/f2b18926f928bed420472ee28701c57e4f84e503/petmily/WebContent/views/member/enrollMember.jsp#L490-L1098)

- 10자리의 숫자, 영문 대소문자로 이루어진 랜덤코드를 생성하고 인증번호, 임시 비밀번호로 활용합니다.<br>
[:pushpin:코드 보기](https://github.com/doitchu93/petmily/blob/f2b18926f928bed420472ee28701c57e4f84e503/petmily/src/com/kh/common/RandomCodeGenerator.java#L7-L26)

- 구글 SMTP 서버를 이용해서 사용자가 입력한 이메일로 인증번호를 발송할 수 있습니다.<br>
[:pushpin:코드 보기](https://github.com/doitchu93/petmily/blob/f2b18926f928bed420472ee28701c57e4f84e503/petmily/src/com/kh/common/controller/AjaxAuthenticaionSendEmailController.java#L43-L104)

<p align="center"><img src="https://user-images.githubusercontent.com/102894238/200467662-d0426234-9900-4943-be41-93b8151a142b.png" width=40%/></p>

- 이메일을 발송하면 인증 테이블에 인증코드가 저장되며, 해당 시간으로부터 10분이 지나면 발송했던 인증코드로는 인증이 불가능합니다.<br>
[:pushpin:코드 보기](https://github.com/doitchu93/petmily/blob/f2b18926f928bed420472ee28701c57e4f84e503/petmily/src/com/kh/common/controller/AjaxAuthenticationCheckRandomCodeController.java#L35-L125)

</div></details>

<br>

<details><summary><b>5.3. 로그인, 아이디 / 비밀번호 찾기 펼치기</b></summary><div markdown="1">

### 5.3. 로그인, 아이디 / 비밀번호 찾기

### 5.3.1. 로그인

<p align="center"><img src="https://user-images.githubusercontent.com/102894238/200467123-7eac5cfb-fdbd-45a5-a3c3-1f12f48bf658.png" width=40%/></p>

- 로그인한 사용자가 비회원 전용 페이지 접근 시 Alert으로 안내 후 이전 페이지로 돌아갑니다.<br>
[:pushpin:코드 보기](https://github.com/doitchu93/petmily/blob/f2b18926f928bed420472ee28701c57e4f84e503/petmily/WebContent/views/member/loginMember.jsp#L153-L163)

- 아이디, 비밀번호 입력 칸에 아이콘으로 디자인 요소를 추가했기 때문에 div 태그로 감싸주고 input 태그와 같은 효과를 JavaScript로 넣었습니다.<br>
[:pushpin:코드 보기](https://github.com/doitchu93/petmily/blob/f2b18926f928bed420472ee28701c57e4f84e503/petmily/WebContent/views/member/loginMember.jsp#L246-L260)

### 5.3.2. 아이디 / 비밀번호 찾기

<p align="center"><img src="https://user-images.githubusercontent.com/102894238/200469218-c6f4cfea-0eee-49ff-ae0c-1d608f94a955.png"/></p>

- 입력한 정보로 DB에 저장된 회원 정보와 비교합니다.<br>
[:pushpin:코드 보기](https://github.com/doitchu93/petmily/blob/f2b18926f928bed420472ee28701c57e4f84e503/petmily/src/com/kh/member/controller/MemberFindIdController.java#L32-L72)

- 비밀번호 찾기 시 인증을 완료하면 랜덤코드를 생성해서 사용자의 임시 비밀번호로 사용합니다.<br>
[:pushpin:코드 보기](https://github.com/doitchu93/petmily/blob/f2b18926f928bed420472ee28701c57e4f84e503/petmily/src/com/kh/member/controller/MemberFindPwdController.java#L34-L77)

</div></details>

<br>

### 
