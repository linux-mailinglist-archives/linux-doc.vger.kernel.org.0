Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7E4375A0E
	for <lists+linux-doc@lfdr.de>; Thu,  6 May 2021 20:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbhEFSR0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 6 May 2021 14:17:26 -0400
Received: from mx2.suse.de ([195.135.220.15]:47586 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230138AbhEFSRZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 May 2021 14:17:25 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 757B3AEE7;
        Thu,  6 May 2021 18:16:26 +0000 (UTC)
Date:   Thu, 6 May 2021 20:16:25 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1' codec
 can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210506181625.GJ6564@kitsune.suse.cz>
References: <20210506103913.GE6564@kitsune.suse.cz>
 <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
 <20210506184641.6348a621@coco.lan>
 <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
 <20210506174849.GH6564@kitsune.suse.cz>
 <493bb1b6-9fc8-fce8-67f2-f6d2e86a07f3@darmarit.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <493bb1b6-9fc8-fce8-67f2-f6d2e86a07f3@darmarit.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 06, 2021 at 07:59:18PM +0200, Markus Heiser wrote:
> Am 06.05.21 um 19:48 schrieb Michal Suchánek:
> > On Thu, May 06, 2021 at 07:04:44PM +0200, Markus Heiser wrote:
> > > Am 06.05.21 um 18:46 schrieb Mauro Carvalho Chehab:
> > > > Em Thu, 6 May 2021 17:57:15 +0200
> > > > Markus Heiser <markus.heiser@darmarit.de> escreveu:
> > > > 
> > > > > Am 06.05.21 um 12:39 schrieb Michal Suchánek:
> > > > > > When building HTML documentation I get this output:
> > > > > ...
> > > > > > [  412s] UnicodeEncodeError: 'latin-1' codec can't encode characters in position 18-20: ordinal not in range(256)
> > > > > ...
> > > > > > 
> > > > > > It does not say which input file contains the offending character so I can't tell which file is broken.
> > > > > > 
> > > > > > Any idea how to debug?
> > > > > 
> > > > > I guess the build host is a very simple container, what does
> > > > > 
> > > > >      echo $LC_ALL
> > > > >      echo $LANG
> > It's actually set to en_US just before the build.
> > > > > 
> > > > > prompt?  If it is latin, change it to something using utf-8 (I recommend
> > > > > 'en_US.utf8').
> > > > > 
> > > > > A UnicodeEncodeError can occour everywhere where characters are
> > > > > encoded from (internal) unicode to the encoding of the stream.
> > > > > 
> > > > > By example:
> > > > > 
> > > > > A print or log statement which streams to stdout needs to encode
> > > > > from unicode to stdout's encoding.  If there is one unicode symbol
> > > > > which can not encoded to stream's encoding a UnicodeEncodeError
> > > > > is raised.
> > > > 
> > > > Hi Markus,
> > > > 
> > > > It shouldn't matter the builder's locale when building the Kernel
> > > > documentation (or any other documents built from other git trees
> > > > on other open source projects), as the Kernel's *.rpm document charset
> > > > won't change, no matter on what part of the globe it was built.
> > > > 
> > > > I vaguely remember about a change we made a couple of years ago
> > > > in order to address this issue.
> > > 
> > > Hi Mauro :)
> > > 
> > > sure? .. what if the logger wants to log some symbols from the
> > > chines translated parts to stdout and the encoding of stdout is
> > > latin?
> > 
> > [  127s] + cd linux-5.12-next-20210506
> > [  127s] + export LANG=en_US
> > [  127s] + LANG=en_US
> > [  127s] + mkdir -p html
> > [  127s] + python3 -c 'print("↑ᛏ个")'
> > [  127s] ↑ᛏ个
> > [  127s] + echo 'print("↑ᛏ个")'
> > [  127s] + python3 test.py
> > [  127s] Traceback (most recent call last):
> > [  127s]   File "test.py", line 1, in <module>
> > [  127s]     print("\u2191\u16cf\u4e2a\uf8f9")
> > [  127s] UnicodeEncodeError: 'latin-1' codec can't encode characters in
> > position 0-3: ordinal not in range(256)
> > 
> > It certainly does not look like python can print unicode in this
> > environment. It tells me where the problem is, though.
> 
> Can't speak for the image of your container, may you need to install
> some utf-8 packages / but in most cases
> 
>   export LANG=en_US.UTF-8

Yes, in this case export LANG=en_US.utf8 is an easy workaround.

The UTF-8 locale is already included in the build environment by
default.

Thanks

Michal
