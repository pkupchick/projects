require_relative 'questions_database.rb'

class Questions

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |datum| Questions.new(datum)}
    end

    def initialize(hash)
        @id = hash['id']
        @title = hash['title']
        @body = hash['body']
        @users_id = hash['users_id']
    end

    def create
        raise "Question already exists" if @id
        QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @users_id)
            INSERT INTO
                questions (title, body, users_id)
            VALUES
                (?, ?, ?)
        SQL
        @id = QuestionsDatabase.instance.last_insert_row_id
    end

    def self.find_by_id(ids)
        questions = QuestionsDatabase.instance.execute(<<-SQL, ids)
            SELECT
                *
            FROM
                questions
            WHERE
                questions.id = ?
        SQL
        questions.empty? ? nil : Questions.new(questions.first)
    end

    def self.find_by_author_id(users_id)
       all_questions = QuestionsDatabase.instance.execute(<<-SQL, users_id)
        SELECT
            *
        FROM
            questions
        WHERE
            questions.users_id = ?
        SQL

        all_questions.map { |question| Questions.new(question) }

    end

    def author  #--> row inside questions column @users_id ==> number
        author = QuestionsDatabase.instance.execute(<<-SQL, @users_id)
            SELECT
                f_name, l_name
            FROM
                users
            WHERE
                users.id = ?
        SQL
        author.first.values.join(" ")
    end

    def replies #Reply:: find by question id
    end
        
end