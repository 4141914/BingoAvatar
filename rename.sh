#!/bin/bash
# 重命名文件计数
handle_file=0
found_mark=0

for file_name in *; do
        # 通过grep的返回值来判断 
        echo "$file_name" | grep -q " "
        if [ $? -eq $found_mark ];then
                fileName=$file_name
                newName=`echo $fileName | sed -e 's/ /_/g'`
                mv "$fileName" $newName
                let "handle_file=$handle_file+1"
        fi
done
echo "$handle_file file renamed."
exit 0
