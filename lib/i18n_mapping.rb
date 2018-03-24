require "i18n_mapping/version"

module I18nMapping
  class InvalidLanguageError < StandardError ; end
  class << self

    AVALILABLE_LANGUAGE = [ :ja, :en, :zh ]

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
    end

    def write_model_atrribute
      model_names.each do |model_name|
        dist_path(model_name)
      end
    end

    def render(template)
      ERB.new(template).result(binding)
    end

    def valid_lang?(langages)
      unless langages.all?{ |lang| lang.to_sym.in? AVALILABLE_LANGUAGE }
        raise InvalidLanguageError.new('Includes invalid language')
      end
    end

    def directory_exists?(path)
      File.directory?(path)
    end

    def dist_path(model_name)
      Rails.root + 'config/locales/models' + model_name
    end
  end
end
