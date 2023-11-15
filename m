Return-Path: <linux-doc+bounces-1695-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 467127E0359
	for <lists+linux-doc@lfdr.de>; Fri,  3 Nov 2023 14:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB7C0B21261
	for <lists+linux-doc@lfdr.de>; Fri,  3 Nov 2023 13:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F7D171BF;
	Fri,  3 Nov 2023 13:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bbOoB+IO"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62E0C121
	for <linux-doc@vger.kernel.org>; Fri,  3 Nov 2023 13:08:32 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31911111;
	Fri,  3 Nov 2023 06:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FVKgUj0uIHkMY78KC2G3LoMl8HM52HmVt0kx80HproA=; b=bbOoB+IOaYQ7ibWjfJ0UuoeNc9
	tqG6JFZK+5q/P5hbo3bF24UolPUzIHBjInC9ad/2V4q8sMTi2PeKiAhIdoE9tUgBfF5ejOLGmQOKL
	hvPT68kZzruopT6g92dRJ5stja0/mnoWKg+4ykIFhdh9d8RqtBG/8vQJuqJQgYrIUGwo7FCBqRmZy
	mqx61wXt+mhGOh1n7qXCNtAMTvA0zFrFszr00Nt31MdL4IvEOR0aBFlY2eJKmiNBNzcMl2OLnjkw9
	fIqyiGQBItdk26uVw/BtIObjQK9Rp2+QIvDlZW3bBuEOiI8KvUXjQVJ4Qenhu4xziGBXDI96ri8cM
	Zk5Ib0xQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qytuI-005WWa-EH; Fri, 03 Nov 2023 13:08:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C451D30027B; Fri,  3 Nov 2023 14:08:14 +0100 (CET)
Date: Fri, 3 Nov 2023 14:08:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: David Hildenbrand <david@redhat.com>
Cc: John Hubbard <jhubbard@nvidia.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Xu <peterx@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 11/11] selftests: error out if kernel header files are
 not yet built
Message-ID: <20231103130814.GC8262@noisy.programming.kicks-ass.net>
References: <20230606071637.267103-1-jhubbard@nvidia.com>
 <20230606071637.267103-12-jhubbard@nvidia.com>
 <20231103121652.GA6217@noisy.programming.kicks-ass.net>
 <a002f903-723f-40ae-8d7a-421ab2e082e2@redhat.com>
 <20231103124606.GB8262@noisy.programming.kicks-ass.net>
 <15ff806d-59ab-46ab-8891-05ab917a1528@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15ff806d-59ab-46ab-8891-05ab917a1528@redhat.com>

On Fri, Nov 03, 2023 at 01:59:28PM +0100, David Hildenbrand wrote:

> Okay. the question is if your workflow can be easily adjusted, or if we can
> improve that header handling as a whole.

So on IRC the following was suggested:

  make O=defconfig-build headers ; make O=defconfig-build -C tools/testing/selftests/x86

But that makes absolutely no sense to me; because the headers and
selftests are not .config dependent. Furthermore I don't want them in a
kernel build dir.

> The problem I had with this recently: just because we did a "make headers"
> once in a git tree doesn't mean that it is still up-to-date.
> 
> So once some selftest changes showed up that require newer headers, building
> the selftests again fails without a hint that another round of "make
> headers" would be required.

Yeah, so I've been adding #ifndef guards all over the place for decades
and that just works. You need it in normal userspace too.

This super reliance on the very latestesetst headers is just a total
pain.

