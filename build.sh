#!/bin/bash

( cd my-app ; rm -rf dist node_modules ; npm install ; tsc ; npm run build )


( cd server/div ; rm -rf dist node_modules ; npm install ; tsc)
( cd server/mul ; rm -rf dist node_modules ; npm install ; tsc)
( cd server/sub ; rm -rf dist node_modules ; npm install ; tsc)
( cd server/sum ; rm -rf dist node_modules ; npm install ; tsc)
