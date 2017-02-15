# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


API

server_adres = http://localhost:3000

1. All words in json:
GET server_adress/words.json

2. One word in json (required id of word):
GET server_adress/words/word_id.json
	  EX. server_adress/words/1.json

3. Add new word:
POST server_adress/words.json
	raw_json:
	{
	    "definition": "word",
	    "translation": "słowo"
	}

4. Edit word (required id of word):
PUT/PATCH server_adress/words/word_id.json
			EX. server_adress/words/1.json
	raw_json:
	{
	    "definition": "word",
	    "translation": "słowo"
	}

5. Delete word (required id of word):
DELETE server_adress/words/word_id.json
		 EX. server_adress/words/1.json
