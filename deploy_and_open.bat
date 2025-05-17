@echo off
cd /d "%~dp0"

:: Set Git user config
git config --global user.name "WebBot ProX"
git config --global user.email "webbot.backup@proton.me"

:: Initialize Git if not already
IF NOT EXIST ".git" (
    git init
    git remote add origin https://github.com/runninracksup/webbotprox-site.git
)

:: Add all files and commit
git add .
git commit -m "Initial deploy with auto-open"
git branch -M main
git push -u origin main

:: Publish to Cloudflare using Wrangler
call wrangler publish

:: Open the site in default browser
start https://webbotprox.store
