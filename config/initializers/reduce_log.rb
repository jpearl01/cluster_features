#This is an attempt to limit the long queries being written to the logs when importing new files
class ActiveRecord::ConnectionAdapters::AbstractAdapter
  protected

  def log_with_binary_truncate(sql, name="SQL", binds=[], statement_name = nil, &block)
    binds = binds.map do |col, data|
      if data.is_a?(String) && data.size > 100
        data = "#{data[0,10]} [REDACTED #{data.size - 20} bytes] #{data[-10,10]}"
      end
      [col, data]
    end

    sql = sql.gsub(/(\S{20})\S+(\S{20})/) do |match|
      "[REDACTED #{match.size} chars]"
    end

    log_without_binary_truncate(sql, name, binds, statement_name, &block)
  end

  alias_method_chain :log, :binary_truncate
end