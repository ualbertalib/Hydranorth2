#!groovy
node {
  stage 'checkout source and unit test'
  sh 'git rev-parse --short HEAD > commit'
  def sha1 = readFile('commit').trim()
  build job: 'hydranorth2', parameters: [[$class: 'StringParameterValue', name: 'sha1', value: "${sha1}"]]

  stage 'deploy to vm'
  echo 'deploy to vm'
  stage 'load test'
  echo 'load test'
  stage 'cleanup'
  echo 'cleanup'
}
