%% @doc Beeldenzoeker search query
-module(beeldenzoeker_query).

-export([
    parse_query/3
]).

-include_lib("zotonic.hrl").

%% @doc Parse Zotonic search query arguments and return Elastic query arguments.
-spec parse_query(list() | binary(), binary(), proplists:proplist()) -> proplists:proplist().
parse_query(Key, Value, QueryArgs) when is_list(Key) ->
    parse_query(list_to_binary(Key), Value, QueryArgs);
parse_query(_Key, [], QueryArgs) ->
    QueryArgs;
parse_query(_Key, <<>>, QueryArgs) ->
    QueryArgs;
parse_query(<<"facets">>, Facets, QueryArgs) ->
    QueryArgs ++ lists:map(fun map_facet/1, Facets);
parse_query(<<"subject">>, Subjects, QueryArgs) ->
    QueryArgs ++ lists:map(
        fun(Subject) ->
            {filter, [<<"dcterms:subject.rdfs:label.keyword">>, Subject]}
        end,
        Subjects
    );
%% Parse subsets (Elasticsearch types). You can specify multiple per checkbox
%% by separating them with a comma.
parse_query(<<"subset">>, Types, QueryArgs) ->
    AllTypes = lists:foldl(
        fun(Type, Acc) ->
            Acc ++ binary:split(Type, <<",">>, [global])
        end,
        [],
        Types
    ),
    QueryArgs ++ [{filter, [[<<"_type">>, Type] || Type <- AllTypes]}];
parse_query(<<"period">>, Period, QueryArgs) ->
    QueryArgs
        ++ date_filter(proplists:get_value(<<"min">>, Period), <<"gte">>)
        ++ date_filter(proplists:get_value(<<"max">>, Period), <<"lte">>);
parse_query(<<"edge">>, Edges, QueryArgs) ->
    QueryArgs ++ lists:filtermap(fun map_edge/1, Edges);
parse_query(<<"license">>, Values, QueryArgs) ->
    QueryArgs ++ [{filter, [[<<"dcterms:license.keyword">>, Value] || Value <- Values]}];
parse_query(_Key, _Value, QueryArgs) ->
    QueryArgs.

map_facet({Name, [{<<"global">>, Props}]}) ->
    %% Nested global aggregation
    {agg, [Name, Props ++ [{<<"global">>, [{}]}]]};
map_facet({Name, [{Type, Props}]}) ->
    {agg, [Name, Type, Props]};
map_facet({Name, Props}) ->
    map_facet({Name, [{terms, Props}]}).

map_edge(<<"depiction">>) ->
    %% The Adlib object has a reproduction OR it's a Zotonic resource
    {true, {filter, [[<<"reproduction.value">>, exists], [<<"_type">>, <<"resource">>]]}};
map_edge(_) ->
    false.

date_filter(<<>>, _Operator) ->
    [];
date_filter(Value, Operator) when Operator =:= <<"gte">>; Operator =:= <<"gt">> ->
    [{filter, [
        [<<"dcterms:date">>, Operator, date_range(Value), [{<<"format">>, <<"yyyy">>}]],
        %% For Zotonic resources:
        [<<"dcterms:date">>, missing]
    ]}];
date_filter(Value, Operator) when Operator =:= <<"lte">>; Operator =:= <<"lt">> ->
    [{filter, [
        [<<"dcterms:date">>, Operator, date_range(Value), [{<<"format">>, <<"yyyy">>}]],
        %% For Zotonic resources:
        [<<"dcterms:date">>, missing]
    ]}].

%% @doc When the filter date is a year, make sure to include all dates in that
%%      year.
date_range(Date)  ->
    case ginger_adlib_elasticsearch_mapping:year(Date) of
        undefined ->
            %% Full date: do nothing
            Date;
        Year ->
            %% Include all dates in year
            Year
    end.
