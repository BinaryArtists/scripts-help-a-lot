#如果是直接执行shell脚本，则指定源文件路径；如果是加到RunScript中，则取消RunScript的注释，并注释掉对应的字段

#appledoc Xcode script
# Start constants
company="Alisports";
companyID="com.alisports";
companyURL="http://www.alisports.com";
target="iphoneos";
projectName="AEHybridEngine";
#projectName=${PROJECT_NAME};#RunSciprt
#target="macosx";
outputPath=$(cd `dirname $0`; pwd);#输出地址
# End constants
/usr/local/bin/appledoc \
--project-name "${projectName}" \
--project-company "${company}" \
--company-id "${companyID}" \
--docset-atom-filename "${company}.atom" \
--docset-feed-url "${companyURL}/${company}/%DOCSETATOMFILENAME" \
--docset-package-url "${companyURL}/${company}/%DOCSETPACKAGEFILENAME" \
--docset-fallback-url "${companyURL}/${company}" \
--output "${outputPath}" \
--publish-docset \
--docset-platform-family "${target}" \
--logformat xcode \
--keep-intermediate-files \
--no-repeat-first-par \
--no-warn-invalid-crossref \
--exit-threshold 2 \
../Classes
#源文件路径
#RunScript#"${PROJECT_DIR}"
