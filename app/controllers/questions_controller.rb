class QuestionsController < ApplicationController
  QUESTIONS = [
    {"rodzaj komputera" => ["laptop", "ultrabook", "PC", "All-In-One"], "pytanie" => "Jaki rodzaj komputera?"},
    {"rodzaje uzytkowania" => ["praca", "rozrywka"], "pytanie" => "Do czego używasz komputera?"},
    {"praca" => ["grafika", "programowanie", "biuro"], "pytanie" => "Przeznaczenie komputera w pracy"},
    {"grafika" => ["zdjecia", "filmy"], "pytanie" => "Jaki rodzaj grafiki?"},
    {"rozrywka" => ["gry komputerowe", "multimedia", "internet"], "pytanie" => "Do czego używasz komputera jako rozrywki?"},
    {"programowanie" => ["gier", "stron", "aplikacji"], "pytanie" => "Programowanie:"},
    {"multimedia" => ["filmy", "zdjecia", "muzyka"], "pytanie" => "Jakiego rodzaju multimedia?"}
  ]

  def index
    @end_consequents = []
    @option = QUESTIONS.find do |o|
      o.keys.flatten.first == params[:selection]
    end
    consequent = params[:selection]
    components = Rule.where(antedecent: consequent).map{|c| Component.where(name: c.category, value: c.consequent)}.flatten.uniq
    @result = if components.empty?
                find_end_consequents(consequent)
                Rule.where(antedecent: @end_consequents).map{|c| Component.where(name: c.category, value: c.consequent)}.flatten.uniq
              else
                components
              end
    @saved_type = if params[:selection].in?(["laptop", "ultrabook", "PC", "All-In-One"])
                    params[:selection]
                  else
                    params[:saved_type]
                  end
    @option ||= if @saved_type
                  QUESTIONS.second
                else
                  QUESTIONS.first
                end
  end

  def find_end_consequents(consequent)
    Rule.where(antedecent: consequent).each do |rule|
      rule.consequent.each do |new_consequent|
        if Rule.where(antedecent: new_consequent).map{|c| Component.where(name: c.category, value: c.consequent)}.flatten.uniq.empty?
          find_end_consequents(new_consequent)
        else
          @end_consequents << new_consequent
        end
      end
    end
  end
end
