#!/bin/sh

echo "Running check"

cd "${GITHUB_WORKSPACE}" || exit 1

git config --global --add safe.directory $GITHUB_WORKSPACE


if [ "${INPUT_SCALASTYLE_PATH}" == "NONE" ]; then
  wget -O - -q http://www.scalastyle.org/scalastyle_config.xml > /scalastyle_config.xml
  CHECKSTYLE_CONF = "${GITHUB_WORKSPACE}/.github/workflows/custom_checkstyle.xml"
else
  CHECKSTYLE_CONF = "${INPUT_SCALASTYLE_PATH}"
fi

wget -O - -q https://oss.sonatype.org/content/repositories/releases/org/scalastyle/scalastyle_${INPUT_CHECKSTYLE_VERSION}/1.0.0/scalastyle_${INPUT_CHECKSTYLE_VERSION}-1.0.0-batch.jar
 > /scalastyle.jar

exec java -jar /scalastyle.jar --config /"${CHECKSTYLE_CONF}" "${INPUT_WORKDIR}"