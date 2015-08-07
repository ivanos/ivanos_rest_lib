-module(ivanos_rest_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    ok = start_cowboy(),
    ivanos_rest_sup:start_link().

stop(_State) ->
    ok.

start_cowboy() ->
    ok = erl_cowboy:routing(?MODULE,
        [
{"/ivanos/static/[...]", cowboy_static, {priv_dir, ivanos_rest, "static"}}
        ]).
