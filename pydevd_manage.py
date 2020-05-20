#!/usr/bin/env python
"""Django's command-line utility for administrative tasks."""
import os
import sys

import pydevd
# here `30.102.228.28` is your dev host ip where the eclipse runs in your local network
# your could set a fixed ip for you dev host
pydevd.settrace(host='30.102.228.28', suspend=False)

def main():
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'composetest.settings')
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)


if __name__ == '__main__':
    main()
