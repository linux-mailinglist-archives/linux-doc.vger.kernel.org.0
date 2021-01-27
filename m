Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CBF330588D
	for <lists+linux-doc@lfdr.de>; Wed, 27 Jan 2021 11:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235881AbhA0Kfs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 27 Jan 2021 05:35:48 -0500
Received: from mx2.suse.de ([195.135.220.15]:59784 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235959AbhA0Kdi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 27 Jan 2021 05:33:38 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E69E3AD2B;
        Wed, 27 Jan 2021 10:32:55 +0000 (UTC)
Date:   Wed, 27 Jan 2021 11:32:55 +0100 (CET)
From:   Miroslav Benes <mbenes@suse.cz>
To:     Mark Brown <broonie@kernel.org>
cc:     linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Jiri Kosina <jikos@kernel.org>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Petr Mladek <pmladek@suse.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        linux-doc@vger.kernel.org, live-patching@vger.kernel.org
Subject: Re: [PATCH v6 0/2] Documentation: livepatch: Document reliable
 stacktrace and minor cleanup
In-Reply-To: <20210120164714.16581-1-broonie@kernel.org>
Message-ID: <alpine.LSU.2.21.2101271130550.27114@pobox.suse.cz>
References: <20210120164714.16581-1-broonie@kernel.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Wed, 20 Jan 2021, Mark Brown wrote:

> This series adds a document, mainly written by Mark Rutland, which makes
> explicit the requirements for implementing reliable stacktrace in order
> to aid architectures adding this feature.  It also updates the other
> livepatching documents to use automatically generated tables of contents
> following review comments on Mark's document.
> 
> v6:
>  - Remove a duplicated "points".
> v5:
>  - Tweaks to the commit message for the new document.
>  - Convert new and existing documents to autogenerated tables of
>    contents.
> v4:
>  - Renumber table of contents
> v3:
>  - Incorporated objtool section from Mark.
>  - Deleted confusing notes about using annotations.
> 
> Mark Brown (1):
>   Documentation: livepatch: Convert to automatically generated contents
> 
> Mark Rutland (1):
>   Documentation: livepatch: document reliable stacktrace
> 
>  Documentation/livepatch/index.rst             |   1 +
>  Documentation/livepatch/livepatch.rst         |  15 +-
>  Documentation/livepatch/module-elf-format.rst |  10 +-
>  .../livepatch/reliable-stacktrace.rst         | 309 ++++++++++++++++++
>  4 files changed, 313 insertions(+), 22 deletions(-)
>  create mode 100644 Documentation/livepatch/reliable-stacktrace.rst

sorry for the late reply (slowly crawling through my email backlog). 
Thanks a lot for putting this together!

FWIW (so it is at least archived in the thread)

Acked-by: Miroslav Benes <mbenes@suse.cz>

M
