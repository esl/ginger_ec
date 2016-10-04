-module(m_ginger_activity).
-behaviour(gen_model).

-export([
    rsc_count/2,
    m_find_value/3,
    m_to_list/2,
    m_value/2
]).

-include_lib("zotonic.hrl").

rsc_count(RscId, Context) ->
    z_db:q1("select count(id) from activity_log where rsc_id = $1;",
            [z_convert:to_integer(RscId)], Context).

% Syntax: m.activity[RscId]
m_find_value(RscId, #m{value=undefined} = M, _Context) ->
    M#m{value=[RscId]};

% Syntax: m.activity[RscId].count
m_find_value(count, #m{value=[RscId]}, Context) ->
    rsc_count(RscId, Context).

m_to_list(_, _Context) ->
    [].

m_value(_, _Context) ->
    undefined.
