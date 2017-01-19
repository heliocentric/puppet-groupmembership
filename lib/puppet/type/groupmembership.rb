Puppet::Type.newtype(:groupmembership) do
  @doc = "Manage a POSIX group's members"

  autorequire(:group) do
    self[:name]
  end

  autorequire(:user) do
    self[:members]
  end

  newparam :name, :namevar => true

  newparam(:exclusive) do
    defaultto :false
    newvalues(:true, :false)
  end

  newproperty(:members, :array_matching => :all) do
    def insync?(is)
	    Puppet.debug("XXX: is is a " + is.class.to_s + " with: " + is.to_s);
	    Puppet.debug("XXX: @should is a " + @should.class.to_s + " with: " + is.to_s);
      if is.is_a?(Array) and @should.is_a?(Array)
        is.sort == @should.sort
      else
        is == @should
      end
    end
  end

end
