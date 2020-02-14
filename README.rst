FusionText
==========

FusionJSON is a node based string library for Blackmagic Design Fusion created
by Kristof Indeherberge and Cedric Duriau.

Requirements
------------

- `FusionTypes <https://github.com/cedricduriau/fusiontypes>`_

Installation
------------

1. Clone or download the repository.
2. Set the absolute path of the **./fusion** directory into the Fusion
   **UserPaths:** path mapping.

Contents
--------

**Fuses**

- textjoin.fuse: Fuse to join strings together into one.
- textformat.fuse: Fuse to format strings in a template string.
- textlength.fuse: Fuse to return the length of a string.
- textlstrip.fuse: Fuse to remove a leading substring of a string.
- textreplace.fuse: Fuse to replace a substring of a string.
- textrstrip.fuse: Fuse to remove a trailing substring of a string.
- textsub.fuse: Fuse to return a substring of a string.


**Modules/Lua**

- textutils.lua: Core module for string operations.
