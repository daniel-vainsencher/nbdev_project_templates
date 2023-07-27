echo "The commands below do a lot of destructive modification of your file system, review before running them"
exit
export new_name=$1
git clone nbdev_project_templates $new_name
cd $new_name
mv nbdev_project_templates $new_name
grep -R --files-with-matches nbdev_project_templates | grep -v ".git" | xargs -I {} sed "s/nbdev_project_templates/$new_name/g" -i {}
echo "You DEFINITELY should manually fixup your settings.ini file, in particular the following lines (but not only):"
grep review settings.ini
# ??? rm -fr .git
echo "AFTER you ensure your project won't try to publish itself under apache license to someone elses github (by fixing settings.ini), you should also initialize the git repo, since we've just deleted .git."
  
