#!/usr/bin/env bash
set -e
# ./orderly migrate
# ./orderly rebuild

TODAY=$(date "+%Y-%m-%d")
DATE=${1:-$TODAY}

echo "*** Date: $DATE"

echo "*** Copying reports"
./copy_reports_google.R $DATE

echo "*** Index page"
./orderly run index_page date=$DATE
echo "*** Parameters page"
./orderly run parameters date=$DATE
echo "*** 404 page"
./orderly run 404 date=$DATE
echo "*** FAQ page"
./orderly run FAQ date=$DATE
echo "*** News page"
./orderly run news date=$DATE

echo "*** data schema"
./write_data_schema.R

echo "*** Copying files"
./copy_index.R $DATE
./copy_regionals.R $DATE