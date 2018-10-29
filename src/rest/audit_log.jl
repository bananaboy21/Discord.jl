export get_audit_log

"""
    get_audit_log(
        c::Client,
        guild::Union{AbstractGuild, Integer};
        params...,
    ) -> Response{AuditLog}

Get an [`AuditLog`](@ref).

# Query Params
- `user_id::Int`: Filter the log for a [`User`](@ref) ID.
- `action_type::Int`: The type of audit log event.
- `before::Int`: filter the log before a certain entry ID.
- `limit::Int`: How many entries are returned (default 50, minimum 1, maximum 100).
"""
function get_audit_log(c::Client, guild::Int; params...)
    return Response{AuditLog}(c, :GET, "/guilds/$guild/audit-logs"; params...)
end

function get_audit_log(c::Client, guild::AbstractGuild; params...)
    return get_audit_log(c, guild.id; params...)
end
