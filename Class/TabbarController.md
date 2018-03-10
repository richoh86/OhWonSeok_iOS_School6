# 개발자 업무 및 Git 특강: 20180310(토)

## Kanban(칸반)

1. Backlog 
2. Todo 
3. Ongoing 
4. Done 
5. Review 
6. Confirm

> 해당 회사의 기술 블로그를 확인하면 위와 같이 업무 프로세스가 잘 정해져있는지 알 수 있다 ( ex)우아한형제 )

---

### 강사님의 하루 일정 관리

1. 출근
2. 칸반보드 검토
3. todo list 작성
4. 업무 메일, 개인 메일 정리
5. 기술블로그 및 동영사 강좌 시청
6. 팀별 스크럼 및 칸반
7. 오전 팀 업무
8. 점심 
9. 팀 업무
10. 퇴근 
11. 취침

## S/W 개발자란?

컴퓨터의 소프트웨어의 연구, 설계, 프로그래밍 및 테스트를 포함하여
소프트웨어 개발 프로세스의 측면에 관심이 있는 사람

- 시스템설계
- 소프트웨어 개발 및 프로그래밍

## Recruit Process

1. 서류심사 
2. 프로그래밍과제 
3. 기술면접 : 본인이 주도해서 설명을 하는 것이 더 좋다 
4. 합격


## Git을 이용한 개발자 협업 Process

1. Centralized Workflow: master에 모두 커밋하는 방식
2. Featured Branch Workflow: dev/master branch로 나눠서 dev branch에서 feature 별로 나눠서 커밋
3. Gitflow Workflow: 가장 많이 쓰는 방법

 - Branch

  - master : 항상 에러없는 브랜치
  - dev: 최신버전을 release로 버전별 커밋 -------> release (dev -> tag 방식으로 1.0, 2.0 버전별로 커밋)
  - feature... --> dev에 Merge & commit

4. Forking Workflow: 
  - Pull Request 타인의 마음에 드는 repository에서 코드를 자신의 repository의 마스터에 가져와서 자신의 프로젝트 파일에 commit 하고 추가 기능구현을 하고 다시 원래 가져왔던 repository 주인에게 다시 노티를 주고 추가기능 코드를 전달해줄 수 있다
-> 남의 fork를 pull request 해서 contributor로 활동 가능

## Branch 만들기

- git checkout -b develop : 브랜치가 없으면 생성해준다 그리고 생성된 브랜츠로 이동된다
- git checkout develop: 브랜치 이동
- git push origin develop(branch name): branch를 repository에 올리는 명령어 
- git branch: 현재 브랜치를 확인 가능
- git status: 현재 git의 저장값 상태 표시
- git add . : 현재 수정된 로컬 저장소의 파일들
- git commit -m "name": 로컬에서 커밋
- git push: repository에 전송
- git remote add [name] https://github.com/isjang98/iOSTechMento.git : 다른 사람의 remote에서
본인의 로컬로 가져오는 방법








