Return-Path: <linux-doc+bounces-7201-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 721A8836F3F
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jan 2024 19:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0DBA286778
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jan 2024 18:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FEA58ADA;
	Mon, 22 Jan 2024 17:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BfY0v7rd"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B28B59B6C
	for <linux-doc@vger.kernel.org>; Mon, 22 Jan 2024 17:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705945043; cv=none; b=LjdK3x8fm4KZx3nwrm/KJ1OYgIXQ5aiqxeIK1CLS86ILTcly7AiwG+vtdeyhN+EA7Y8jk1Gyf1nPQYCZZuIAwej/Nctsc1GdtyCG7tKi0WZouuVS32ohnTDL11enh25ahkks4drv+IMPOpijXmA4lNdO/lz83J45RoB/PosBgWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705945043; c=relaxed/simple;
	bh=m8kPm/j1LsdrYXYN+YQDJ7r2rWymD6BOjcIeRkuQtHQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SnvSK+ZEy1ynVdnwrlalv44x/8cVGcaTSnknLXSOG9NnpKlOKiHdoirYEWm4DHsZKbrxZhrjOkKDEQj1B1DtJlddPn/2Y8Go4oPMZ4EWWxFjXKUi+YdYERg4Dh3woMWLCUhbW0rrCQxtbdoefLs/uyeVaVXByeOWFMWWS9McmOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BfY0v7rd; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cd2f472665so32867361fa.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Jan 2024 09:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705945038; x=1706549838; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s9fIVUDS4JPjZqnrZBBkM7zrxIcZN1SBne4vcNi0x/g=;
        b=BfY0v7rdDpiZmmLYYWoDuF0YGEp4K60GdHWqajby71boVGC+Cx4MCVWe2LEGjUDLSF
         W3PgujIF3cQnKaeevPdoqwDC4p6jFFYyZC89Tcpww66tRVUTjpmO19rM2IVK4h9YavVy
         9mbH4cJuneSFhXQkUvwKzqhmvxCqSEmMIQKFGPsvDMxGvVVTPzJrdeEn6xME3pz3EIFF
         XbobTiM2JA5pM8Bov8H4Bd+3voY0WLU95PnjM5MZmHUxd5ZwsYQxSJVmgnb5HCsSfxYt
         pEbW56jgInd/J19p/bpeQ9bRZEezjH6CP2j93CvjnuNANu4L4357o86RMqe23ct+Si3A
         rf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705945038; x=1706549838;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s9fIVUDS4JPjZqnrZBBkM7zrxIcZN1SBne4vcNi0x/g=;
        b=BiXzoSrrolPTvGCaukV/8XTDfLl8I8lrSiHJRuRx3bgkluL6sGi8JCcoxJZvJUmTFI
         zF1V6yvBDU1ZImVkgkwJgZQkomYpfl6HEqJK+VV4iND5VqMS+v6WxKNcAoRAPFrF4NH5
         KcPszMdhdubjSUmXUwvf5LSon5yqvtCcVVylZK2iDrWlfCZvhEzKslFpUNdqMlGvgwQO
         Dr/WZijic+8Pr8hC4CtYAg71rb7RbOU7UfeC93NMTW9lKjDFpsz7anY7iE/uCn/xpfjj
         zXOIsCMzXsWr8b8oNdEdeghKkzeNI3OKoczah+UHoFJcQrD9GIsXVvtq6rP7RdpZxqPK
         rPCA==
X-Gm-Message-State: AOJu0YyXUAQWRThn3mlbo7p+hViEaH4fhbLndg72QNzVLgOK/e1LNP7Y
	Ey54J9RKsEOPkpOhfCqtLvx5ga/+RmALYL+8Q+G01c/m4yGEIBgnvIWED8FHzgV51m+/m4CX5vQ
	Ciog=
