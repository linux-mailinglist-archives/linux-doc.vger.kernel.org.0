Return-Path: <linux-doc+bounces-19888-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C16E91EF2E
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jul 2024 08:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30C65285C3A
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jul 2024 06:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD87152E13;
	Tue,  2 Jul 2024 06:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S2tAOdrD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E8D152534
	for <linux-doc@vger.kernel.org>; Tue,  2 Jul 2024 06:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719902293; cv=none; b=N5v2yycb31HnmQmVlxA+95HrnyKnk07kG9mshdgkMMjLOYHow7u5ERS5TU6iCnAlU55YZb+NDrodl7YEJ1tGhirRDM5YI2AYR+/yy3+i3JUImoJDTayWEb/nJc5YUVuP8zY/0iIgqDf8zm4KreUjvWXcURAsnW0adQqFkMbs4Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719902293; c=relaxed/simple;
	bh=uVGTXrCZ95rXnFyM1jW4IBOOvZ8iiNQ34mCxGz8eJdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YpMxtRcxhgI2SEy18t4F7EGmzXOG+20XpmNhxZeUfC81bCAs/q276Y+w9cUu93+gv31Rog4XXiteX2zH3/RCbQ6VIaBWid24mmYCrQYSswfluqSbmMbST/e18ZlmsHoYRRgMzqMNmDbrQsuYrSS96dibM9QnQSbwMMpz/NWh6iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S2tAOdrD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3676447928bso2191484f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Jul 2024 23:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719902289; x=1720507089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNCv1zHEy8SjFr6U2erVD2AzxRdRE5SVwR5I879o2aE=;
        b=S2tAOdrDYRoYwhxS3oL/kT+3zSkESMc5YsrOQ13/yjFpeUDvryrP1bjgQ485v6MGoR
         kagPCqwCp7thLejQ6CTrFd2i8Xg/g04VYgQjl1FnoQQjJbg9bvzn3fRvjtC6b2G8/gPP
         CfgWK+2YAarHc16IFHG5LZ1WMeiCh/VfjmewSTLKfpIgiwyGJOaEU9Toho3uwCvb0xfY
         BUsLlCHooCUXAg4X2Gv0yY4ngGg4CPKl3kpkkhzSzlQkKptrJvbgxu0joZdp9oRt2tnk
         jFjrMbBx33XLVvGB2sLEULYXiHzDEsYIHl5tSkJF8WmLhR9LB/ETvfrgVtkZEvhidtCd
         QQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719902289; x=1720507089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNCv1zHEy8SjFr6U2erVD2AzxRdRE5SVwR5I879o2aE=;
        b=fANKnJipT5fW9gNXuQXP8CYXcxxDNEGuYcXOGuc+pk01q4Oktd9YnsIWOlBbGABxLV
         wGSPcWKITMYLNlFCmgALDiRin9L26qbZfhTNblTO/Qi6MhFJs8C23/tIo1JFU8eYw05i
         dTSSkzSvesEZHQdo9ynR5J0hn0h7itW70VIDMPkr3QtE49KV4UZc3U/G/K8nL6G6+puk
         ljvpId40d6oPfullw2Fboceg9RoJtqk5d1tnaVuA/56yMcxpKhUORGKcR+zUmN0LQ6zd
         By/MaPcoaVtWh4oo/XyIAjua4DQ1P6GtSNqjgz+WAjW6KJhS1OkVaBF9Bn7vYXIiunK7
         x6ug==
X-Forwarded-Encrypted: i=1; AJvYcCUa1vbkh5mAEbpHAlIcFqGdkmBi0qNnLqlFkz/eueTRv+E9xim8MFz3aJwK5GDhh/fMW6Q707t8diT1EYCGH4FfrXcRF/iRbXaU
X-Gm-Message-State: AOJu0Yzot1LRlBl4sNbg8/2gQ9+0m2nAhem5TQxsDTXXIn/JQlcYYS21
	Jga7ewhROOEh9DMLerMw3I4B2huKF/Eu9i011zeLRQx7dgDmALwZdvMG6u8U+Atqh1IavbdQdOF
	pkb78VDXbhvqhrMlsx1cYcjIQB5wlwSTNoR2xl4QVLiKwLfdLGET7
X-Google-Smtp-Source: AGHT+IHFFIpP0I+ybtmWQvASLb2wmgzFLFQ4KKDZRXguJSPBoitxkQ1JFanEaFATLkfV3ZeHp5H9vkHujV1yOOdWuF8=
X-Received: by 2002:a5d:58c3:0:b0:367:8147:92af with SMTP id
 ffacd0b85a97d-367814793femr695746f8f.69.1719902289308; Mon, 01 Jul 2024
 23:38:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701184912.01f1f9ce@canb.auug.org.au> <20240701201448.7878e9b35e1569bfc1f2ddbc@linux-foundation.org>
 <CACw3F52=GxTCDw-PqFh3-GDM-fo3GbhGdu0hedxYXOTT4TQSTg@mail.gmail.com>
 <CACw3F52wm=5Rg+QP-E7JDOjBvA2mYv0uDBL+8=KPCfQ8tkHQaA@mail.gmail.com> <20240701231826.fb3044bb52dc97bedc9853ab@linux-foundation.org>
