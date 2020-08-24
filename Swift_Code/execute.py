from git import Repo
import os
import time

os.system('swiftc -suppress-warning -o main buggy_main.swift')

time.sleep(2)

os.system('./main')

repo_dir = ""
repo = Repo(repo_dir,search_parent_directories=True)

#Please Enter The absolute path of the log.txt file here!
file_list = ['/home/mvijaya2/Mangal/log.txt']

commit_message = "Testing Swift Scenarios Logs"
repo.index.add(file_list)
repo.index.commit(commit_message)
origin = repo.remote('origin')
origin.push()
