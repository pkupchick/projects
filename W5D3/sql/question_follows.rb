require_relative 'questions_database.rb'


class QuestionFollows

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        data.map { |datum| QuestionFollows.new(datum)}
    end

    def initialize(hash)
        @id = hash['id']
        @users_id = hash['users_id']
        @questions_id = hash['questions_id']
    end

    def create
        raise "Question already exists" if @id
        QuestionsDatabase.instance.execute(<<-SQL, @users_id, @questions_id)
            INSERT INTO
                question_follows (users_id, questions_id)
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
                question_follows
            WHERE
                question_follows.id = ?
        SQL
        questions.empty? ? nil : QuestionFollows.new(questions.first)
    end

    def self.followers_for_question_id(question_id)
        followers_by_q = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT DISTINCT
                f_name, l_name
            FROM
                question_follows
            JOIN
                questions ON question_follows.users_id = questions.users_id
            JOIN
                users ON questions.users_id = users.id
            WHERE
                question_follows.id = ?
                
        SQL
        followers_by_q.map { |one| Users.new(one) }
    end

end