Return-Path: <linux-doc+bounces-4626-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E87D980BA70
	for <lists+linux-doc@lfdr.de>; Sun, 10 Dec 2023 12:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 936471F20F86
	for <lists+linux-doc@lfdr.de>; Sun, 10 Dec 2023 11:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1213C882A;
	Sun, 10 Dec 2023 11:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwFyl/Nj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06787FE;
	Sun, 10 Dec 2023 03:45:24 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a1c7b20f895so414676866b.2;
        Sun, 10 Dec 2023 03:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702208721; x=1702813521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yp3hxbGdS2eZBPtlqCepXeiPKyyCDAaMr2U9ZBJTXkg=;
        b=LwFyl/Njv6bsLT2DAMPOZBwxWFtYrQuTwHaEH9Ok+WrVX2s14Quq10g9mEUg7zEHm9
         ZUNOhzP/ce1sWjTCot9hG/wsgMGtZxro5tA4kPQtvRS28tmM5qQRO7ydvl6QslWHVkP7
         bjVOVDipxeFDy45RdsUNg4PdoY+0Vo/zi+hOhw7jLNefj+YwhOi4h+DKPTy/wVBlOcc+
         pcvzIlqk6HwmvL3ieM1GAW2vhnvvAFV0GLG/giwMmMTssOs3Sma8n8qihzOWbOhgOLTO
         fFiW1cTDt33X7KWwSsb0lXrKPq/qXXwNpV8Tw/O9BoHttBBh04OTg14Z6ZM/+15WYpn9
         1gUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702208721; x=1702813521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yp3hxbGdS2eZBPtlqCepXeiPKyyCDAaMr2U9ZBJTXkg=;
        b=d8cndg5peX2HV4eXltkrVB5w4XHxwiUpKLt8zVhDIeXsX0+JOfvcuTfTT+KHadOpj2
         ZtpR4oqcbNgDpYwPvWYGK0IsL2tJ3PmXC8H36znMe/x8FsnyL5XOunxWE37DuxatQbJ5
         YvA6mGoefVykVFzjenZC65XG1NMN2SN44LyqetQQ8O49PsqT9jVQ4y1kU7djOL0tksVH
         2Sna/4KsEhnCED+tZwGhgYqTfJrTgnQ5gPa/Olps1EmA17gbQHs7VAA35rGu1au0OlM3
         fSbg6vcKiWV8Nk2GEwJRsLKwi9d29Wjxg6/5rPkd5xIHUeARAswGPjI241tpGte4jUh/
         KRxg==
X-Gm-Message-State: AOJu0YySlJFaayvI6Fvgz3TWyZicu5/nWKZAjn8YaoPJitEEo9qBGsYe
	A5DxFA/TFWfjDZlgkyv+9w==
X-Google-Smtp-Source: AGHT+IEqCsZ7ZXLuWOmv3maORdUwlfQjqZozZP+afPI3r5sYdATksOhbu8geeOgTbY1EoEt+o4ZFWg==
X-Received: by 2002:a17:906:512:b0:a19:a1ba:8cb6 with SMTP id j18-20020a170906051200b00a19a1ba8cb6mr1279246eja.84.1702208721021;
        Sun, 10 Dec 2023 03:45:21 -0800 (PST)
Received: from p183 ([46.53.250.155])
        by smtp.gmail.com with ESMTPSA id fj8-20020a1709069c8800b00a1d5c342674sm3295540ejc.27.2023.12.10.03.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 03:45:20 -0800 (PST)
Date: Sun, 10 Dec 2023 14:45:18 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Kees Cook <keescook@chromium.org>, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org
Subject: Re: [PATCH v3] ELF: document some de-facto PT_* ABI quirks
Message-ID: <57f5aa9d-79c5-4f65-b90f-204600edfb80@p183>
References: <2acb586c-08a9-42d9-a41e-7986cc1383ea@p183>
 <e262ea00-a027-9073-812e-7e034d75e718@infradead.org>
 <c4233c97-306c-4db8-9667-34fc31ec4aed@p183>
 <87edp7jyu4.fsf@meer.lwn.net>
 <88d3f1bb-f4e0-4c40-9304-3843513a1262@p183>
 <202312061456.2103DA1@keescook>
 <874jgugilq.fsf@email.froward.int.ebiederm.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874jgugilq.fsf@email.froward.int.ebiederm.org>

