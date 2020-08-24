from git import Repo
import os
os.system('ruby bug_fix_ruby.rb')
repo_dir = "ls"
repo = Repo(repo_dir,search_parent_directories=True)
file_list = ['log.txt']
commit_message = "Testing Scenarios Logs"
repo.index.add(file_list)
repo.index.commit(commit_message)
origin = repo.remote('origin')
origin.push()
