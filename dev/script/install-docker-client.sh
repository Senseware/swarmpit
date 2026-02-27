version=${DOCKER_VERSION:-"29.0.0"}
case $(uname -m) in
    armv6*)  arch=armhf ;;
    armv7*)  arch=armhf ;;
    armv8*)  arch=aarch64 ;;
    arm64*)  arch=aarch64 ;;
    aarch64) arch=aarch64 ;;
    *)       arch=x86_64 ;;
esac
arch=${ARCH:-$arch}
url=https://download.docker.com/linux/static/stable/"$arch"/docker-"$version".tgz
echo installing $url
cd /tmp || exit
curl -fsSL "$url" | tar xz docker/docker
mv docker/docker /usr/bin/docker
