Return-Path: <linux-doc+bounces-61097-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E209BB846E7
	for <lists+linux-doc@lfdr.de>; Thu, 18 Sep 2025 13:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E2EB3A6B08
	for <lists+linux-doc@lfdr.de>; Thu, 18 Sep 2025 11:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669FB2F25E9;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eiSGo5Xc"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B56E2C0F95;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196506; cv=none; b=MGhusjRDauzsHWHt1+IY5IQwyH3WVeEcE1dktSkSUBKg68dvSGXlFqjyZBOgFufIPm6Mi+3/F+R6LWUttf/R2KmbusIc5/LR5AKudkC93W5pG2VPx9l2/8RTDRauJxPPRmzj+qqOeWpMWHiIHmllv9CIKAcI8Eq+UG9kbyBYtVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196506; c=relaxed/simple;
	bh=jz6YUAx13qG3Nr5mfa9SkV91eB2N6lUlvDu2sj1PPuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WoSwfRygHw4EUrrKnVn6NhTxSQ8dv6xEo4Ob3rHuBDsGVI52ugzmdqg0JlJhem/5ua+XUYdg0BUB87AVeKPVZsbBEFI2gnvRJjLiFR9S+0ii+zaqjrzVbiOAQPTMnG7NcgU00/m+JzbQU5whIK1l+BE3ekAUrXQMCyqWfpUatuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eiSGo5Xc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC29C4CEE7;
	Thu, 18 Sep 2025 11:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196505;
	bh=jz6YUAx13qG3Nr5mfa9SkV91eB2N6lUlvDu2sj1PPuU=;
	h=From:To:Cc:Subject:Date:From;
	b=eiSGo5XcquNSAFIpLXOt+ZBZ6wklKtpcVONMWKI58LTrgSbqV3VmxcsaOyohN1e+x
	 ZfERr3EJhjkBWblG9bCVMnwRqNhrDurlLB5o6CKUyVauFjPyeNWb4kuheS5iGq4H+U
	 ZmfopxZsi9ROuLvqqYo0wDHelTt/fp+PLcZZnkmVvkVItMCSwHJ+ZF8yTjiyLqJFZz
	 T7H57uRf1wgmBGWxcAc/EmAwdxkY3IYoWld7Pb+9dY8UrNMEipqe9ojtPUUOzXoYRO
	 MI17C3uNT7zdV8N3cIK36JiZ8oOBqx5vhooFqT4jttFMCl0l2Zw+5MwmV2txZh7bxB
	 8MDFps0qVChTg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uzDE7-0000000CrkA-2yKe;
	Thu, 18 Sep 2025 13:55:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH v8 00/24] Split sphinx call logic from docs Makefile
Date: Thu, 18 Sep 2025 13:54:34 +0200
Message-ID: <cover.1758196090.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

v8 contains a bug fix for ./tools/docs/check-variable-fonts.py command
line together with a new --deny-vf argument to it, plus addresses
a couple checkpatch warnings. Only 4 patches changed: patches 1, 2, 4
and 5.

-

This series should probably be called:

    "Move the trick-or-treat build hacks accumulated over time
     into a single place and document them."

as this reflects its main goal. As such:

- it places the jobserver logic on a library;
- it removes sphinx/parallel-wrapper.sh;
- the code now properly implements a jobserver-aware logic
  to do the parallelism when called via GNU make, failing back to
  "-j" when there's  no jobserver;
- converts check-variable-fonts.sh to Python and uses it via
  function call;
- drops an extra script to generate man pages, adding a makefile
  target for it;
- ensures that return code is 0 when PDF successfully builds;
- about half of the script is comments and documentation.

I tried to do my best to document all tricks that are inside the
script. This way, the docs build steps is now documented.

It should be noticed that it is out of the scope of this series
to change the implementation. Surely the process can be improved,
but first let's consolidate and document everything on a single
place.

