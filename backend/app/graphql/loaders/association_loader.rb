# frozen_string_literal: true

# https://github.com/Shopify/graphql-batch/blob/v0.4.1/examples/association_loader.rb
module Loaders
  class AssociationLoader < GraphQL::Batch::Loader
    def self.validate(*args, **kwargs)
      new(*args, **kwargs)
      nil
    end

    def self.loader_key_for(*args, scope: nil)
      super(*args, scope: scope&.to_sql)
    end

    def initialize(model, association_name, scope: nil)
      @model = model
      @association_name = association_name
      @scope = scope
      validate
    end

    def load(record)
      raise TypeError, "#{@model} loader can't load association for #{record.class}" unless record.is_a?(@model)
      return Promise.resolve(read_association(record)) if association_loaded?(record)

      super
    end

    # We want to load the associations on all records, even if they have the same id
    def cache_key(record)
      record.object_id
    end

    def perform(records)
      preload_association(records)
      records.each { |record| fulfill(record, read_association(record)) }
    end

    private

    def validate
      raise ArgumentError, "No association #{@association_name} on #{@model}" unless @model.reflect_on_association(@association_name)
    end

    def preload_association(records)
      ::ActiveRecord::Associations::Preloader.new.preload(records, @association_name, preload_scope)
    end

    # this is from the graphql preloader gem
    def preload_scope
      return nil unless @scope

      reflection = @model.reflect_on_association(@association_name)
      raise ArgumentError, 'Cannot specify preload_scope for polymorphic associations' if
        reflection.polymorphic?

      @scope if @scope&.klass == reflection.klass
    end

    def read_association(record)
      record.public_send(@association_name)
    end

    def association_loaded?(record)
      record.association(@association_name).loaded?
    end
  end
end
