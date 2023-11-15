Return-Path: <linux-doc+bounces-1692-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE497E0320
	for <lists+linux-doc@lfdr.de>; Fri,  3 Nov 2023 13:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2164DB211D7
	for <lists+linux-doc@lfdr.de>; Fri,  3 Nov 2023 12:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5465D1642F;
	Fri,  3 Nov 2023 12:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qk6oIoXE"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD4D8473
	for <linux-doc@vger.kernel.org>; Fri,  3 Nov 2023 12:46:25 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E385D123;
	Fri,  3 Nov 2023 05:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8TMcEyG3RiD7RECaqRdhYHspaIsImlZ9FwqzKP0l02s=; b=qk6oIoXEFgEVm8AON0Ukab/6vv
	ShSen0t+/dOGOL0ERyspoiGDTmFT6inioEId0OvPa4RGxfEb+Lsw9Hyb/NgkKG5HHHuE3PK2V66nN
	AplQjJvaElTsFMiIq+52qMkdpIdg/emYsRctcIUZncQ118bmb9RSA7DSmTLWrq5dq+5pKh894llEx
	9kpKQo7UVJDoMRlm0OhvPuVkHsAfEGqpveBs2GNIGSrDuHZMhga9Cnf1wgVplDKJA2V1HL/hFAmTh
	mdv74d3ddFOGo37LrlBPLsxDb1WW4H8zwDOCU4XQjiG7KepTotk67cIJrIl2UbZcRocs/N6JSHN6/
	zosR8S4A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qytYs-005R6w-AA; Fri, 03 Nov 2023 12:46:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A2E9530027B; Fri,  3 Nov 2023 13:46:06 +0100 (CET)
Date: Fri, 3 Nov 2023 13:46:06 +0100
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
Message-ID: <20231103124606.GB8262@noisy.programming.kicks-ass.net>
References: <20230606071637.267103-1-jhubbard@nvidia.com>
 <20230606071637.267103-12-jhubbard@nvidia.com>
 <20231103121652.GA6217@noisy.programming.kicks-ass.net>
 <a002f903-723f-40ae-8d7a-421ab2e082e2@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a002f903-723f-40ae-8d7a-421ab2e082e2@redhat.com>

On Fri, Nov 03, 2023 at 01:22:54PM +0100, David Hildenbrand wrote:
> On 03.11.23 13:16, Peter Zijlstra wrote:
> > On Tue, Jun 06, 2023 at 12:16:37AM -0700, John Hubbard wrote:
> > > As per a discussion with Muhammad Usama Anjum [1], the following is how
> > > one is supposed to build selftests:
> > > 
> > >      make headers && make -C tools/testing/selftests/mm
> > > 
> > > Change the selftest build system's lib.mk to fail out with a helpful
> > > message if that prerequisite "make headers" has not been done yet.
> > > 
> > 
> > NAK NAK NAK
> > 
> > This now means I can no longer run selftests, I thank you very much! :-/
> > 
> > root@spr:/usr/src/linux-2.6# make O=defconfig-build/ -j64
> > make[1]: Entering directory '/usr/src/linux-2.6/defconfig-build'
> > ***
> > *** The source tree is not clean, please run 'make mrproper'
> > *** in /usr/src/linux-2.6
> > 
> > 
> > I've always done:
> > 
> >    cd tools/testing/selftests/x86; make
> > 
> > and that has always worked
> > 
> > Now I can't bloody well build *any* selftest or risk not being able to
> > do builds.
> 
> This change landed in 6.5, no? And 6.6 was just released. Just curious why
> you notice that now.

Dunno, last time I edited the selftests and needed to recompile was a
few weeks ago.

