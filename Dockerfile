FROM bitnami/kubectl
LABEL maintainer "John Pape <jpapejr@icloud.com>"
entrypoint kubectl get secret -n $SOURCE_NAMESPACE $SOURCE_SECRET -o yaml | sed "s/name: $SOURCE_SECRET/name: $TARGET_SECRET/" | sed "s/namespace: $SOURCE_NAMESPACE/namespace: $TARGET_NAMESPACE/" | kubectl apply -f - --force