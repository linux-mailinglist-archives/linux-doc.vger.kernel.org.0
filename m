Return-Path: <linux-doc+bounces-35255-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11806A11094
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jan 2025 19:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B61643A3333
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jan 2025 18:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BE01FDA92;
	Tue, 14 Jan 2025 18:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sv3uIoG+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205491F9ABE
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 18:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736881107; cv=none; b=AgY1ki2Y5hchfuCrB94gnJraWf8hTD/KdWQAuqWAeBExBjBQMJIF/3CBJbv+mxBNFRxRSk0sh7OGihcQmiUYsnF98wSQ6uX6vZXaKl55GPxY5DzBrWZajLQjU3lTigTug2WRUxxQRKsTEykxUx9xUPIaA5XCQn353xicYlSSEgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736881107; c=relaxed/simple;
	bh=iKe/Ir7F11LNiqHDMJ30bCROVh05nyv6d7BmrLXKNNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGBJ8BJI/FzNrL3LgDtZmkJ7CTmUK/6Za/yp6rOVhmbk/03e3vgDna5BZG4cU21Dxi45PswBAbhQFHBX+658VlRWLO1EphVKgWd37NRD8jL3/Q2l+6iam0DVrWASucM6+QHbAYDScksgaPI6rZACMJqz6rquzeUOllmZ0v67ggk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sv3uIoG+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-219f6ca9a81so147235ad.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 10:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736881104; x=1737485904; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t2CWdiE+Y588cATxDxllUErMB/2Ly3FWAF67BGEJO/4=;
        b=Sv3uIoG+7ybTo6/20hlUgLSpZCTtlmaGT0HRF+CCEQ6gd6WATFrWywTTBPM/9I6CTg
         /5rMAGJMR/9JIP8pYgo0KsULbGgvxqtI8gW9gVm3HSUDxExTLGoCLwxkAlwj/oI2DuIQ
         2/OnjPOYCGMRrOuU0JLYMVdObEcdW+1WYIINM1IiKIpxELyRUfRKcYiG3FxJxF+Q/Fed
         ChHbFFIqt1X87kbBknso6RhuMUHWSRP4VtKf/9iWlmN+s4J5MyqAtfXkQVb8zb+GT8xn
         wtoTw3h+foApVHIq6BRBg9974sDe1rM0Qu/n71XDuVWJFI/RaDO7OXHqMGVG2gAtTxLZ
         sz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736881104; x=1737485904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2CWdiE+Y588cATxDxllUErMB/2Ly3FWAF67BGEJO/4=;
        b=E/dXrMTsipq7Yd5xi7kna+X4UPztYcQCcIxxYrXmcAedIUdTN80YA6VRFIv2Wc1Tpb
         dyNkCT2pQ1njWFqRWQotS6hkqYc6CaFoFqPzY6zikc+9YvYTO/SOKlkwb2JW1XqGuPIo
         CrAoe+rM74f7V7xAPRzEz1XdZnVR4RRMpDRAiEGT0ON5RpD+2hzzd373oH/NbznIuW2e
         JA27eKpBJHqBv9HVBOAyNnsxTOSSIRLOq4wGnyYiXJXKlj75hhOfLM16TV3JXFPV4s1/
         8UEw8S0wy4PfK3ObPNkK3RR9wE4L00p7hRoQsuv5N0TMYAvBuofTCXuJpqD1BEMRevzM
         GfyA==
X-Forwarded-Encrypted: i=1; AJvYcCUWh2CG74Pfz98gzY8Z0EKLjGXnp64t1+JCXJVTsDUxCo6FeRHmfCUN/MRPjzCbjbOkKxePQzYZCuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjSbGKUufWIo6sCuu7mdBUmb7w/IqKSttKgdFscYou6vQESuEb
	s8BRYa793W/UrjPm4CfkAnL3J0PKMKQmD38RtjUvTFklpP/aLMZC2TpfJq4GOA==
X-Gm-Gg: ASbGncvCud8LqpdvCPZYpwg9JUW7fZ4LhscZEhIlpTX+/02HltHY6I141xohZcyt54w
	Ls73B9/c08x26i0cVcsW00p/RYQnVzylAnUzrIaHvNeZJqqidok8wVqyngiHjN8Gncmu8xVvDOT
	RF7YG87ANBjLmrqm36vmlveDCUCHkPM0oH5nEp9NTcF0MMocaP9qdCY+Su8EooEf4yhJR8LGdW6
	fTKLecExKO2wGmKWs/YxINDKUy3tCubP9ZDevy8AhzKJPzF8VKu+yn0hfI52qrxu4Yoq2M0WscS
	lO7PWTh53BP9m64JtuA9erzoa9A=
X-Google-Smtp-Source: AGHT+IG/013Oj515jx+bAnxAgTCQ+vTnK59fPTZt8oVE2ZAEpSVnb9QRz1EEDwXZHaYE7mba9SJ2Ig==
X-Received: by 2002:a17:903:492:b0:20b:5e34:1850 with SMTP id d9443c01a7336-21bf0e598d9mr26285ad.23.1736881104251;
        Tue, 14 Jan 2025 10:58:24 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f2339dasm69151185ad.177.2025.01.14.10.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 10:58:23 -0800 (PST)
Date: Tue, 14 Jan 2025 18:58:19 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v13 5/5] rust: Use gendwarfksyms + extended modversions
 for CONFIG_MODVERSIONS
