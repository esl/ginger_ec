-module(ginger_geo_search).

-export([search_query/2]).

-include_lib("zotonic.hrl").

%% @doc Supports all the usual query model arguments
%% Selects and filters locations data.
search_query(#search_query{search={ginger_geo, Args}}, Context) ->
        
    GingerArgs = ginger_search:merge_ginger_args(Args),    
    BaseSearch = search_query:search(GingerArgs, Context),
    
    WhereStr = "rsc.pivot_location_lat IS NOT NULL AND rsc.pivot_location_lng IS NOT NULL",
    
    Where = case BaseSearch#search_sql.where of
        [] ->
            [WhereStr];
        OldWhere ->
            lists:append(OldWhere, " And " ++ WhereStr)
    end,
           
    BaseSearch#search_sql{
        select="rsc.id, rsc.pivot_location_lat, rsc.pivot_location_lng, rsc.pivot_category_nr",
        limit="Limit ALL",
        where=Where
    };

%% @doc Similar to z_geo_search:search_query/2 but result set includes locations and category
search_query(#search_query{search={ginger_geo_nearby, Args}}, Context) ->
    BaseSearch = z_geo_search:search_query(#search_query{search={geo_nearby, Args}}, Context),
    BaseSearch#search_sql{
        select="r.id, r.pivot_location_lat, r.pivot_location_lng, r.pivot_category_nr",
        limit="Limit ALL"
    }.