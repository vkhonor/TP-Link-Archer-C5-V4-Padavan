# Get latest zapret release tag without GitHub API
ZAPRET_TAG="$(git ls-remote --tags --sort='v:refname' \
  https://github.com/bol-van/zapret.git 'v[0-9]*' |
  sed 's#.*refs/tags/##' |
  grep -E '^v[0-9]+\.[0-9]+$' |
  tail -1)"

if [[ -z "$ZAPRET_TAG" ]]; then
  echo "ERROR: Failed to get latest zapret release"
  exit 1
fi

SRC_VER="${ZAPRET_TAG#v}"

echo "Latest zapret release: $ZAPRET_TAG"
echo "Using SRC_VER: $SRC_VER"

sed -i "s/^SRC_VER.*/SRC_VER = $SRC_VER/" \
  padavan-ng/trunk/user/nfqws/Makefile

cd padavan-ng/trunk/user/nfqws

find . -maxdepth 1 \
  -not -name Makefile \
  -not -name patches \
  -print0 | xargs -0 rm -rf --
