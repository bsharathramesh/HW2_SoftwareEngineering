# The setup.py file describes the metadata of the project. 

from distutils.core import setup

setup(
	name='Code',
	version='1.0',
	description='CSC 510 Software Engineering Group Homework 2',
 	author='Sharath BR',
	author_email='sbangal2@ncsu.edu',
	url='https://github.com/bsharathramesh/HW2_SoftwareEngineering',
	packages=['code'],
	classifiers=[
		"MIT License",
		"Programming Languages :: Python, Ruby, Julia, Swift",
		"Topic :: Software Engineering Course",
	],
	license="MIT",
	install_requires = [
		'numpy',
		'django'
    'ruby'
    'julia'
    'swift'
	]
      )
