from git import Repo
import os
os.system('julia HW2_Julia_G19.jl')
repo_dir = ""
repo = Repo(repo_dir,search_parent_directories=True)

#Please Enter The absolute path of the log.txt file here!
file_list = ['/home/amoghrd/HW2_SoftwareEngineering/Julia_Code/log.txt']

commit_message = "Testing Scenarios Logs"
repo.index.add(file_list)
repo.index.commit(commit_message)
origin = repo.remote('origin')
origin.push()

