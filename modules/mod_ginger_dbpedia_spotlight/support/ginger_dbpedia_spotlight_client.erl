%% @doc Client for the DBpedia Spotlight API.
%%      See http://www.dbpedia-spotlight.org/api.
-module(ginger_dbpedia_spotlight_client).

-export([
    annotate/2,
    candidates/2,
    request/3,
    request/4
]).

-include_lib("../include/ginger_dbpedia_spotlight.hrl").
-include_lib("zotonic.hrl").

-define(ENDPOINT, <<"https://api.dbpedia-spotlight.org">>).

%% @doc A 4 step process - Spotting, Candidate Mapping, Disambiguation and Linking / Stats - for
%%      linking unstructured information sources.
-spec annotate(binary(), atom()) -> binary().
annotate(Text, Language) when is_binary(Text) ->
    Request = #dbpedia_spotlight_request{
        text = Text
    },
    request(Language, <<"/annotate">>, Request).

%% @doc A 2 step process - Spotting, Candidate Mapping - for linking unstructured information
%%      sources.
-spec candidates(binary(), atom()) -> [map()] | undefined.
candidates(Text, Language) when is_binary(Text) ->
    Request = #dbpedia_spotlight_request{
        text = Text
    },
    case request(Language, <<"/candidates">>, Request) of
        undefined ->
            %% Failed HTTP request.
            undefined;
        #{<<"annotation">> := #{<<"surfaceForm">> := Entities}} when is_list(Entities) ->
            [fix_uri(E, Language) || E <- Entities];
        #{<<"annotation">> := #{<<"surfaceForm">> := Entity}} when is_map(Entity) ->
            %% A single found entity is unfortunately not returned as a list but an object instead.
            [fix_uri(Entity, Language)];
        _ ->
            %% No candidates found.
            []
    end.

-spec request(atom(), binary(), #dbpedia_spotlight_request{}) -> map() | undefined.
request(Language, Method, #dbpedia_spotlight_request{} = Request) ->
    request(?ENDPOINT, Language, Method, Request).

-spec request(binary(), atom(), binary(), #dbpedia_spotlight_request{}) -> map() | undefined.
request(Endpoint, Language, Method, #dbpedia_spotlight_request{} = Request) ->
    Qs = qs(Request),
    Url = <<Endpoint/binary, "/", (z_convert:to_binary(Language))/binary, Method/binary, Qs/binary>>,
    ginger_http_client:get(Url, []).

%% @doc Build query string.
-spec qs(#dbpedia_spotlight_request{}) -> binary().
qs(#dbpedia_spotlight_request{text = T, confidence = C, types = Y, sparql = S, policy = P}) ->
    Types = string:join(Y, ","),
    Text = z_convert:to_binary(z_url:url_encode(z_html:strip(T))),
    <<
        "?text=", Text/binary,
        "&confidence=", (z_convert:to_binary(C))/binary,
        "&types=", (list_to_binary(Types))/binary,
        "&sparql=", S/binary,
        "&policy=", (z_convert:to_binary(P))/binary
    >>.

%% @doc Fully qualify the partial URLs returned by DBpedia Spotlight.
-spec fix_uri(Resource :: map(), atom()) -> Resource :: map ().
fix_uri(#{<<"resource">> := #{<<"@uri">> := Uri} = Rsc} = Entity, Language) ->
    FullUri = <<"http://", (z_convert:to_binary(Language))/binary, ".dbpedia.org/resource/", Uri/binary>>,
    Entity#{<<"resource">> => Rsc#{<<"@uri">> => FullUri}}.
