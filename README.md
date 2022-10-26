# hyundai-autoever-intern-assignment
현대오토에버 채용프로그램 3-4주차 과제 레포지토리

## local server setting

1. server/src/main/resources로 이동
2. `.env.sample`파일을 cp하여 `.env`파일 생성
3. URL, PW, NAME 작성
4. `chmod 777 gradlew`
5. `./gradlew build`
6. `java -jar ./build/libs/[jar파일 이름].jar` 실행.


## Flutter setting 및 실행
1. 패키지 root 내 `.env-sample`파일을 cp하여 `env`파일 생성 (앞에 . 삭제))
2. API주소 URL 작성
3. 웹푸시키 작성
4. 실행


---

## Notification Showcase

### 알림 수신

##### foreground
<img src="https://raw.githubusercontent.com/KOREAparksh/hyundai-autoever-intern-assignment/main/app/assets/수신_포그라운드.gif" width="49%"/>

##### background
<img src="https://raw.githubusercontent.com/KOREAparksh/hyundai-autoever-intern-assignment/main/app/assets/수신_백그라운드.gif" width="49%"/>

##### terminated
<img src="https://raw.githubusercontent.com/KOREAparksh/hyundai-autoever-intern-assignment/main/app/assets/수신_터미네이티드.gif" width="49%"/>


### 알림 클릭 액션

##### foreground
<img src="https://raw.githubusercontent.com/KOREAparksh/hyundai-autoever-intern-assignment/main/app/assets/액션_포그라운드.gif" width="49%"/>

##### foreground (chat)
<img src="https://raw.githubusercontent.com/KOREAparksh/hyundai-autoever-intern-assignment/main/app/assets/액션_포그라운드_채팅.gif" width="49%"/>

##### background
<img src="https://raw.githubusercontent.com/KOREAparksh/hyundai-autoever-intern-assignment/main/app/assets/액션_백그라운드.gif" width="49%"/>

##### terminated
<img src="https://raw.githubusercontent.com/KOREAparksh/hyundai-autoever-intern-assignment/main/app/assets/액션_터미네이티드.gif" width="49%"/>

### 알림 후 알림클릭 없이 앱 접속
<img src="https://raw.githubusercontent.com/KOREAparksh/hyundai-autoever-intern-assignment/main/app/assets/알림없이앱접속.gif" width="49%"/>

### 새 알림 badge
<img src="https://raw.githubusercontent.com/KOREAparksh/hyundai-autoever-intern-assignment/main/app/assets/새알림_badge.gif" width="49%"/>
