# Baby Family Media App MVP Plan

## 1. 제품 목표

- 레퍼런스: 쑥쑥찰칵의 핵심 경험(가족 공유, 권한 제어, 댓글/좋아요, 다운로드)
- 차별점: 앱 자체 스토리지가 아니라 사용자 개인 클라우드 저장소를 연결
- MVP 저장소: Google Drive만 우선 지원
- 메타데이터/소셜 기능: Firebase 중심으로 빠르게 구현
- 개발 전략: Flutter UI-first + Mock data 우선

## 2. 레퍼런스 기반 기능 정리 (쑥쑥찰칵 유사)

- 가족 초대 링크 발급 및 수락
- 초대한 가족 구성원(엄마, 아빠, 할아버지, 할머니 등)의 사진/영상 열람
- 멤버 권한 제어(보기/업로드/수정/삭제 등)
- 댓글, 좋아요 같은 상호작용
- 사진/영상 다운로드

## 3. MVP 범위

### In Scope (MVP)

- 인증: Firebase Auth (Google Sign-In 또는 이메일 링크)
- 가족 단위 공간 생성(1 가족 = 1 공유 공간)
- 초대 링크 생성/수락
- 멤버별 권한 설정(최소: viewer, contributor, manager)
- 피드/갤러리 목록
- 상세 화면(댓글/좋아요)
- 원본 다운로드 UI
- Google Drive 업로드/목록/다운로드
- Firestore 메타데이터 저장

### Out of Scope (Post-MVP)

- OneDrive, Naver MYBOX, Private NAS 연동
- 고급 검색/자동 분류/얼굴 인식
- 웹 관리자 콘솔
- 결제/광고 모델

## 4. 시스템 구조 (MVP)

- Client: Flutter (Android 우선)
- File Storage: Google Drive API
- Metadata: Firebase Firestore
- Auth: Firebase Auth
- Optional Functions: Firebase Cloud Functions (초대 토큰 검증, 비동기 후처리)

### 데이터 분리 원칙

- 원본 파일: Google Drive
- 메타데이터: Firestore
- 예: media 문서에는 driveFileId, uploaderId, createdAt, likeCount 등만 저장

## 5. Firestore 컬렉션 초안

- users
- families
- memberships
- inviteTokens
- media
- comments
- reactions

## 6. 권한 모델 (간단 버전)

- master: 가족/멤버 관리 + 모든 CRUD
- manager: 업로드/수정/삭제 + 댓글/좋아요
- viewer: 보기 + 댓글/좋아요 + 다운로드

## 7. Flutter 라이브러리 추천

### Core

- flutter_riverpod: 상태관리
- go_router: 라우팅
- intl: 날짜/지역화

### Networking & Data

- dio (or http): API 호출
- freezed + json_serializable: 모델/직렬화
- build_runner: 코드 생성

### Media

- image_picker: 미디어 선택
- video_player: 영상 재생
- cached_network_image: 썸네일 캐시
- path_provider: 로컬 경로 처리
- permission_handler: 권한 요청

### Firebase

- firebase_core
- firebase_auth
- cloud_firestore

### Google Drive

- google_sign_in
- googleapis
- googleapis_auth

## 8. UI-first + Mock 전략

- Repository 인터페이스를 먼저 정의
- 초기 구현은 Mock Repository로 제공
- 화면 개발 완료 후 Firebase/Drive Repository로 교체
- 개발 중 네트워크 지연/실패를 mock에서 시뮬레이션

### 추천 폴더 구조

```text
lib/
  app/
  core/
  features/
    auth/
    family/
    feed/
    media/
    comments/
    settings/
  data/
    mock/
    firebase/
    gdrive/
```

## 9. 개발 일정 (Android 우선, 주 10시간)

- 총 8~10주

### Week 1-2

- 디자인 토큰/컴포넌트 정리
- 라우팅/상태관리/Mock 데이터 골격
- 온보딩/피드/상세 기본 UI

### Week 3-4

- 가족 초대/멤버 관리 UI
- 권한 기반 화면 분기
- 댓글/좋아요/다운로드 UI

### Week 5-6

- Firebase Auth + Firestore 연결
- Security Rules 초안 및 테스트
- Mock -> 실데이터 전환

### Week 7-8

- Google Drive 업로드/목록/다운로드 연결
- 실패 재시도, 에러 UX, 로깅
- 내부 베타

### Week 9-10 (버퍼)

- 버그 수정
- 안정화, 릴리즈 체크리스트

## 10. 리스크 및 대응

- Drive API 쿼터/권한 이슈: scope 최소화 + 업로드 큐 재시도
- 가족 권한 충돌: 서버 규칙(Firestore Rules) 우선 적용
- 미디어 대용량 업로드 실패: chunk upload + 백그라운드 재시도
- 초보 개발 리소스: MVP 엄격한 범위 유지

## 11. 시작 체크리스트

- Flutter/FVM 버전 고정
- Firebase 프로젝트 생성 (dev/prod 분리)
- Google Cloud Console에서 Drive API 활성화
- OAuth 클라이언트 발급
- Android SHA 등록
- Firestore 보안 규칙 템플릿 작성
