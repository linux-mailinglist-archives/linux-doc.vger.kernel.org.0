Return-Path: <linux-doc+bounces-40220-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64491A56D02
	for <lists+linux-doc@lfdr.de>; Fri,  7 Mar 2025 17:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E7AC3B9424
	for <lists+linux-doc@lfdr.de>; Fri,  7 Mar 2025 16:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCE42206AF;
	Fri,  7 Mar 2025 16:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ai4zWkgu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6242194C78
	for <linux-doc@vger.kernel.org>; Fri,  7 Mar 2025 16:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741363265; cv=none; b=bSo9dLz81u1ZXT3LVGK6Xbuc3il90H2QveTE80s8n6+XzSKfIzdvrCpQ+xqoAtlRN53yJsiwV36lmhttrOuSXIjZE3Z0bM2SZGfOH6FhWLnSPT3ZVOEZNISTChiDpejAJm615bfhbgon1i78jOY0dh+6DJIwwySNZeurbfJ0PIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741363265; c=relaxed/simple;
	bh=nfaBHRI0nmgDdOpIx0FIBplOt0pS/eaTFzN7nuHrHao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksTw+ePwgcRdanEKwjP/AxEM3e7H7nZXvwru9qdZHDgMAMEIB4fAOCKPo9cVdwFZn53OJxY9cu0lhXr4V5afDq4ZyUYbRvWg37lY4UbsIIcMTZ5MzT5ocEN/2vUy92riNn0Xwy0UfFJ19UjphA+iq/AGqOMoEaitK5JV1+dd0lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ai4zWkgu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so17162265e9.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Mar 2025 08:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741363262; x=1741968062; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B0Iktfq0DR02GmBsXbOGq/r2zfQq6D1ECaT1ooK1s1o=;
        b=Ai4zWkguneRMqyM+IDIQL+AQLGqc5QxE84IuSiAxUfAPmL/pNHgANgKLhUxCmA7Nkf
         8X+CCVJr+SibjZRgzYi1hA/SXZfpePJt5/8merDRSJhMOqDzPysLtoXPHbnhv5YEtQBg
         xqZdSresTQiTXPHyYNW5ekDNFABjoUHtpfCzMvjSY9+gdAoNMwcY/IMB0H9S/cnlL1vf
         SkJgrTk7qR1HqItH1XIz/6i7SFmkL/FeaXxQHu3vcaPf8PzG00j9dmHOaZQuJzPiNQ5J
         3HAwWBVhMQhk27/98CnS8QERVDUqZxJp2KOJ/1KAjTDiS2Sstqm53KKoxbnaQDUhIay8
         NH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741363262; x=1741968062;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0Iktfq0DR02GmBsXbOGq/r2zfQq6D1ECaT1ooK1s1o=;
        b=GBpS34pa3w/N68rQjOqOgoUnKvpQwEUrtysj4RAMLYNa0kRZhlJhPWOri1GRPkfQUn
         mX5F3CtSMHcAliZShbsr3n26b/qWggufo2Cg+eJEjfTRslEWdK9b7PX/pzK6WjjFbPN3
         AiDNVfBb/2La0qoXbHqnm7OmEtro8aPhPzPsiub+6JHzHbt4h5mNXvtqmFUzDCUegsc1
         5wu+RaJqv1Uq9gQiD05d7e4IJ2a//2rCWV73EF0tjnHJkYV70HkCXtQwBoxzUKWW+kep
         AEBp4GjTh1DkYrHV7Sfy2Pri6JLbMbOD6F4Ff17WaNsMeqzi3ZwAyqBSPUbMLrrzK3qA
         C3Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWIYEPWA5PzXvmCC8f0zMT5JkZkJErfXvpmAOpLEssboF6diNPJwhTq7Iod+Wifpt7THDEvim8MmU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj8v2DOf0He1gK/EujoImpZGanCp4Wv3V+ywurWYoyFOlM80MF
	btYsMzX3KClLXsfwNqiYM17OoXcgX89NowK2BTMMgmaLeY+uSQNYUWqcrh1YyVw=
X-Gm-Gg: ASbGnctPliuE6w/bBtr2htGIdMJjFe8YxO35OX4hz7n9bEjCLbTTdjyoNlCXVoRKnd0
	a6w7o20NOs6lk3c9yrJlyH5mvCu+GFB3nnga9epaq2AQrtFbi34wTzbkJ3YiopJQt0XoMsagybj
	6g1Iwk7jKNWwsq6s7MEas+Wn5TS++jrKbW03LbEmOetJfkCW7bx1nyjSmxpjbUcYsPGgNnnWbh8
	FbNrXUttvg/Hbnq54v78Oj/QR9myDEMB5kU+pFe4jYNcyXbD+ukbhdMXW0kWBHjOaB7XKRH3/vz
	/szUtoN3WbTAIiTj0cVUhGDfoexA83/K5ybxU/YuUVmc0no=
