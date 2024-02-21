Return-Path: <linux-doc+bounces-10300-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDDC85EA13
	for <lists+linux-doc@lfdr.de>; Wed, 21 Feb 2024 22:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD7FD1C23E70
	for <lists+linux-doc@lfdr.de>; Wed, 21 Feb 2024 21:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA761272C6;
	Wed, 21 Feb 2024 21:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="CD/Z8BK7"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919DF1272A6
	for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 21:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708550658; cv=none; b=atH+WBqhEWatFP6XIJN2SBlyM252ApLmmVgBb3zthqqnXd12VIFgBLTeRNhf7PiDTEkB5BO0gs7ljSjqXF6LJb21SimUf1WiSDOt0YCZvblWBO98tPHgBD4mQoA9RIhR7gsxebu3j5rhlQSCJPRXLfI6VQVugSIHKwMyGtm7NiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708550658; c=relaxed/simple;
	bh=cZXkUcelidv55pcogEZ5q8CQsV5tGZzpTAAvQxpkWOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GdNXWjVHWX6BLrVXG2k6tDpZqVRViXsfTWjCo6NfkfIzfUaau0yY+5RFGLnu2Wc6x9GLsU4sWaM+Rmpj3H9KXpSYIreCbw8TLvILdZcn3oi2O6i3WAmxuttQ0k9O7gdAzgKmMDmth41YLxgixrwxv5kly2rcnj9LDwd15iXnvd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=CD/Z8BK7; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6e44a309b6fso1764810a34.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 13:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708550656; x=1709155456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZXkUcelidv55pcogEZ5q8CQsV5tGZzpTAAvQxpkWOQ=;
        b=CD/Z8BK7Rp9L3i5Vl3s2KolMt7yZM3Q7SV1NrREyMTfzFMVwamp0srcydy69ptyQJn
         QXSSqU31Y95owRZ167SQF3FdA3AuKMFckDCDMgq52UyBL2DglRABg7BatfCiiEhFvdrs
         50eRs7e0ctmnkZhCHUQIzE22K+8+RjFGVMUOfer6IBBrxibv9FJqB8lZLekkBAUHlrcK
         fK7XYKOrVx125m1pLAnDgz7S9JgR3h0CmVz/xvIlHXzYcZZ/DjgPKtk+CPQ9SH3PAId+
         nvooirTukSELTOSVm+fMpwLm+WfP74t0mos9xXu9O7qBhtlU34sLNfg9keaEfyE0eDHQ
         a3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708550656; x=1709155456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZXkUcelidv55pcogEZ5q8CQsV5tGZzpTAAvQxpkWOQ=;
        b=C3UPDmxAr0D0+keNQqcPsLDU9EOYXQt37w34tOZhxe46OptzAFe7DofZnECHbZmTbQ
         Xuy3c9LqAz1KpyAc2er45UB1ywuNT3sVs0Esa/4ksia7zWahHi0RlkcrdTE8oTxvbz6j
         Hu6ggj+0LIg18VoSUnb9ue7Uoo1V3eEQIuTrCfMM0SRpn6CLBJN/DHbHpmpVaavMx0Nl
         d5tsoRFqLnvr3GVw+7eEbCagNLGZUHxBxuzg7rC5YbnWwYDDFTe0PObTLaa+zuQ7upC8
         Hwd1nLsi2BF2VkuWZ51+aqzx1PmjAot8pzGVJEQZnMBoaHEAjCT4EyCN2LyjtiZc7CCQ
         fdwA==
X-Forwarded-Encrypted: i=1; AJvYcCWnLurDvrDLC8Nxrop9219D7WIXHJZCUl1O22N3XFstiFZ8pTPlxmWucSqRXxeSPJax0aMRc9TMLVgph8O2CXkhvedyuXdVXMrW
X-Gm-Message-State: AOJu0YyF9tH2Hq/Twl3ks8m7mXUlKv4HtKpDMXndnEiccw7NsgagrSWp
	InerANYAk1xHzjQt3xTDsLNNPcv6PHblZwlk55YbirwI0fpjVjHIb8Bs1w5odt2OTr1yxA49EeF
	E8zKB95Zve7NGdCEzPokIRhMabI2LYi4cBBi8BA==
X-Google-Smtp-Source: AGHT+IFvWKjWPK3amI8VL9W53BBk35ttzb77PzRBdxcUJJDHyxRlktLp+XaDhvA82AT8l0qmpbPOUDFRSVqjGiC7KOY=
X-Received: by 2002:a05:6830:1005:b0:6e2:eba0:ec4d with SMTP id
 a5-20020a056830100500b006e2eba0ec4dmr18796951otp.33.1708550655819; Wed, 21
 Feb 2024 13:24:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com> <20240221194052.927623-6-surenb@google.com>
In-Reply-To: <20240221194052.927623-6-surenb@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 21 Feb 2024 16:23:39 -0500
Message-ID: <CA+CK2bAAzRfsDYG+LVvp9LAJLpJoakhTAB3i6JiGDogvz8kfHg@mail.gmail.com>
Subject: Re: [PATCH v4 05/36] fs: Convert alloc_inode_sb() to a macro
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, yosryahmed@google.com, yuzhao@google.com, 
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com, 
	keescook@chromium.org, ndesaulniers@google.com, vvvvvv@google.com, 
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com, 
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, 
	glider@google.com, elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 2:41=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> From: Kent Overstreet <kent.overstreet@linux.dev>
>
> We're introducing alloc tagging, which tracks memory allocations by
> callsite. Converting alloc_inode_sb() to a macro means allocations will
> be tracked by its caller, which is a bit more useful.
>
> Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

