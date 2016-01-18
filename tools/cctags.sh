#!/bin/sh
OUT_PATH=${PWD}
SRC_PATH=${PWD}

if [ -d ${OUT_PATH} ];
then
    echo "Use current directory \"${OUT_PATH}\""
else
    echo "mkdir \"${OUT_PATH}\""
    mkdir ${OUT_PATH}
fi

if [ -d ${SRC_PATH}/frameworks \
    -a -d ${SRC_PATH}/packages \
    -a -d ${SRC_PATH}/hardware \
    -a -d ${SRC_PATH}/system \
    -a -d ${SRC_PATH}/libcore \
    -a -d ${SRC_PATH}/dalvik \
    -a -d ${SRC_PATH}/art ];
then
    echo "Found framework packages hardware and system directory!!"
    find -L ${SRC_PATH}/frameworks -name "*.h" -o -name "*.cpp" -o -name "*.cc" -o -name \
        "*.c" -o -name "*.java" -o -name "*.mk"|grep -vi '\.git' >${OUT_PATH}/names.file
    echo "framework scann finish!"
    find -L ${SRC_PATH}/packages -name "*.h" -o -name "*.cpp" -o -name "*.cc" -o -name \
        "*.c" -o -name "*.java" -o -name "*.mk"|grep -vi '\.git' >>${OUT_PATH}/names.file
    echo "packages scann finish!!"
    find -L ${SRC_PATH}/hardware -name "*.h" -o -name "*.cpp" -o -name "*.cc" -o -name \
        "*.c" -o -name "*.java" -o -name "*.mk"|grep -vi '\.git' >>${OUT_PATH}/names.file
    echo "hardware scann finish!!"
    find -L ${SRC_PATH}/system -name "*.h" -o -name "*.cpp" -o -name "*.cc" -o -name \
        "*.c" -o -name "*.java" -o -name "*.mk"|grep -vi '\.git' >>${OUT_PATH}/names.file
    echo "system scann finish!!"
    find -L ${SRC_PATH}/libcore -name "*.h" -o -name "*.cpp" -o -name "*.cc" -o -name \
        "*.c" -o -name "*.java" -o -name "*.mk"|grep -vi '\.git' >>${OUT_PATH}/names.file
    echo "libcore scann finish!!"
    find -L ${SRC_PATH}/dalvik -name "*.h" -o -name "*.cpp" -o -name "*.cc" -o -name \
        "*.c" -o -name "*.java" -o -name "*.mk"|grep -vi '\.git' >>${OUT_PATH}/names.file
    echo "dalvik scann finish!!"
    find -L ${SRC_PATH}/art -name "*.h" -o -name "*.cpp" -o -name "*.cc" -o -name \
        "*.c" -o -name "*.java" -o -name "*.mk"|grep -vi '\.git' >>${OUT_PATH}/names.file
    echo "art scann finish!!"

    echo "sytstem scann finish!!"
else
    echo "Please run this script under the root of your project!!!"
fi

echo "For create ctags databases.."
ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q -L ${OUT_PATH}/names.file -f ${OUT_PATH}/tags
echo "for create cscope databases.."
cscope -Rbq -i names.file
echo "DONE!!"