On Thu, Dec 07, 2023 at 09:03:45AM -0600, Eric W. Biederman wrote:
> Kees Cook <keescook@chromium.org> writes:
> 
> > *thread necromancy* Question below...
> >
> > On Sat, Apr 15, 2023 at 08:37:29PM +0300, Alexey Dobriyan wrote:
> >> Turns out rules about PT_INTERP, PT_GNU_STACK and PT_GNU_PROPERTY
> >> program headers are slightly different.
> >> 
> >> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> >> ---
> >> 
> >> 	v3: move to Documentation/userspace-api/
> >> 	v2: integrate into documentation build system
> >> 
> >>  Documentation/userspace-api/ELF.rst   |   34 ++++++++++++++++++++++++++++++++++
> >>  Documentation/userspace-api/index.rst |    1 +
> >>  2 files changed, 35 insertions(+)
> >> 
> >> new file mode 100644
> >> --- /dev/null
> >> +++ b/Documentation/userspace-api/ELF.rst
> >> @@ -0,0 +1,34 @@
> >> +.. SPDX-License-Identifier: GPL-2.0
> >> +
> >> +=================================
> >> +Linux-specific ELF idiosyncrasies
> >> +=================================
> >> +
> >> +Definitions
> >> +===========
> >> +
> >> +"First" program header is the one with the smallest offset in the file:
> >> +e_phoff.
> 
> Confusing e_phoff is the defined location of the array of program
> headers.
> 
> Perhaps the "First" in that array with the lowest e_phnum?
> 
> >> +"Last" program header is the one with the biggest offset in the file:
> >> +e_phoff + (e_phnum - 1) * sizeof(Elf_Phdr).
> 
> Ditto the "Last" in the array with the largest array index.
> 
> I nit pick this because it sounded at first like you were talking about
> p_offset.  Which is a value contained in the program header entry.
> 
> >> +PT_INTERP
> >> +=========
> >> +
> >> +First PT_INTERP program header is used to locate the filename of ELF
> >> +interpreter. Other PT_INTERP headers are ignored (since Linux 2.4.11).
> >> +
> >> +PT_GNU_STACK
> >> +============
> >> +
> >> +Last PT_GNU_STACK program header defines userspace stack executability
> >> +(since Linux 2.6.6). Other PT_GNU_STACK headers are ignored.
> >> +
> >> +PT_GNU_PROPERTY
> >> +===============
> >> +
> >> +ELF interpreter's last PT_GNU_PROPERTY program header is used (since
> >> +Linux 5.8). If interpreter doesn't have one, then the last PT_GNU_PROPERTY
> >> +program header of an executable is used. Other PT_GNU_PROPERTY headers
> >> +are ignored.
> 
> A more interesting property to document is that PT_GNU_PROPERTY must
> precede PT_INTERP in the linux implementation, otherwise we ignore it.
> 
> > Should we perhaps solve some of these in some way? What would folks
> > prefer the behaviors be? (I like to have things been "as expected", but
> > it's not very obvious here for redundant headers...)
> 
> All of these are really headers that should appear only once.

Yes.

> Quite frankly if we are going to do something with this my sense is that
> we should fail the execve with a clear error code as userspace should
> not be doing this, and accepting a malformed executable will hide
> errors, and perhaps hide someone causing problems.

Maybe do it for PT_GNU_PROPERTY which is relatively new.

> I really don't think having multiple copies of these headers with
> different values is something we should encourage.
> 
> It looks like -ELIBBAD is the documented way to fail and report
> a bad file format.

It is obvious you don't know how much will break.

> For PT_GNU_PROPTERTY perhaps we should accept it anywhere, instead of
> silently ignoring it depending upon it's location?
> 
> I thinking change the code to talk one pass through the program headers
> to identify the interesting headers, and then with the interesting
> headers all identified we go do something with them.
> 
> Anyway just my opinion, but that is what it feels like to me.

_Not_ checking for duplicates will result in the simplest and fastest exec.
which is what current code does.

