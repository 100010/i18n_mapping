require "i18n_mapping/version"
require 'pry'
require 'yaml'
require 'erb'

I18nMapping.execute(:en)
module I18nMapping
  class InvalidLanguageError < StandardError ; end
  class << self

    AVALILABLE_LANGUAGE = [ :ja, :en, :zh ]

    def initialize(language, )

    end
    def execute(*args)
      valid_lang?(args)
      create_dir(args)
      write_model_atrribute
    end

    def model_names
      ActiveRecord::Base.connection.tables.map do |model|
        model.singularize
      end
    end

    def create_dir(langages)
      langages.each do |langage|
        model_names.each do |model_name|
          Rails.root + 'config/locales/models'
          path = dist_path(model_name) + langage.to_s
          FileUtils.mkdir_p(path) unless directory_exists?(path)
        end
      end
      true
    rescue
      false
    end

    def write_model_atrribute(languages)
      languages.each do |lang|
        model_names.each do |model_name|
          dist_path(model_name)
          render_yml(model_name, lang)
        end
        true
      end　rescue false
    end

    def render_yml(model_name, lang)
      columns = model_name.classify.constantize.attribute_names
      File.write(dist_path(model_name) + lang, et.render(File.read(tmp_ansi_path + 'inventory')))
      ERB
        .new(model_name,columns,lang)
        .result(binding)
        .render(File.read(tmp_ansi_path + 'inventory'))
    end

    def valid_lang?(langages)
      unless langages.all?{ |lang| lang.to_sym.in? AVALILABLE_LANGUAGE }
        raise InvalidLanguageError.new('Arguments you passed included invalid language')
      end
    end

    def copy_template
    end

    def directory_exists?(path)
      File.directory?(path)
    end

    def dist_path(model_name)
      Rails.root + 'config/locales/models' + model_name
    end
  end
end
