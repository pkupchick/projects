require_relative 'questions_database.rb'


class Replies

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map { |datum| Replies.new(datum)}
    end

    attr_accessor :question_id, :parent_reply_id, :users_id, :body
    attr_reader :id
    def initialize(hash)
        @id = hash['id']
        @question_id = hash['question_id']
        @parent_reply_id = hash['parent_reply_id']
        @users_id = hash['users_id']
        @body = hash['body']
    end

    def create
        raise "Reply already exists" if @id
        QuestionsDatabase.instance.execute(<<-SQL, @question_id, @parent_reply_id, @users_id, @body)
            INSERT INTO
                replies (questions_id, parent_reply_id, users_id, body)
            VALUES
                (?, ?, ?, ?)
        SQL
        @id = QuestionsDatabase.instance.last_insert_row_id
    end

    def self.find_by_id(ids)
        replies = QuestionsDatabase.instance.execute(<<-SQL, ids)
            SELECT
                *
            FROM
                replies
            WHERE
                replies.id = ?
        SQL
        replies.empty? ? nil : Replies.new(replies.first)
    end

    def self.find_by_user_id(ids)
        replies = QuestionsDatabase.instance.execute(<<-SQL, ids)
        SELECT
            *
        FROM
            replies
        WHERE
            users_id = ?
        SQL
        replies.map { |reply| Replies.new(reply) }
    end

    def self.find_by_question_id(question_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            *
        FROM
            replies
        WHERE
            question_id = ?
        SQL
        replies.map { |reply| Replies.new(reply) }
    end

    def author
        User.find_by_id(users_id)
    end

    def question 
        Question.find_by_user_id(users_id)
    end



end