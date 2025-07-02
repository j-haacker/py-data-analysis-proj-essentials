#!/usr/bin/{{cookiecutter.shell}}
source ~/.{{cookiecutter.shell}}rc
[ -e .venv ] && yes | rm -r .venv
if command -v {{cookiecutter.python_version_or_env}} >/dev/null 2>&1
then
    {{cookiecutter.python_version_or_env}}  -m venv .venv
else
    mamba activate {{cookiecutter.python_version_or_env}}
    python -m venv .venv
    mamba deactivate
    mamba deactivate  # make sure to also quit "base"
fi
source .venv/bin/activate
pip install -e ".[all]"
