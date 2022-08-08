module ValidicApi
  class Stream < Resource
    extend ValidicApi::ApiOperations::Stream::Create
    extend ValidicApi::ApiOperations::Stream::Read
    extend ValidicApi::ApiOperations::Stream::Delete
    extend ValidicApi::ApiOperations::Stream::List
  end
end
