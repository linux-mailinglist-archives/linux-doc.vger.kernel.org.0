Return-Path: <linux-doc+bounces-3231-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 688AA7FAF87
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 02:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 101E0280C56
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 01:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE6E1848;
	Tue, 28 Nov 2023 01:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Arg2BfI3"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4615C1845
	for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 01:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70E3C433C7;
	Tue, 28 Nov 2023 01:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701135019;
	bh=0rFWgVK0EFg6Nsa6a/EQ3Wk7q2M/kSfWg8x1h5DBihU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Arg2BfI3fBExEIRK2OQBaMUtoxslsQazNKrQYkWXGZp2xdlvhsbbmrzk9z1/6GbGA
	 73vRa9/3FvEt/Iv4drpjgv74AP5ctUheZCsGeSNc0+awIJYwxxYp8eAzZSLJUTLuS6
	 etHAxv/1VwwQbCidnzLhp0e6o4FXY9Ch23SRWo1Q047A1e37JqDscchXY/FItMCi9Y
	 NCAg+y6GnAqedOHpSiokSJtRmUaixxZUfqBMS8T7vSnG8rhCbl1MOZKhTu45NE1vIv
	 VbyfRj4pkNKoXZJf8pGgUJN/E9NfDY8bAlh5GBOux1NwVyFf8NRMMPr1WUdRHZohEj
	 qntfofivLC1Mw==
