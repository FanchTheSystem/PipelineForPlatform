#!/usr/bin/env bash
set -ex

if [ -z ${Project} ]
then
    Project=Platform
fi

if [ -z ${Name} ]
then
    Name=master
fi

if [ -z ${Branch} ]
then
    Branch=master
fi

if [ -z ${LIREPOPATH} ]
then
    LIREPOPATH=/tmp
fi

# Source
if [ -z ${TargetRepo} ]
then
    TargetRepo=${LIREPOPATH}/private/${Project}
fi
mkdir -p ${TargetRepo}
cd ${TargetRepo}
TargetRepo=$(pwd) #if previous workDir was a relative or symbolic path

if [ -n "${Source}" -a -d "${Source}" ]
then
    cd ${Source}

    Filename=${TargetRepo}/${Project}_${Name}_${Branch}.tar.gz

    rm -f ${Filename}

    tar -czf ${Filename} ./*

    sha256sum ${Filename} > ${Filename}.sha256.txt
# -h

fi
