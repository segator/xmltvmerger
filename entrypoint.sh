#!/bin/bash
#!/bin/bash
set -e
mkdir /data
git config --global user.email "root"
git config --global user.name "root"

IFS=';'
read -ra GITREPOARRAY <<< "$GIT_REPO_LIST"
i=0
for j in "${GITREPOARRAY[@]}"; do
  echo "cloning ${j}.."
  /initrepo.sh "$j" $i
  i=i+1
done

cd /data
i=0
output=""
for filename in /data/*.xml; do
if [ $i -eq 0 ]
then
  output=$filename
else
  tv_merge -i $output -m $filename -o output.xml
  cp output.xml output_init.xml
  $output=output_init.xml
fi
i=i+1
done




git clone  $GIT_REPO_OUTPUT -b master merge
cd merge
git checkout --orphan new-master
cp /data/output.xml guide.xml
git add .
git commit -m "Update"
git branch -m master old-master
git branch -m new-master master
git push --force --set-upstream origin master
git branch -D old-master
git push