Message-ID: <20250114185819.GA2222429@google.com>
References: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
 <20250103-extended-modversions-v13-5-35d87c65ee04@google.com>
 <CAK7LNATGw-m_dcdjTBHsFwCZh7mTt8q8yNZQ7VFP=hMU8NvUvg@mail.gmail.com>
 <CABCJKuf-w1puUsypU-cr5BH8uvCdPPQmhZZ1qVKDDg3Y-iQhSg@mail.gmail.com>
 <CAK7LNASh4xMN8nN5vwR6R1OCNW9u4MJz=CSwW4_4hvFOhczmWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASh4xMN8nN5vwR6R1OCNW9u4MJz=CSwW4_4hvFOhczmWA@mail.gmail.com>

On Tue, Jan 14, 2025 at 10:22:15AM +0900, Masahiro Yamada wrote:
> On Tue, Jan 14, 2025 at 5:04 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > Hi Masahiro,
> >
> > On Fri, Jan 10, 2025 at 6:26 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > On Sat, Jan 4, 2025 at 2:37 AM Matthew Maurer <mmaurer@google.com> wrote:
> > > >
> > > > From: Sami Tolvanen <samitolvanen@google.com>
> > > >
> > > > Previously, two things stopped Rust from using MODVERSIONS:
> > > > 1. Rust symbols are occasionally too long to be represented in the
> > > >    original versions table
> > > > 2. Rust types cannot be properly hashed by the existing genksyms
> > > >    approach because:
> > > >         * Looking up type definitions in Rust is more complex than C
> > > >         * Type layout is potentially dependent on the compiler in Rust,
> > > >           not just the source type declaration.
> > > >
> > > > CONFIG_EXTENDED_MODVERSIONS addresses the first point, and
> > > > CONFIG_GENDWARFKSYMS the second. If Rust wants to use MODVERSIONS, allow
> > > > it to do so by selecting both features.
> > > >
> > > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > > Co-developed-by: Matthew Maurer <mmaurer@google.com>
> > > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > > ---
> > > >  init/Kconfig  |  3 ++-
> > > >  rust/Makefile | 34 ++++++++++++++++++++++++++++++++--
> > > >  2 files changed, 34 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/init/Kconfig b/init/Kconfig
> > > > index c1f9eb3d5f2e892e977ba1425599502dc830f552..b60acfd9431e0ac2bf401ecb6523b5104ad31150 100644
> > > > --- a/init/Kconfig
> > > > +++ b/init/Kconfig
> > > > @@ -1959,7 +1959,8 @@ config RUST
> > > >         bool "Rust support"
> > > >         depends on HAVE_RUST
> > > >         depends on RUST_IS_AVAILABLE
> > > > -       depends on !MODVERSIONS
> > > > +       select EXTENDED_MODVERSIONS if MODVERSIONS
> > > > +       depends on !MODVERSIONS || GENDWARFKSYMS
> > > >         depends on !GCC_PLUGIN_RANDSTRUCT
> > > >         depends on !RANDSTRUCT
> > > >         depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
> > > > diff --git a/rust/Makefile b/rust/Makefile
> > > > index a40a3936126d603836e0ec9b42a1285916b60e45..80f970ad81f7989afe5ff2b5f633f50feb7f6006 100644
> > > > --- a/rust/Makefile
> > > > +++ b/rust/Makefile
> > > > @@ -329,10 +329,11 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ;
> > > >  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
> > > >         $(call if_changed_dep,bindgen)
> > > >
> > > > +rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ { printf $(2),$(3) }'
> > > > +
> > > >  quiet_cmd_exports = EXPORTS $@
> > > >        cmd_exports = \
> > > > -       $(NM) -p --defined-only $< \
> > > > -               | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
> > > > +       $(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3) > $@
> > >
> > > I noticed a nit:
> > >
> > > Both of the two callsites of rust_exports pass
> > > '$$3' to the last parameter instead of hardcoding it.
> > >
> > > Is it a flexibility for future extensions?
> > >
> > > I cannot think of any other use except for printing
> > > the third column, i.e. symbol name.
> >
> > Good catch, the last parameter isn't necessary anymore. It was used in
> > early versions of the series to also pass symbol addresses to
> > gendwarfksyms, but that's not needed since we read the symbol table
> > directly now.
> 
> If you submit a diff, I will squash it to 5/5.
> (You do not need to input commit description body)

Thanks, here's a diff that drops the last parameter.

Sami


diff --git a/rust/Makefile b/rust/Makefile
index 80f970ad81f7..ab300bfb46f6 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -329,11 +329,11 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ;
 $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
 	$(call if_changed_dep,bindgen)
 
-rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ { printf $(2),$(3) }'
+rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ { printf $(2),$$3 }'
 
 quiet_cmd_exports = EXPORTS $@
       cmd_exports = \
-	$(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3) > $@
+	$(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n") > $@
 
 $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
 	$(call if_changed,exports)
@@ -404,7 +404,7 @@ endif
 
 ifdef CONFIG_MODVERSIONS
 cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
-	$(call rust_exports,$@,"%s\n",$$3) | \
+	$(call rust_exports,$@,"%s\n") | \
 	scripts/gendwarfksyms/gendwarfksyms \
 		$(if $(KBUILD_GENDWARFKSYMS_STABLE), --stable) \
 		$(if $(KBUILD_SYMTYPES), --symtypes $(@:.o=.symtypes),) \

