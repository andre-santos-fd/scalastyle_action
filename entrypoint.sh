#!/bin/sh

echo "Running check"

cd "${GITHUB_WORKSPACE}" || exit 1

git config --global --add safe.directory $GITHUB_WORKSPACE

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

wget -O - -q https://oss.sonatype.org/content/repositories/releases/org/scalastyle/scalastyle_${INPUT_CHECKSTYLE_VERSION}/1.0.0/scalastyle_${INPUT_CHECKSTYLE_VERSION}-1.0.0-batch.jar > /scalastyle.jar
wget -O - -q http://www.scalastyle.org/scalastyle_config.xml > /scalastyle_config.xml


if [ ${INPUT_DEBUG} == "true" ]; then
  exec java -jar /scalastyle.jar --config /scalastyle_config.xml "${INPUT_WORKDIR}"
fi

exec java -jar /scalastyle.jar --config /scalastyle_config.xml "${INPUT_WORKDIR}" -f xml \
 | reviewdog -efm="%tarning file=%f message=%m line=%l column=%c" \
      -name="${INPUT_TOOL_NAME}" \
      -reporter="${INPUT_REPORTER:-github-check}" \
      -filter-mode="${INPUT_FILTER_MODE:-added}" \
      -fail-on-error="${INPUT_FAIL_ON_ERROR:-false}" \
      -level="${INPUT_LEVEL}"

#if [ "${INPUT_SCALASTYLE_PATH}" == "NONE" ]; then
#  wget -O - -q http://www.scalastyle.org/scalastyle_config.xml > /scalastyle_config.xml
#  exec java -jar /scalastyle.jar --config /scalastyle_config.xml "${INPUT_WORKDIR}"
#else
#  exec java -jar /scalastyle.jar --config "${INPUT_SCALASTYLE_PATH}" "${INPUT_WORKDIR}"
#fi



