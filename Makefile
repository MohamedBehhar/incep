all: create_folders copy_files

create_folders:
ifneq ("$(wildcard /home/moha/data)","")
	echo "The /home/moha/data directory already exists."
else
	mkdir -p /home/moha/data
endif
ifneq ("$(wildcard /home/moha/data/mariadb_data)","")
	echo "The /home/moha/data/mariadb_data directory already exists."
else
	mkdir -p /home/moha/data/mariadb_data
endif