Such script was written in a way that it can be called either
directly or via a Makefile. Running outside Makefile is
interesting specially when debug is needed. The command line
interface replaces the need of having lots of env vars before
calling sphinx-build:

    $ ./tools/docs/sphinx-build-wrapper --help
    usage: sphinx-build-wrapper [-h]
           [--sphinxdirs SPHINXDIRS [SPHINXDIRS ...]] [--conf CONF]
           [--builddir BUILDDIR] [--theme THEME] [--css CSS] [--paper {,a4,letter}] [-v]
           [-j JOBS] [-i] [-V [VENV]]
           {cleandocs,linkcheckdocs,htmldocs,epubdocs,texinfodocs,infodocs,mandocs,latexdocs,pdfdocs,xmldocs}

    Kernel documentation builder

    positional arguments:
      {cleandocs,linkcheckdocs,htmldocs,epubdocs,texinfodocs,infodocs,mandocs,latexdocs,pdfdocs,xmldocs}
                            Documentation target to build

    options:
      -h, --help            show this help message and exit
      --sphinxdirs SPHINXDIRS [SPHINXDIRS ...]
                            Specific directories to build
      --conf CONF           Sphinx configuration file
      --builddir BUILDDIR   Sphinx configuration file
      --theme THEME         Sphinx theme to use
      --css CSS             Custom CSS file for HTML/EPUB
      --paper {,a4,letter}  Paper size for LaTeX/PDF output
      -v, --verbose         place build in verbose mode
      -j, --jobs JOBS       Sets number of jobs to use with sphinx-build
      -i, --interactive     Change latex default to run in interactive mode
      -V, --venv [VENV]     If used, run Sphinx from a venv dir (default dir: sphinx_latest)

the only mandatory argument is the target, which is identical with
"make" targets.

The call inside Makefile doesn't use the last four arguments. They're
there to help identifying problems at the build:

    -v makes the output verbose;
    -j helps to test parallelism;
    -i runs latexmk in interactive mode, allowing to debug PDF
       build issues;
    -V is useful when testing it with different venvs.

When used with GNU make (or some other make which implements jobserver),
a call like:

    make -j <targets> htmldocs

will make the wrapper to automatically use POSIX jobserver to claim 
the number of available job slots, calling sphinx-build with a
"-j" parameter reflecting it. ON such case, the default can be
overriden via SPHINXDIRS argument.

Visiable changes when compared with the old behavior:

When V=0, the only visible difference is that:
- pdfdocs target now returns 0 on success, 1 on failures.
  This addresses an issue over the current process where we
  it always return success even on failures;
- it will now print the name of PDF files that failed to build,
  if any.

In verbose mode, sphinx-build-wrapper and sphinx-build command lines
are now displayed.

---

v8:
- fixed a typo at check-variable-fonts.py libary causing the
  command line to not work properly;
- added a --deny-vf command line arg for check-variable-fonts.py;
- fixed two checkpatch warnings (duplicated "allows" word on
  a patch description, and "childs" instead of "children).

v7:
- added a --help option to ./tools/docs/check-variable-fonts.py;
- document FONTS_CONF_DENY_VF=;
- moved the python_version changes to be earlier in the series,
  before moving it to a separate library, as suggested by Jani;
- added a --rustdoc to the wrapper, cleaning up Makefile
  even further;
- solved some problems related to DENY_VF logic.

v6:
- On success, PDF output is identical as before when V=0;
- when V=1 is used, PDF output will print a build summary,
  as on v5;
- solved a problem when multiple PDF files have the same
  basename but are located on different directories;
- merged a patch series converting check-variable-fonts.sh
  to Python. Its logic is now called directly without running
  a subprocess.
- venv patch moved to the end.

v5:
- merged comments with the script;
- placed n_jobs on a separate function;
- nitpick: dropped a for loop used instead of list append.

v4:
- updated references for sphinx-pre-install after its rename;
- added some extra patches to add more options to python_version,
  allowing it to bail out and suggest alternatives;
- added a patch at the end to explicitly break doc builds when
  python3 points to python3.6 or older.

v3:
- rebased on the top of docs-next;
- added two patches to build man files that were on a separate
  patch series.

v2:
- there's no generic exception handler anymore;
- it moves sphinx-pre-install to tools/docs;
- the logic which ensures a minimal Python version got moved
  to a library, which is now used by both pre-install and wrapper;
- The first wrapper (05/13) doesn't contain comments (except for
  shebang and SPDX). The goal is to help showing the size increase
  when moving from Makefile to Python. Some file increase is
  unavoidable, as Makefile is more compact: no includes, multple
  statements per line, no argparse, etc;
