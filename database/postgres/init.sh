#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	DROP DATABASE IF EXISTS consumer_java;  
	CREATE DATABASE consumer_java;
	\c consumer_java;
	create table customer (
		id uuid not null primary key,
		name text not null,
		active bool not null,
		created_at timestamp not null ,
		updated_at timestamp not null
	);

	DROP DATABASE IF EXISTS consumer_go;  
	CREATE DATABASE consumer_go;
	\c consumer_go;
	create table customer (
		id uuid not null primary key,
		name text not null,
		active bool not null,
		created_at timestamp not null ,
		updated_at timestamp not null
	);

	DROP DATABASE IF EXISTS consumer_quarkus;  
	CREATE DATABASE consumer_quarkus;
	\c consumer_quarkus;
	create table customer (
		id uuid not null primary key,
		name text not null,
		active bool not null,
		created_at timestamp not null ,
		updated_at timestamp not null
	);

	DROP DATABASE IF EXISTS clean_arch_go;  
	CREATE DATABASE clean_arch_go;
EOSQL
