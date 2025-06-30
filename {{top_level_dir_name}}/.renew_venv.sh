#!/usr/env/{{zsh}}
source ~/.{{zsh}}rc
[ -e .venv ] && yes | rm -r .venv
if ! $(which {{python_version_or_env}})
then
    mamba activate {{python_version_or_env}}
    python -m venv .venv
    mamba deactivate
    mamba deactivate  # make sure to also quit "base"
else
    {{python_version_or_env}}  -m venv .venv
fi
source .venv/bin/activate
pip install -e ".[all]"
