Return-Path: <linux-doc+bounces-36273-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2312A215B3
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jan 2025 01:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12E981888992
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jan 2025 00:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C616E17A5A4;
	Wed, 29 Jan 2025 00:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boKpytUL"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCC52AEE4;
	Wed, 29 Jan 2025 00:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738111409; cv=none; b=u1GKaHWgS/nnha/YnS514WBD45sk17AE7YmatsXoles1qmWi+LX9AVAPXTcWSOCClmXtdnj0orWwTYTp9asfFhFPutImYmLlklt7n5VEcdu1PUh3+0kD4hu3l5bo3pH8F/k2yC+7yys4t2bpO2qy18SwFcYJjC/xVkRQOBhqip4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738111409; c=relaxed/simple;
	bh=Mn3qtE1HwlR1CPtrZiiVhYQQefnd17RJCgGbrplaeYs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O7jYHFFM0/aoRUggDBFx3klw73STS08kZVmVeLNm4rZoc4STBR2Cqi/px+CYNxg0rVYKlJBLFP/74bMh0N6XE5dYc86Osn1i4bqGd6PBJwYIeIrfpIGkyW1qlrfmYuxj4g7UfOSDqo13APRq4Yy8+VxGJTr1xHu/PQq58Ev408U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boKpytUL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A71C4CEE3;
	Wed, 29 Jan 2025 00:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738111409;
	bh=Mn3qtE1HwlR1CPtrZiiVhYQQefnd17RJCgGbrplaeYs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=boKpytULqQtBqVXzo/UZ3twAh/UWD9Botrp0L10nfcjF50yR0QfiGbyn3FFcoi18V
	 XLAYjakruAoJSBJJNbWI9UAUzyRvRRv4nDiwVPnLoHwpJiHXWk2rzWCCPxUtIPJSov
	 WtYaT0zPYfk7YWdqt00L+aBUreRV8YlAfTQ5ZayMAIAa6sVuq7dIN9QP18IAm64shi
	 LpqziDbiTJ/gAsmqA67VyhkIJ07or+VDMmSIrIUKNnlXPvASLG7WH1TR3K5KRxtkGS
	 b8rdamsBYWVg9kk/cn/ZCNFcrqF5CKe3ADsaFbEK9v7ozePX7CpMbB9Y92LDuV1lvM
	 Wv4dOWxFgRjBw==
Date: Wed, 29 Jan 2025 01:43:24 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2 18/38] docs: sphinx/kernel_abi: use AbiParser directly
Message-ID: <20250129014324.60a8dfce@foz.lan>
In-Reply-To: <87lduu7efu.fsf@trenco.lwn.net>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
	<fb800900352d90a0e501e5d6732e1bea277478f2.1738020236.git.mchehab+huawei@kernel.org>
	<87lduu7efu.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 28 Jan 2025 15:37:25 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Instead of running get_abi.py script, import AbiParser class and
> > handle messages directly there using an interactor. This shold save some
> > memory, as there's no need to exec python inside the Sphinx python
> > extension.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  Documentation/sphinx/kernel_abi.py | 26 +++++++++++++++-----------
> >  scripts/get_abi.py                 |  2 +-
> >  2 files changed, 16 insertions(+), 12 deletions(-)
> >
> > diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
> > index fc7500fad119..93d537d8cb6c 100644
> > --- a/Documentation/sphinx/kernel_abi.py
> > +++ b/Documentation/sphinx/kernel_abi.py
> > @@ -42,6 +42,11 @@ from docutils.parsers.rst import directives, Directive
> >  from sphinx.util.docutils import switch_source_input
> >  from sphinx.util import logging
> >  
> > +srctree = os.path.abspath(os.environ["srctree"])
> > +sys.path.insert(0, os.path.join(srctree, "scripts"))
> > +
> > +from get_abi import AbiParser  
> 
> I have to admit that I don't like this bit of messing around with the
> path.  And importing things out of scripts/ seems ... inelegant.
> 
> I take it you still want to be able to run get_abi.py standalone even
> after it's directly integrated into Sphinx?  

Yes, because calling it via command line provides:

1. a way to test the parser and check the results;
2. a search utility;
3. the undefined symbol verification.

Btw, if you look at the other Sphinx modules, they do exactly the same:
they execute code from scripts/. The only difference here is that,
instead of loading the a perl/python/shell engine and running the entire
script from there, it is importing just a class.

> In this case, it might be
> nicer to have the common library functionality in its own module that
> can be imported into both sphinx and the standalone command. 

This would be possible too: place the classes on a common lib dir and
then import it from both command line and Sphinx extensions.

If we're willing to do that, then perhaps we can have separate files
for each different class, as this could make it easier to maintain.

> That still
> leaves open the question of where that module lives
> (Documentation/sphinx perhaps?) and how the Python path gets set up
> correctly...

I guess the command line at scripts/ could use something like this to
get the library location (untested) and add to the import search PATH:

	import os

	python_lib_dir="some/location"

	scriptdir = os.path.dirname(os.path.realpath(__file__))

	sys.path.insert(0, os.path.join(srctree, f"../{python_lib_dir}"))

	from abi_parser import abiParser

Now, I'm not sure if the best location for python libraries would
be at Documentation/sphinx, as we may end needing other python
libraries with time and not all would be used by Sphinx.

In short: I would be more inclined to place them on 
a new lib directory (tools/lib? tools/py_lib? scripts/lib?).

See, with the content of this series, if we split files per each class,
it would mean 3 files:

  1. abi_parser.py, containing AbiParser class (plus ABI_DIR const);
     (this is the only class used by Documentation/sphinx extensions)
  2. abi_regex.py, containing AbiRegex class;
  3. abi_symbols.py, containing SystemSymbols class.

Now, if we're going on this direction, it may also make sense to split
the command line classes/functions into 4 (or 5 files) for argparse
argument definition and command run code. If we do that, it means that
other files will be stored somewhere:

  4. abi_cmd_rest.py: AbiRest and AbiValidate classes for the rest 
     and validate arguments (I would likely place both at the same file,
     as the code is similar - but it could also be split on two separate
     files);
  5. abi_cmd_search.py: AbiSearch - for the search arguments;
  6. abi_cmd_undefined.py: AbiUndefined - for the undocumented symbol check 
     arguments;

Finally, there is the one under scripts/:

  7. get_abi.py: with the main function

For (1), Documentation/sphinx could make sense, but (2) to (6) are
used only by the command line tool. Placing them at Documentation/ 
seems weird. Well, nothing prevents having them at scripts/, IMHO, things
would become more organized if we place the Python files with 0644
flags elsewhere.

Thanks,
Mauro

