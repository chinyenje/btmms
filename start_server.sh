#!/usr/bin/env bash

{
	mix deps.get
}

{
	mix ecto.migrate
}


iex -S mix phx.server