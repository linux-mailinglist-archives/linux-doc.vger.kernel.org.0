Return-Path: <linux-doc+bounces-47611-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F143BAC5052
	for <lists+linux-doc@lfdr.de>; Tue, 27 May 2025 15:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44B3F189F18E
	for <lists+linux-doc@lfdr.de>; Tue, 27 May 2025 13:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A876276037;
	Tue, 27 May 2025 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DBPEPISB"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336F227602A
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 13:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748354195; cv=none; b=nWWj5C8sP6TUEuLYY4vZwozFG5IbQgZSfDm6XAASgACsK4Wx0fw1xFAL49sneBu8nCv5+MW4V9lnJfWJeL29RoaWnCHaiLnJttRdDrjkTleqFHCRSIRJKlj/o4Kh+Tkrl9SCJ/IJiGC3wHSrlfy58MS+g/P9owMAJMjtEbkbFzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748354195; c=relaxed/simple;
	bh=DR0eII5fbH35C4esC9dtXj1fUTepV7Btut4D7Bi+Yo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqagmoF3Muha4T5ykDnDMkek3PXIsB+fN6oVhy+DdyIS7L616Xt5hqU+fbpfegO9zAeC3BbPIhqmXIGUqs7QAiu1/JFKPuAl0D5JFGV0GwVNjB2dBU4lZARfQuOrHNt54SaiE2WS3JfIfDwlLvUw37tcWuf4ObmoLiz5JTpQ0yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DBPEPISB; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 27 May 2025 15:56:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748354181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FLl9VxDhC/oIjgX+m65ElyBei2vf8OKiPQtUyOdtfwU=;
	b=DBPEPISBgfSQ0+cpOKL9TKTUzheLNL5fUFFpah1KlDRHiP+f2RorQQ12kUmuwzhQ3hM9/+
	aXep8APlTJpGUUHdgMd5UD3XQpN1rq/czK2GzFIPWQMP6UbWVUynRwWcU27FqS8a/hnsPf
	8Qhj4uKdcBfmBLcbqA62M1shAHCWV1g=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 09/11] kunit: uapi: Add example for UAPI tests
Message-ID: <20250527-dark-uakari-from-pluto-fbc8ae@l-nschier-aarch64>
References: <20250407-kunit-kselftests-v2-0-454114e287fd@linutronix.de>
 <20250407-kunit-kselftests-v2-9-454114e287fd@linutronix.de>
 <20250526-marvellous-abstract-koala-317cb4@l-nschier-aarch64>
 <20250526164038-12259c68-586f-4a24-a814-8ffed5778742@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526164038-12259c68-586f-4a24-a814-8ffed5778742@linutronix.de>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Mon, May 26, 2025 at 04:50:19PM +0200, Thomas Weißschuh wrote:
> On Mon, May 26, 2025 at 04:22:02PM +0200, Nicolas Schier wrote:
> > On Mon, Apr 07, 2025 at 09:42:46AM +0200, Thomas Weißschuh wrote:
> > > Extend the example to show how to run a userspace executable.
> > > 
> > > Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> > > ---
> > >  lib/kunit/.kunitconfig         |  2 ++
> > >  lib/kunit/Makefile             |  9 ++++++++-
> > >  lib/kunit/kunit-example-test.c | 15 +++++++++++++++
> > >  lib/kunit/kunit-example-uapi.c | 22 ++++++++++++++++++++++
> > >  4 files changed, 47 insertions(+), 1 deletion(-)
> > 
> > 
> > Adding this diff allows 'make clean' to clean up the UAPI test binary:
> > 
> > 
> > diff --git a/lib/Makefile b/lib/Makefile
> > --- a/lib/Makefile
> > +++ b/lib/Makefile
> > @@ -112,8 +112,6 @@ CFLAGS_REMOVE_test_fpu_impl.o += $(CC_FLAGS_NO_FPU)
> >  # Some KUnit files (hooks.o) need to be built-in even when KUnit is a module,
> >  # so we can't just use obj-$(CONFIG_KUNIT).
> > -ifdef CONFIG_KUNIT
> > -obj-y += kunit/
> > -endif
> > +obj-$(if $(CONFIG_KUNIT),y) += kunit/
> 
> Wouldn't the following be sufficient?
> 
> obj-y += kunit/
> 
> The the kunit Makefile doesn't do anything if CONFIG_KUNIT=y and AFAIK for
> directories obj-m and obj-y should do the same.

that's wrong.  In lib/kunit/Makefile there is

    obj-y += hooks.o

thus, lib/kunit/hooks.o would then be built unconditionally (even w/o 
CONFIG_KUNIT).

Iff we would add 'obj-y += kunit/' in lib/Makefile we'd have to adjust the 
hooks.o line in lib/kunit/Makefile appropriately.

> 
> >  
> >  ifeq ($(CONFIG_DEBUG_KOBJECT),y)
> >  CFLAGS_kobject.o += -DDEBUG
> > 
> > 
> > 
> > plus the 'clean-files' addition below.
> 
> <snip>
> 
> > > diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
> > > index 989933dab9ad2267f376db470b876ce2a88711b4..1b6be12676f89cafa34f0093d8136b36f4cf5532 100644
> > > --- a/lib/kunit/Makefile
> > > +++ b/lib/kunit/Makefile
> > > @@ -30,4 +30,11 @@ obj-$(CONFIG_KUNIT_TEST) +=		string-stream-test.o
> > >  obj-$(CONFIG_KUNIT_TEST) +=		assert_test.o
> > >  endif
> > >  
> > > -obj-$(CONFIG_KUNIT_EXAMPLE_TEST) +=	kunit-example-test.o
> > > +userprogs +=				kunit-example-uapi
> > 
> > clean-files +=				kunit-example-uapi
> 
> This shouldn't be necessary as $(userprogs) is automatically added to
> __clean-files in scripts/Makefile.clean.

oh yes, you're right.  Please do not any of these 'clean-files' lines.

Kind regards,
Nicolas

