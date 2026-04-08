# FVM Setup Guide (mac mini m4 + VS Code)

## 1. FVM 설치

```bash
brew tap leoafarias/fvm
brew install fvm
fvm --version
```

## 2. 프로젝트 Flutter 버전 고정

프로젝트 루트에서 실행:

```bash
cd /Users/changsungyim/projects/b_log
fvm install 3.29.0
fvm use 3.29.0
```

생성/갱신 파일:

- .fvmrc
- .fvm/flutter_sdk (symlink)

## 3. VS Code 연동

workspace 설정 파일 생성/수정:

`.vscode/settings.json`

```json
{
  "dart.flutterSdkPath": ".fvm/flutter_sdk",
  "dart.sdkPath": ".fvm/flutter_sdk/bin/cache/dart-sdk"
}
```

## 4. 팀 공통 실행 규칙

항상 fvm prefix 사용:

```bash
fvm flutter pub get
fvm flutter run -d android
fvm flutter test
fvm flutter analyze
```

## 5. Android 우선 실행

```bash
fvm flutter doctor
fvm flutter devices
fvm flutter run -d android
```

## 6. 초기 세팅 권장 순서

1. FVM 설치
2. fvm install / use
3. fvm flutter pub get
4. Firebase CLI/FlutterFire CLI 설치
5. Android 디바이스 연결 후 첫 실행

## 7. 자주 겪는 문제

- VS Code가 시스템 Flutter를 참조함:
  - 명령 팔레트에서 `Dart: Restart Analysis Server`
  - VS Code 재시작
- fvm flutter pub get 실패:
  - `fvm flutter doctor`로 SDK/툴체인 확인
- Android 빌드 실패:
  - `android/local.properties`의 SDK 경로 확인
  - Android Studio SDK Manager에서 플랫폼/빌드툴 설치

## 8. 추천 Git 관리

`.gitignore`에 다음이 포함되어 있는지 확인:

```gitignore
.fvm/flutter_sdk
```

`.fvmrc`는 커밋해 팀 버전 일치를 유지합니다.
