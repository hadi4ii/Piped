# bump version
docker run --rm -v "$PWD"/docker:/app treeder/bump patch
version=`cat docker/VERSION`
echo "version: $version"

# tag it
git add docker/VERSION
git commit -m "version $version"
git tag -a "$version" -m "version $version"
git push
git push --tags
