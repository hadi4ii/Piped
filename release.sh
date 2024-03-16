if [ -z "$1" ]
  then
    # bump version
    docker run --rm -v "$PWD"/docker:/app treeder/bump patch
    version=`cat docker/VERSION`
    git add docker/VERSION
    git commit -m "version $version"
else
    version=$1
fi

echo "version: $version"

# tag it
git tag -a "$version" -m "version $version"
git push
git push --tags
