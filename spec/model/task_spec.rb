require 'spec_helper'

describe Task do
  before { @task = Task.new(title: "Walk the dog", completed: true) }

  subject { @task }

  it { should respond_to(:completed) }
  it { should respond_to(:title) }
  it { should be_valid }

  describe "validations" do
    describe "title" do
      describe "not present" do
        before { @task.title = " "}
        it { should_not be_valid }
      end

      describe "too short" do
        before { @task.title = "a" * 2 }
        it { should_not be_valid }
      end

      describe "too long" do # <= 254
        before { @task.title = "a" * 255 }
        it { should_not be_valid }
      end

      describe "completed" do
        it "false by default" do #this a note --- if you run test, it will show up as pending (yellow*)
          new_task = Task.new(title: "Walk the dog")
          expect(new_task.completed).to be_falsey
        end
      end
   
      describe "due_at" do
        it "has default of day created" do
          new_task = Task.create(title: "goto store")
          expect(new_task.due_at).to be_tr
    end
  end
end
