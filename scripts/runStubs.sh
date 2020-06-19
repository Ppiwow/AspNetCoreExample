# Provide the Spring Cloud Contract Docker version
SC_CONTRACT_DOCKER_VERSION="2.2.3.RELEASE"
# The IP at which the app is running and Docker container can reach it
APP_IP="host.docker.internal"
# Spring Cloud Contract Stub Runner properties
STUBRUNNER_PORT="8083"
# Stub coordinates 'groupId:artifactId:version:classifier:port'
STUBRUNNER_IDS="com.example:customer-service:0.0.1.RELEASE:stubs:9876"
STUBRUNNER_REPOSITORY_ROOT="http://${APP_IP}:8010/artifactory/libs-release-local"
# Run the docker with Stub Runner Boot
docker run  --rm -e "STUBRUNNER_IDS=${STUBRUNNER_IDS}" -e "STUBRUNNER_REPOSITORY_ROOT=${STUBRUNNER_REPOSITORY_ROOT}" -e "STUBRUNNER_STUBS_MODE=REMOTE" -p "8012:${STUBRUNNER_PORT}" -p "8011:9876" springcloud/spring-cloud-contract-stub-runner:"${SC_CONTRACT_DOCKER_VERSION}"