In-Reply-To: <20240701231826.fb3044bb52dc97bedc9853ab@linux-foundation.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Mon, 1 Jul 2024 23:37:55 -0700
Message-ID: <CACw3F52_obAB742XeDRNun4BHBYtrxtbvp5NkUincXdaob0j1g@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the mm tree
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 11:18=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 1 Jul 2024 21:33:20 -0700 Jiaqi Yan <jiaqiyan@google.com> wrote:
>
> > > > This seems a reasonable thing to do so there's probably some way in
> > > > which to do it, but a bit of grepping failed to turn up examples in
> > > > existing .rst files.  Can someone please suggest?
> > >
> > > It seems I need to add some blank lines according to [1], especially
> > > to add a blank line above the first list item:
> > >
> > > diff --git a/Documentation/admin-guide/sysctl/vm.rst
> > > b/Documentation/admin-guide/sysctl/vm.rst
> > > index 75e22137d849..74b4c0f65213 100644
> > > --- a/Documentation/admin-guide/sysctl/vm.rst
> > > +++ b/Documentation/admin-guide/sysctl/vm.rst
> > > @@ -274,12 +274,15 @@ Correctable memory errors are very common on
> > > servers. Soft-offline is kernel's
> > >  solution for memory pages having (excessive) corrected memory errors=
.
> > >
> > >  For different types of page, soft-offline has different behaviors / =
costs.
> > > +
> > >  - For a raw error page, soft-offline migrates the in-use page's cont=
ent to
> > >    a new raw page.
> > > +
> > >  - For a page that is part of a transparent hugepage, soft-offline sp=
lits the
> > >    transparent hugepage into raw pages, then migrates only the raw er=
ror page.
> > >    As a result, user is transparently backed by 1 less hugepage, impa=
cting
> > >    memory access performance.
> > > +
> > >  - For a page that is part of a HugeTLB hugepage, soft-offline first =
migrates
> > >    the entire HugeTLB hugepage, during which a free hugepage will be =
consumed
> > >    as migration target.  Then the original hugepage is dissolved into=
 raw
> > >
> > > But I am having trouble testing the build, so wasn't able to validate
> > > the change above:
> > >
> > > Documentation$ make
> > > /tools/net/ynl/ynl-gen-rst.py -o
> > > /Documentation/networking/netlink_spec/index.rst -x
> > > make: /tools/net/ynl/ynl-gen-rst.py: No such file or directory
> > > make: *** [Makefile:113:
> > > /Documentation/networking/netlink_spec/index.rst] Error 127
>
> You need to install all sorts of whacky system and python packages.
> The (failed) build process should guide you through this.
>
> > I tried another way: make htmldocs at repo's root directory. Although
> > I wasn't able to finish the make process,
> >
> > - without the blank lines:
> >
> >   Documentation/admin-guide/sysctl/vm.rst:278: ERROR: Unexpected indent=
ation.
> >   Documentation/admin-guide/sysctl/vm.rst:279: WARNING: Block quote
> > ends without a blank line; unexpected unindent.
> >
> > - with the blank lines added, the ERROR and WARNING in vm/rst are gone.
> >
> > Andrew and Stephen, what is the best way to post the fix for this?
> > Should I send out a v8 of the patch with the blank lines added? or a
> > standalone commit for this fix?
>
> I added your fix, thanks.

Ah, sorry Andrew, I should sent out this diff, as there are more blank
lines needed:

diff --git a/Documentation/admin-guide/sysctl/vm.rst
b/Documentation/admin-guide/sysctl/vm.rst
index 75e22137d849..f48eaa98d22d 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -274,12 +274,15 @@ Correctable memory errors are very common on
servers. Soft-offline is kernel's
 solution for memory pages having (excessive) corrected memory errors.

 For different types of page, soft-offline has different behaviors / costs.
+
 - For a raw error page, soft-offline migrates the in-use page's content to
   a new raw page.
+
 - For a page that is part of a transparent hugepage, soft-offline splits t=
he
   transparent hugepage into raw pages, then migrates only the raw error pa=
ge.
   As a result, user is transparently backed by 1 less hugepage, impacting
   memory access performance.
+
 - For a page that is part of a HugeTLB hugepage, soft-offline first migrat=
es
   the entire HugeTLB hugepage, during which a free hugepage will be consum=
ed
   as migration target.  Then the original hugepage is dissolved into raw
@@ -296,8 +299,11 @@ the request to soft offline the pages.  Its
default value is 1.

 It is worth mentioning that after setting enable_soft_offline to 0, the
 following requests to soft offline pages will not be performed:
+
 - Request to soft offline pages from RAS Correctable Errors Collector.
+
 - On ARM, the request to soft offline pages from GHES driver.
+
 - On PARISC, the request to soft offline pages from Page Deallocation Tabl=
e.

 extfrag_threshold

