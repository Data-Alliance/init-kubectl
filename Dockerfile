# --- 1단계: kubectl 다운로드 ---
FROM alpine:3.17 AS builder

ARG KUBECTL_VERSION=v1.28.0
RUN apk add --no-cache curl ca-certificates && \
    curl -L "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" -o /tmp/kubectl && \
    chmod +x /tmp/kubectl

# --- 2단계: 최종 이미지 빌드 ---
FROM alpine:3.17

# ca-certificates 미리 설치
RUN apk add --no-cache ca-certificates

# builder 단계에서 받은 kubectl만 복사
COPY --from=builder /tmp/kubectl /usr/local/bin/kubectl

# kubectl을 기본 명령어로 지정
ENTRYPOINT ["kubectl"]

