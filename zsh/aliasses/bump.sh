#!/usr/bin/env bash

function bver {
	jq '.version += 1' $1 | sponge $1
}