X-Google-Smtp-Source: AGHT+IGwC5RdI2D2x8Mf/1yhLk8SnYyj3NhjKRRM+PHR4SpMZigqBSsZD7IJQFmATNxMAv0Q3Kbu9Q==
X-Received: by 2002:a05:6000:4185:b0:38d:e572:4dc2 with SMTP id ffacd0b85a97d-39132d98d2cmr2269618f8f.40.1741363260299;
        Fri, 07 Mar 2025 08:01:00 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8da473sm54801455e9.18.2025.03.07.08.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:00:59 -0800 (PST)
Date: Fri, 7 Mar 2025 17:00:58 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
	David Gow <davidgow@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 1/3] printf: convert self-test to KUnit
Message-ID: <Z8sYOm4qovtdOSI7@pathway.suse.cz>
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-1-5db840301730@gmail.com>
 <Z8mUH0comOCpycpK@pathway.suse.cz>
 <CAJ-ks9nFSzRXFauavzSWhvhr2Rou7qqkWi_LZ=4e1Tyr4_bn3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9nFSzRXFauavzSWhvhr2Rou7qqkWi_LZ=4e1Tyr4_bn3g@mail.gmail.com>

On Thu 2025-03-06 09:25:43, Tamir Duberstein wrote:
> On Thu, Mar 6, 2025 at 7:25 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Fri 2025-02-21 15:34:30, Tamir Duberstein wrote:
> > > Convert the printf() self-test to a KUnit test.
> > >
> > > In the interest of keeping the patch reasonably-sized this doesn't
> > > refactor the tests into proper parameterized tests - it's all one big
> > > test case.
> > >
> > > --- a/lib/test_printf.c
> > > +++ b/lib/tests/printf_kunit.c
> > > @@ -57,52 +58,50 @@ do_test(int bufsize, const char *expect, int elen,
> > >       va_end(aq);
> > >
> > >       if (ret != elen) {
> > > -             pr_warn("vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d\n",
> > > +             tc_fail("vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d",
> >
> > 1. It looks a bit strange that the 1st patch replaces pr_warn() with
> >    tc_fail() which hides KUNIT_FAIL().
> >
> >    And the 2nd patch replaces tc_fail() with KUNIT_FAIL().
> >
> >    It looks like a non-necessary churn.
> >
> >    It would be better to avoid the temporary "tc_fail" and swith to
> >    KUNIT_FAIL() already in this patch.
> >
> >    I did not find any comment about this in the earier versions of the
> >    patchset.
> >
> >    Is it just a result of the evolution of the patchset or
> >    is there any motivation for this?
> 
> The motivation was to keep the width of the macro the same in this
> first patch for ease of review, particularly in the 7 instances where
> the invocation wraps to a second line. If you prefer I go straight to
> KUNIT_FAIL, I can make that change.

I see. It might have been useful when the patch removed the trailing '\n'.
But you are going to add it back. So there won't be any hidden change.
So I would prefer to go straight to KUNIT_FAIL().

> > > @@ -842,13 +836,15 @@ test_pointer(void)
> > >       fourcc_pointer();
> > >  }
> > >
> > > -static void __init selftest(void)
> > > +static void printf_test(struct kunit *test)
> > >  {
> > >       alloced_buffer = kmalloc(BUF_SIZE + 2*PAD_SIZE, GFP_KERNEL);
> > >       if (!alloced_buffer)
> > >               return;
> >
> > I would use here:
> >
> >         KUNIT_ASSERT_NOT_NULL(test, alloced_buffer);
> >
> > And move the same change for the other kmalloc() location from
> > the 2nd patch.
> 
> I didn't do that here because I was trying to keep this patch as small
> as possible, and I wrote that in the commit message.
> 
> As for using KUNIT_ASSERT_NOT_NULL here, that would have to change
> back to an error return in the 2nd patch because this code moves into
> `suite_init`, which is called with `struct kunit_suite` rather than
> `struct kunit_test`, and KUnit assertion macros do not work with the
> former (and for good reason, because failures in suite setup cannot be
> attributed to a particular test case).

I see. KUNIT_ASSERT_NOT_NULL() can't be used in the .suite_exit() callback.

> So I'd prefer to leave this as is.

I agree to leave this as is.

Best Regards,
Petr