X-Google-Smtp-Source: AGHT+IGtMtcqWkvVLEoaIeMoHtV2CsA0V+GTi7mnCKwegjzg2YjeUcTa13uMM6pmGiJG+dRvm4j+ag==
X-Received: by 2002:a2e:a4a7:0:b0:2cc:ceb2:372a with SMTP id g7-20020a2ea4a7000000b002ccceb2372amr1541040ljm.96.1705945038673;
        Mon, 22 Jan 2024 09:37:18 -0800 (PST)
Received: from ?IPv6:2804:30c:974:ac00:1b02:e2fd:23be:79bc? ([2804:30c:974:ac00:1b02:e2fd:23be:79bc])
        by smtp.gmail.com with ESMTPSA id j26-20020a056e02221a00b00361a166564csm3015628ilf.4.2024.01.22.09.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 09:37:18 -0800 (PST)
Message-ID: <dfcf46def7a4b27e30bed0e832fbf24fd7b36310.camel@suse.com>
Subject: Re: [PATCH v6 1/3] kselftests: lib.mk: Add TEST_GEN_MODS_DIR
 variable
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Josh
 Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, Miroslav
 Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>
Cc: linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
	live-patching@vger.kernel.org
Date: Mon, 22 Jan 2024 14:37:09 -0300
In-Reply-To: <5aceb855-2862-4d53-b27b-50e2956e099b@linuxfoundation.org>
References: <20240112-send-lp-kselftests-v6-0-79f3e9a46717@suse.com>
	 <20240112-send-lp-kselftests-v6-1-79f3e9a46717@suse.com>
	 <5aceb855-2862-4d53-b27b-50e2956e099b@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-01-22 at 10:15 -0700, Shuah Khan wrote:
> On 1/12/24 10:43, Marcos Paulo de Souza wrote:
> > Add TEST_GEN_MODS_DIR variable for kselftests. It can point to
> > a directory containing kernel modules that will be used by
> > selftest scripts.
> >=20
> > The modules are built as external modules for the running kernel.
> > As a result they are always binary compatible and the same tests
> > can be used for older or newer kernels.
> >=20
> > The build requires "kernel-devel" package to be installed.
> > For example, in the upstream sources, the rpm devel package
> > is produced by "make rpm-pkg"
> >=20
> > The modules can be built independently by
> >=20
> > =C2=A0=C2=A0 make -C tools/testing/selftests/livepatch/
> >=20
> > or they will be automatically built before running the tests via
> >=20
> > =C2=A0=C2=A0 make -C tools/testing/selftests/livepatch/ run_tests
> >=20
> > Note that they are _not_ built when running the standalone
> > tests by calling, for example, ./test-state.sh.
> >=20
> > Along with TEST_GEN_MODS_DIR, it was necessary to create a new
> > install
> > rule. INSTALL_MODS_RULE is needed because INSTALL_SINGLE_RULE would
> > copy the entire TEST_GEN_MODS_DIR directory to the destination,
> > even
> > the files created by Kbuild to compile the modules. The new install
> > rule copies only the .ko files, as we would expect the gen_tar to
> > work.
> >=20
> > Reviewed-by: Joe Lawrence <joe.lawrence@redhat.com>
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> > ---
> > =C2=A0 Documentation/dev-tools/kselftest.rst |=C2=A0 4 ++++
> > =C2=A0 tools/testing/selftests/lib.mk=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 26 +++++++++++++++++++++-
> > ----
>=20
>=20
> Hi Marcos,
>=20
> I would like the doc patch and lib.mk patch separate. If lib.mk needs
> changes
> we don't have to touch the doc patch.

Hi Shuah,
on patch 2/3 you also said that you would like to have the
documentation changes split in the future, and that you picked the
changes into a testing branch. Does it also applies to this patch?

Do I need to resend the three patches and separate the documentation
part into a new one, or can I apply this rationale to future changes to
lib.mk? Sorry, I'm confused.

Thanks in advance,
  Marcos

>=20
> thanks,
> -- Shuah


