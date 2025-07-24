Troubleshooting
===============

This page covers common issues you might encounter when setting up LMIgnite and their solutions.

1. Docker Credential Helper Error
---------------------------------

**Problem:**
Failed to start the docker containers with the following error message:

.. code-block:: text

   err: exec: "docker-credential-osxkeychain": executable file not found in $PATH

**Cause:**
The installation script will try to pull the latest LMIgnite docker images.
However, the docker pulling may fail if the docker credential helper is not correctly installed.

**Solution:**
Manually install the docker credential helper using Homebrew:

.. code-block:: bash

   brew install docker-credential-helper

2. Database Container Migration Issues
--------------------------------------

**Problem:**
Error when starting the "migrate" docker container.

**Cause:**
The database container may be in a bad state after a migration.

**Solution 1:**
Stop all containers and clean up volumes by running the following commands:

.. code-block:: bash

   docker compose -f lmignite-docker-compose.yml down
   docker volume prune -a

.. note::
   The `docker volume prune -a` command will remove all unused volumes. Make sure you don't have important data in other Docker volumes before running this command.

**Solution 2:**
Change the docker volume name to a new one.

1. Locate the docker compose file:

   - If you are using the installation script, the docker compose file is located at ``lmignite-docker-compose.yml``
   - If you are using the manual installation, the docker compose file is located at ``docker-compose.yml``

2. Change the docker volume name to a new one in the docker compose file:

   Look for ``postgres_data_vX.Y`` in the docker compose file, and change it to ``postgres_data_vX.Y-new``.

3. Restart the docker containers:

   .. code-block:: bash

      docker compose -f lmignite-docker-compose.yml up -d
