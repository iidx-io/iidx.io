# This is an autogenerated file for dynamic methods in Result
# Please rerun rake rails_rbi:models to regenerate.
# typed: strong

class Result::Relation < ActiveRecord::Relation
  include Result::NamedScope
  extend T::Generic
  Elem = type_member(fixed: Result)
end

class Result < ApplicationRecord
  extend T::Sig
  extend T::Generic
  extend Result::NamedScope
  Elem = type_template(fixed: Result)

  sig { returns(DateTime) }
  def created_at(); end

  sig { params(value: DateTime).void }
  def created_at=(value); end

  sig { returns(Integer) }
  def id(); end

  sig { params(value: Integer).void }
  def id=(value); end

  sig { returns(DateTime) }
  def last_played_at(); end

  sig { params(value: DateTime).void }
  def last_played_at=(value); end

  sig { returns(Map) }
  def map(); end

  sig { params(value: Map).void }
  def map=(value); end

  sig { returns(Integer) }
  def map_id(); end

  sig { params(value: Integer).void }
  def map_id=(value); end

  sig { returns(T.nilable(Integer)) }
  def miss_count(); end

  sig { params(value: T.nilable(Integer)).void }
  def miss_count=(value); end

  sig { returns(T.nilable(ResultBatch)) }
  def result_batch(); end

  sig { params(value: T.nilable(ResultBatch)).void }
  def result_batch=(value); end

  sig { returns(T.nilable(Integer)) }
  def result_batch_id(); end

  sig { params(value: T.nilable(Integer)).void }
  def result_batch_id=(value); end

  sig { returns(ResultLog::Relation) }
  def result_logs(); end

  sig { params(value: T.any(T::Array[ResultLog], ResultLog::Relation)).void }
  def result_logs=(value); end

  sig { returns(T.nilable(Integer)) }
  def score(); end

  sig { params(value: T.nilable(Integer)).void }
  def score=(value); end

  sig { returns(DateTime) }
  def updated_at(); end

  sig { params(value: DateTime).void }
  def updated_at=(value); end

  sig { returns(User) }
  def user(); end

  sig { params(value: User).void }
  def user=(value); end

  sig { returns(Integer) }
  def user_id(); end

  sig { params(value: Integer).void }
  def user_id=(value); end

end


module Result::NamedScope
  extend T::Sig

  sig { returns(Result::Relation) }
  def all(); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def select(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def order(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def reorder(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def group(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def limit(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def offset(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def joins(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def left_joins(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def left_outer_joins(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def where(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def rewhere(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def preload(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def eager_load(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def includes(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def from(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def lock(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def readonly(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def extending(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def or(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def having(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def create_with(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def distinct(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def references(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def none(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def unscope(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def merge(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(Result::Relation) }
  def except(*args, block); end

end

