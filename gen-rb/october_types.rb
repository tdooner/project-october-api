#
# Autogenerated by Thrift Compiler (0.9.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'

module Backend
  # A single post with its calculated weight.
# @param post_id, the unique id of a post.
# @param weight, the "importance" of the post to the querying user [0,1].
  class Post
    include ::Thrift::Struct, ::Thrift::Struct_Union
    POST_ID = 1
    WEIGHT = 2

    FIELDS = {
      POST_ID => {:type => ::Thrift::Types::I64, :name => 'post_id'},
      WEIGHT => {:type => ::Thrift::Types::DOUBLE, :name => 'weight', :optional => true}
    }

    def struct_fields; FIELDS; end

    def validate
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field post_id is unset!') unless @post_id
    end

    ::Thrift::Struct.generate_accessors self
  end

  # A list of posts along with a confidence for the accuracy of the list.
# @param confidence, the confidence in the results.
# @param posts, a list of Posts.
  class PostList
    include ::Thrift::Struct, ::Thrift::Struct_Union
    CONFIDENCE = 1
    POSTS = 2

    FIELDS = {
      CONFIDENCE => {:type => ::Thrift::Types::DOUBLE, :name => 'confidence', :optional => true},
      POSTS => {:type => ::Thrift::Types::LIST, :name => 'posts', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Backend::Post}}
    }

    def struct_fields; FIELDS; end

    def validate
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field posts is unset!') unless @posts
    end

    ::Thrift::Struct.generate_accessors self
  end

  # The queried object does not exist.
  class NotFoundException < ::Thrift::Exception
    include ::Thrift::Struct, ::Thrift::Struct_Union

    FIELDS = {

    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  # There was an error processing the request
  class EngineException < ::Thrift::Exception
    include ::Thrift::Struct, ::Thrift::Struct_Union
    def initialize(message=nil)
      super()
      self.why = message
    end

    def message; why end

    WHY = 1

    FIELDS = {
      WHY => {:type => ::Thrift::Types::STRING, :name => 'why'}
    }

    def struct_fields; FIELDS; end

    def validate
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field why is unset!') unless @why
    end

    ::Thrift::Struct.generate_accessors self
  end

  # Request took too long to process
  class TimeoutException < ::Thrift::Exception
    include ::Thrift::Struct, ::Thrift::Struct_Union

    FIELDS = {

    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end
