require "sqlite3"
require_relative "questions.rb"
require_relative "replies.rb"
require 'singleton'
class QuestionsDatabase < SQLite3::Database
include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Users

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map { |datum| Users.new(datum)}
    end

    def initialize(hash)
        @id = hash['id']
        @f_name = hash['f_name']
        @l_name = hash['l_name']
    end

    def create
        raise "User already exists" if @id
        QuestionsDatabase.instance.execute(<<-SQL, @f_name, @l_name)
            INSERT INTO
                users (f_name, l_name)
            VALUES
                (?, ?)
        SQL
        @id = QuestionsDatabase.instance.last_insert_row_id
    end

    def self.find_by_id(ids)
        users = QuestionsDatabase.instance.execute(<<-SQL, ids)
            SELECT
                *
            FROM
                users
            WHERE
                users.id = ?
        SQL
        users.empty? ? nil : Users.new(users.first)
    end

    def self.find_by_name(fname, lname)
        users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT
          *
        FROM
          users
        WHERE
          users.f_name = ? AND users.l_name = ?
        SQL
        users.map {|user| Users.new(user)}
    end

    def authored_questions #use question::find_by_author_id
        Questions.find_by_author_id(@id)
    end

    def authored_replies #Reply::find_by_user_id
        Replies.find_by_user_id(@id)
    end
end

