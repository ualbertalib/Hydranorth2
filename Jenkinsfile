#!groovy
node {
  stage 'checkout source and unit test'
  checkout scm
  sh 'git rev-parse --short HEAD > commit'
  def sha1 = readFile('commit').trim()
  build job: 'hydranorth2-test', parameters: [[$class: 'StringParameterValue', name: 'sha1', value: "${sha1}"]]

  stage 'deploy to vm'
  build job: 'hydranorth2-deploy', parameters: [[$class: 'StringParameterValue', name: 'GIT_BRANCH', value: "${sha1}"]], propogate: false
}
