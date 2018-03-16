# Cocoa Pod

> cocoaPod setting 방법
> 코코아 팟은 터미널에서 다운받는 속도는 빠르지만 xcode에서 빌드 파싱이 느리다

~~~
1. Brew 설치후 웹사이트로 가서 ..

2. brew update; brew upgrade;

3. Ruby 업데이트 확인 - sudo gem update; gem cleanup

4. cocoaPod update - pod repo update; 

5. 프로젝트를 만들고 해당 프로젝트 경로로 가서 pod init (pod file이 생성된다)

6. open .  - 해당 파일의 경로로 탐색기 오픈

7. Pod file 을 열어보면 # 주석처리 된 부분을 제외하고 확인 가능 pod ’Then’ 입력 후 저장

8. Pod install (pod file에 추가 및 수정)
~~~

# Carthage

> Carthage setting
> 터미널에서 다운로드 하는 속도는 느리지만 xcode에서 빌드 파싱이 코코아팟 보다 더 빠르다

~~~
1. Build phases 메뉴 (가장 상위 프로젝트 선택 후)

2. link binary with libraries Alamofire.framework 추가

3. Build phases -> run scripta

- shell 아래 path 입력 영역
/usr/local/bin/carthage copy-frameworks

- inputfile 추가 (왼쪽 상단 + 버튼 사용)
$(SRCROOT)/Carthage/Build/iOS/Alamofire.framework
~~~

**참고 이미지**
<p align="center"><img width="300" height="200" src="/Img/carthage1.png"><img width="300" height="200" src="/Img/carthage2.png"></p>




