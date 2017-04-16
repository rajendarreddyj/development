svn-cheatsheet
===================

A cheatsheet on the usage of svn.

# revert ALL changes recursively
svn revert -R .
 
# undo multiple commits
svn merge -c -REV_X,-REV_Y,-REV_Z .
svn commit -m "reverted revisions x, y, z" 
