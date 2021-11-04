
# Progress Tracker for Overleaf


`plotProgress.py` and `updateProgress.sh` are coming from [latex-progress-tracker](https://github.com/tjburch/latex-progress-tracker).

# How to use

- link your overleaf project with Github repo (do not forget make it private to avoid scoop)
- put the file in this repository on your overleaf github repo
- when you push (from overleaf or your local), it triggers Github actions in `.github/workflows/main.yml`, and then it will generate graphs and `progress.csv` 
- The results will be sent to your slack channel (you need to put your Slack api key  in `to_slack.py`) 

# To do
Some code lines are commented out to aovid errors (to be modifed).
Some descriptions are to be added.
