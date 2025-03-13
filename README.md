# init-kubectl (Init Container for Cilium Readiness)

This project provides an initialization container (initContainer) for Kubernetes environments that waits until the Cilium network plugin is fully operational. The container uses `kubectl` to check the status of pods labeled `k8s-app=cilium` in the `kube-system` namespace, ensuring all pods reach the `Running` state before allowing dependent workloads to proceed. This guarantees stable deployment for applications relying on Cilium-based networking.

- **Image**: `ghcr.io/data-alliance/init-kubectl:1.28.0`  
- **Main Command**: `/bin/sh -c "until kubectl get pod ...; do sleep; done"`  
- **Purpose**: Ensures reliable deployment of workloads dependent on Cilium networking  
- **Image Pull Policy**: `Always`

---

# 요약 (Summary)
이 프로젝트는 Kubernetes 환경에서 Cilium 네트워크 플러그인이 완전히 실행될 때까지 기다리는 초기화 컨테이너(initContainer)를 제공합니다. 컨테이너는 kubectl 명령어를 사용해 kube-system 네임스페이스에서 k8s-app=cilium 레이블을 가진 파드의 상태를 확인하며, 모든 파드가 Running 상태가 될 때까지 대기합니다. 이를 통해 Cilium 기반 네트워크가 준비된 후 애플리케이션 배포를 보장합니다.

- **이미지**: 'ghcr.io/data-alliance/init-kubectl:1.28.0'
- **주요 명령어**: '/bin/sh -c "until kubectl get pod ...; do sleep; done"'
- **용도**: 'Cilium 네트워크 의존성을 가진 워크로드의 안정적인 배포'
- **이미지 풀 정책**: 'Always'- 
