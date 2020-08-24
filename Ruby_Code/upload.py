from git import Repo

repo_dir = "wisdompets"
repo = Repo(repo_dir,search_parent_directories=True)
file_list = ['log.txt']
commit_message = "Testing Scenarios"
repo.index.add(file_list)
repo.index.commit(commit_message)
origin = repo.remote('origin')
origin.push()