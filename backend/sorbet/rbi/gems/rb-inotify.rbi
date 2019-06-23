# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strong
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/rb-inotify/all/rb-inotify.rbi
#
# rb-inotify-0.9.10
module INotify
end
module INotify::Native
  def close(*arg0); end
  def fpathconf(*arg0); end
  def inotify_add_watch(*arg0); end
  def inotify_init(*arg0); end
  def inotify_rm_watch(*arg0); end
  def read(*arg0); end
  def self.close(*arg0); end
  def self.fpathconf(*arg0); end
  def self.inotify_add_watch(*arg0); end
  def self.inotify_init(*arg0); end
  def self.inotify_rm_watch(*arg0); end
  def self.read(*arg0); end
  extend FFI::Library
end
class INotify::Native::Event < FFI::Struct
end
module INotify::Native::Flags
  def self.from_mask(mask); end
  def self.to_mask(flags); end
end
class INotify::Notifier
  def close; end
  def fd; end
  def initialize; end
  def process; end
  def read_events; end
  def readpartial(size); end
  def run; end
  def self.supports_ruby_io?; end
  def stop; end
  def to_io; end
  def watch(path, *flags, &callback); end
  def watchers; end
end
class INotify::Watcher
  def callback!(event); end
  def close; end
  def flags; end
  def id; end
  def initialize(notifier, path, *flags, &callback); end
  def notifier; end
  def path; end
end
class INotify::Event
  def absolute_name; end
  def callback!; end
  def cookie; end
  def fix_encoding(name); end
  def flags; end
  def initialize(data, notifier); end
  def name; end
  def notifier; end
  def related; end
  def self.consume(data, notifier); end
  def size; end
  def watcher; end
  def watcher_id; end
end
class INotify::QueueOverflowError < RuntimeError
end
