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
                questions (f_name, l_name)
            VALUES
                (?, ?)
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

end