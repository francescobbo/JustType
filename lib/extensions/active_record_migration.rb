class ActiveRecord::Migration
  def adapter_name
    ActiveRecord::Base.connection.instance_values['config'][:adapter]
  end

  def mysql?
    adapter_name == 'mysql2'
  end

  def postgresql?
    adapter_name == 'postgresql'
  end

  def uuid_primary_key(table)
    if postgresql?
      table.primary_key :id, :uuid
    else
      table.primary_key :id, 'CHAR(36)'
    end
  end

  def uuid_reference(table, *opts)
    if postgresql?
      table.uuid(*opts)
    else
      if opts.last.is_a?(Hash)
        opts.last.merge!(limit: 36)
      else
        opts << { limit: 36 }
      end

      table.string(*opts)
    end
  end
end
