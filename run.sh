set -e

curl -o actions-runner-linux-arm64-2.336.0.tar.gz -L \
  https://github.com/actions/runner/releases/download/v2.336.0/actions-runner-linux-arm64-2.336.0.tar.gz

tar -xzf actions-runner-linux-arm64-2.336.0.tar.gz

chmod +x config.sh

./config.sh \
  --url https://github.com/Qubuhub-org/cloud \
  --token "$RUNNER_TOKEN"
