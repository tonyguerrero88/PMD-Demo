FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget unzip openjdk-11-jdk && wget https://github.com/pmd/pmd/releases/download/pmd_releases%2F6.45.0/pmd-bin-6.45.0.zip && unzip pmd-bin-6.45.0.zip
#COPY .github/workflows/rulesets.xml /rulesets.xml
ENTRYPOINT ["/pmd-bin-6.45.0/bin/run.sh" , "pmd"]


