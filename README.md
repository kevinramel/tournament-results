# tournament-results
Database schema to store the game matches between players. Code to query this data and determine the winners of various games.

To open project:

1. Download and extract folder to your preferred folder.
2. Open terminal
3. Change your directory to {your folder}/tournament-results/vagrant

Useful Commands: cd - for changing preferred directory
		  ls - for listing the files and directories of the current folder
		  clear - erase all the text in terminal to make it easier to read

4. Enter the following commands one by one:
	1. vagrant up
	2. vagrant ssh
	3. cd /vagrant/tournament
	4. psql
	5. \i tournament.sql
	6. \q
	7. python tournament_test.py