Date: Tue, 28 Nov 2023 02:30:15 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH] docs: Raise the minimum Sphinx requirement to 2.4.4
Message-ID: <20231128023015.0e446a06@coco.lan>
In-Reply-To: <87sf4qvkmc.fsf@meer.lwn.net>
References: <87sf4qvkmc.fsf@meer.lwn.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 27 Nov 2023 16:31:39 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Commit 31abfdda6527 (docs: Deprecate use of Sphinx < 2.4.x) in 6.2 added a
> warning that support for older versions of Sphinx would be going away.
> There have been no complaints, so the time has come.  Raise the minimum
> Sphinx version to 2.4.4 and clean out some compatibility code that we no
> longer need.
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/conf.py              |  2 +-
>  Documentation/doc-guide/sphinx.rst |  2 +-
>  Documentation/process/changes.rst  |  2 +-
>  Documentation/sphinx/automarkup.py |  6 +-----
>  Documentation/sphinx/cdomain.py    |  6 +-----
>  Documentation/sphinx/kfigure.py    |  8 +-------
>  scripts/sphinx-pre-install         | 10 +---------
>  7 files changed, 7 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 20bd74edcca9..3a1a804c3a13 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -47,7 +47,7 @@ from load_config import loadConfig
>  # -- General configuration ------------------------------------------------
>  
>  # If your documentation needs a minimal Sphinx version, state it here.
> -needs_sphinx = '1.7'
> +needs_sphinx = '2.4.4'
>  
>  # Add any Sphinx extension module names here, as strings. They can be
>  # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
> diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
> index bb7971643fcf..3d125fb4139d 100644
> --- a/Documentation/doc-guide/sphinx.rst
> +++ b/Documentation/doc-guide/sphinx.rst
> @@ -28,7 +28,7 @@ Sphinx Install
>  ==============
>  
>  The ReST markups currently used by the Documentation/ files are meant to be
> -built with ``Sphinx`` version 1.7 or higher.
> +built with ``Sphinx`` version 2.4.4 or higher.
>  
>  There's a script that checks for the Sphinx requirements. Please see
>  :ref:`sphinx-pre-install` for further details.
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index bb96ca0f774b..559587a89974 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -58,7 +58,7 @@ mcelog                 0.6              mcelog --version
>  iptables               1.4.2            iptables -V
>  openssl & libcrypto    1.0.0            openssl version
>  bc                     1.06.95          bc --version
> -Sphinx\ [#f1]_         1.7              sphinx-build --version
> +Sphinx\ [#f1]_         2.4.4            sphinx-build --version
>  cpio                   any              cpio --version
>  GNU tar                1.28             tar --version
>  gtags (optional)       6.6.5            gtags --version
> diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
> index acc6d55718bd..a413f8dd5115 100644
> --- a/Documentation/sphinx/automarkup.py
> +++ b/Documentation/sphinx/automarkup.py
> @@ -7,11 +7,7 @@
>  from docutils import nodes
>  import sphinx
>  from sphinx import addnodes
> -if sphinx.version_info[0] < 2 or \
> -   sphinx.version_info[0] == 2 and sphinx.version_info[1] < 1:
> -    from sphinx.environment import NoUri
> -else:
> -    from sphinx.errors import NoUri
> +from sphinx.errors import NoUri
>  import re
>  from itertools import chain
>  
> diff --git a/Documentation/sphinx/cdomain.py b/Documentation/sphinx/cdomain.py
> index 4eb150bf509c..e6959af25402 100644
> --- a/Documentation/sphinx/cdomain.py
> +++ b/Documentation/sphinx/cdomain.py
> @@ -127,11 +127,7 @@ def setup(app):
>  
>      # Handle easy Sphinx 3.1+ simple new tags: :c:expr and .. c:namespace::
>      app.connect('source-read', c_markups)
> -
> -    if (major == 1 and minor < 8):
> -        app.override_domain(CDomain)
> -    else:
> -        app.add_domain(CDomain, override=True)
> +    app.add_domain(CDomain, override=True)
>  
>      return dict(
>          version = __version__,
> diff --git a/Documentation/sphinx/kfigure.py b/Documentation/sphinx/kfigure.py
> index 13e885bbd499..97166333b727 100644
> --- a/Documentation/sphinx/kfigure.py
> +++ b/Documentation/sphinx/kfigure.py
> @@ -61,13 +61,7 @@ import sphinx
>  from sphinx.util.nodes import clean_astext
>  import kernellog
>  
> -# Get Sphinx version
> -major, minor, patch = sphinx.version_info[:3]
> -if major == 1 and minor > 3:
> -    # patches.Figure only landed in Sphinx 1.4
> -    from sphinx.directives.patches import Figure  # pylint: disable=C0413
> -else:
> -    Figure = images.Figure
> +Figure = images.Figure
>  
>  __version__  = '1.0.0'
>  
> diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
> index 1fb88fdceec3..db75b1b86086 100755
> --- a/scripts/sphinx-pre-install
> +++ b/scripts/sphinx-pre-install
> @@ -32,8 +32,7 @@ my $python_cmd = "";
>  my $activate_cmd;
>  my $min_version;
>  my $cur_version;
> -my $rec_version = "1.7.9";	# PDF won't build here
> -my $min_pdf_version = "2.4.4";	# Min version where pdf builds
> +my $rec_version = "3.0";

Please don't. 3.0 version has a broken C domain, not properly supported.
The fixes arrived only starting at 3.1 (I guess some went to 3.2, but
3.1 is usable, as far as I remember).

With such change, feel free to add:

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

>  my $latest_avail_ver;
>  
>  #
> @@ -791,9 +790,6 @@ sub recommend_sphinx_version($)
>  
>  	# Version is OK. Nothing to do.
>  	if ($cur_version && ($cur_version ge $rec_version)) {
> -		if ($cur_version lt $min_pdf_version) {
> -			print "note: If you want pdf, you need at least Sphinx $min_pdf_version.\n";
> -		}
>  		return;
>  	};
>  
> @@ -842,10 +838,6 @@ sub recommend_sphinx_version($)
>  			printf "\t. $activate_cmd\n";
>  			deactivate_help();
>  
> -			if ($latest_avail_ver lt $min_pdf_version) {
> -				print "note: If you want pdf, you need at least Sphinx $min_pdf_version.\n";
> -			}
> -
>  			return;
>  		}
>  



Thanks,
Mauro