- The second patch adds docstrings and comments. It has almost
  the same size of the code itself;
- I moved the venv logic to a third wrapper patch;
- I fixed an issue at the paraller build logic;
- There are no generic except blocks anymore.

Mauro Carvalho Chehab (24):
  scripts/jobserver-exec: move the code to a class
  scripts/jobserver-exec: move its class to the lib directory
  scripts/jobserver-exec: add a help message
  scripts: check-variable-fonts.sh: convert to Python
  tools/docs: check-variable-fonts.py: split into a lib and an exec file
  check-variable-fonts.py: add a helper to display instructions
  scripts: sphinx-pre-install: move it to tools/docs
  tools/docs: sphinx-pre-install: drop a debug print
  tools/docs: sphinx-pre-install: allow check for alternatives and bail
    out
  tools/docs: python_version: move version check from sphinx-pre-install
  tools/docs: sphinx-build-wrapper: add a wrapper for sphinx-build
  docs: parallel-wrapper.sh: remove script
  docs: Makefile: document latex/PDF PAPER= parameter
  docs: Makefile: document FONTS_CONF_DENY_VF= parameter
  tools/docs: sphinx-build-wrapper: add an argument for LaTeX
    interactive mode
  tools/docs: sphinx-build-wrapper: allow building PDF files in parallel
  tools/docs,scripts: sphinx-*: prevent sphinx-build crashes
  tools/docs: sphinx-build-wrapper: Fix output for duplicated names
  docs: add support to build manpages from kerneldoc output
  tools: kernel-doc: add a see also section at man pages
  scripts: kdoc_parser.py: warn about Python version only once
  tools/docs: sphinx-build-wrapper: move rust doc builder to wrapper
  tools/docs: sphinx-* break documentation bulds on openSUSE
  tools/docs: sphinx-build-wrapper: add support to run inside venv

 Documentation/Makefile                        | 144 +---
 Documentation/doc-guide/kernel-doc.rst        |  29 +-
 Documentation/doc-guide/sphinx.rst            |   4 +-
 Documentation/sphinx/kerneldoc-preamble.sty   |   2 +-
 Documentation/sphinx/parallel-wrapper.sh      |  33 -
 .../translations/it_IT/doc-guide/sphinx.rst   |   4 +-
 .../translations/zh_CN/doc-guide/sphinx.rst   |   4 +-
 Documentation/translations/zh_CN/how-to.rst   |   2 +-
 MAINTAINERS                                   |   4 +-
 Makefile                                      |   2 +-
 scripts/check-variable-fonts.sh               | 115 ---
 scripts/jobserver-exec                        |  88 +-
 scripts/lib/jobserver.py                      | 149 ++++
 scripts/lib/kdoc/kdoc_files.py                |   5 +-
 scripts/lib/kdoc/kdoc_output.py               |  84 +-
 scripts/lib/kdoc/kdoc_parser.py               |   7 +-
 scripts/split-man.pl                          |  28 -
 tools/docs/check-variable-fonts.py            |  33 +
 tools/docs/lib/latex_fonts.py                 | 167 ++++
 tools/docs/lib/python_version.py              | 178 ++++
 tools/docs/sphinx-build-wrapper               | 816 ++++++++++++++++++
 {scripts => tools/docs}/sphinx-pre-install    | 135 +--
 22 files changed, 1540 insertions(+), 493 deletions(-)
 delete mode 100644 Documentation/sphinx/parallel-wrapper.sh
 delete mode 100755 scripts/check-variable-fonts.sh
 create mode 100755 scripts/lib/jobserver.py
 delete mode 100755 scripts/split-man.pl
 create mode 100755 tools/docs/check-variable-fonts.py
 create mode 100755 tools/docs/lib/latex_fonts.py
 create mode 100644 tools/docs/lib/python_version.py
 create mode 100755 tools/docs/sphinx-build-wrapper
 rename {scripts => tools/docs}/sphinx-pre-install (93%)

-- 
2.51.0



