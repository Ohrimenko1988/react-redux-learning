#!/bin/bash

npm run build
serve -l 3000 -s build
