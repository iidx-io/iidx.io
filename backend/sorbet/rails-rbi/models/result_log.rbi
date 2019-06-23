# This is an autogenerated file for dynamic methods in ResultLog
# Please rerun rake rails_rbi:models to regenerate.
# typed: strong

class ResultLog::Relation < ActiveRecord::Relation
  include ResultLog::NamedScope
  extend T::Generic
  Elem = type_member(fixed: ResultLog)
end

class ResultLog < ApplicationRecord
  extend T::Sig
  extend T::Generic
  extend ResultLog::NamedScope
  Elem = type_template(fixed: ResultLog)

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

  sig { returns(Result) }
  def result(); end

  sig { params(value: Result).void }
  def result=(value); end

  sig { returns(Integer) }
  def result_id(); end

  sig { params(value: Integer).void }
  def result_id=(value); end

  sig { returns(T.nilable(Integer)) }
  def score(); end

  sig { params(value: T.nilable(Integer)).void }
  def score=(value); end

  sig { returns(User) }
  def user(); end

  sig { params(value: User).void }
  def user=(value); end

  sig { returns(Integer) }
  def user_id(); end

  sig { params(value: Integer).void }
  def user_id=(value); end

end


module ResultLog::NamedScope
  extend T::Sig

  sig { returns(ResultLog::Relation) }
  def all(); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def select(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def order(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def reorder(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def group(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def limit(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def offset(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def joins(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def left_joins(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def left_outer_joins(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def where(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def rewhere(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def preload(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def eager_load(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def includes(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def from(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def lock(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def readonly(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def extending(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def or(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def having(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def create_with(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def distinct(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def references(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def none(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def unscope(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def merge(*args, block); end

  sig { params(args: T.untyped, block: T.nilable(T.proc.void)).returns(ResultLog::Relation) }
  def except(*args, block); end

end

