# **Scala Checkstyle GitHub Action**

This action aims to runs [scalastyle](http://www.scalastyle.org/) with [reviewdog](https://github.com/reviewdog/reviewdog) on push.

Example:

[![github-pr-check sample](https://user-images.githubusercontent.com/6826684/107879090-1a1c0500-6ed7-11eb-9260-14acdc94ad36.png)](https://github.com/nikitasavinov/checkstyle-action/pull/2/files)


## Input

### `checkstyle_version`

Optional. 

[Checkstyle config](http://www.scalastyle.org/command-line.html)
Default is `2.12` (2.10 & 2.11 are also available).

### `level`

Optional. 

Report level for reviewdog [info,warning,error].
It's same as `-level` flag of reviewdog.
Default is `info`

### `reporter`

Optional.

Reporter of reviewdog command [github-pr-check,github-pr-review, github-check].
It's same as `-reporter` flag of reviewdog. Dictates when should reviewdog run in the pipeline.
Default is `github-check` that runs on each push.

### `tool_name`
    
Optional.

Name of the report published from reviewdog.
Default is 'reviewdog'.

### `workdir`
Optional.

Working directory relative to the root directory.
Default is `.`

### `scalastyle_path`
Optional.

Custom path to the scalastyle config file.
Deafult is [scalastyle config](http://www.scalastyle.org/configuration.html)

## Example usage

``` yml
on: pull_request

jobs:
  checkstyle_job:
    runs-on: ubuntu-latest
    name: Scalastyle job
    steps:
    - name: Checkout
      uses: actions/checkout@v2
    - name: Run scala check style
      uses: andre-santos-fd/scalastyle-action@main
      with:
        reporter: 'github-check'
        tool_name: 'Scala Test Report'
        checkstyle_version: '2.10'
        workdir: src/main/scala
        level: warning
```