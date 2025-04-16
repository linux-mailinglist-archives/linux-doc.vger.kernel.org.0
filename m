Return-Path: <linux-doc+bounces-43353-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07013A90827
	for <lists+linux-doc@lfdr.de>; Wed, 16 Apr 2025 17:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FD753A56D1
	for <lists+linux-doc@lfdr.de>; Wed, 16 Apr 2025 15:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1863C20A5C2;
	Wed, 16 Apr 2025 15:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jkQzE7U/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240C31A315F
	for <linux-doc@vger.kernel.org>; Wed, 16 Apr 2025 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819074; cv=none; b=QNDNva1/MVcv+iCs3tviniaas8Nmyw6vfMsiNqL8JIontqdC4CzUCXkTtP+z46ZattBBRWChJ2sE/LoMUFrKX7Fvh4CVqf+nIivAD0YCIjnU24gz3AdXbuqsCjZhM6tppqlpUGycSzhoz+APWeBwtfMsJAFjkkbMjz5+bLa2Qec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819074; c=relaxed/simple;
	bh=9S9IuFbsgs8KZPqreq3yn+4w+RhvRFo/Q0Nt6UptlW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvYW6mJ1w2uQ4MMO24SkEDMmde3vuBYXttUVv+CHcZBPr/3GBR0QtqFl+qx9OHEoGzxOMpIutzBHh+UPYyTvsKWx6F1+YifhUvtG6PhuZ4JnydTOdDPedLdVqy1oCYNshltYmUqWV5ZCo9Hh2qFfoKX1ZmOj8FyG9EE/8fFCYm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jkQzE7U/; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3105ef2a071so42987901fa.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Apr 2025 08:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744819070; x=1745423870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2BFadUaPx4kPrKzKiLqKhxksx9GWm7szNOqnwDCFb4=;
        b=jkQzE7U/SkQdrgS7BuGx1yqJXQ0Dpotuq+K90khWRQPmwjAYgP2mm4MV/ATcqPRfJM
         4c2xdHIqxnwfbdRKR5m7jGQg/7DKdX7tYa8VpSUaoDS3uM8Eosm+sjOkBsTzUzTpOabh
         6bkVk5xjfhNq2bBVZqGdfOdxSh4yu7cCdcrRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819070; x=1745423870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2BFadUaPx4kPrKzKiLqKhxksx9GWm7szNOqnwDCFb4=;
        b=BT1DfQUM7I7e0cHWMv6ukO4IQaYQ31l00yXejEWsvYdfouhTKDSHLYxb2jSG9NZxiM
         9TGRNe8mqo7meB05P/hwwrQEIPCcjmPovLvvZ1Oq4Y9O77oCV+0CDzvlyIc2AqaaWuz9
         x3Duda7PQNlNZCbXOeMkk6drKONUrZHTu6/CFNcszfCSnD2ER4X/CIMMd/Bv8+Si4YT3
         N+zMJEA/zy1/3he1coMiazOqHuJANl3xU2zNR8kerjB83wlmfNMAX/RLOLTd2x9mBMiO
         A5fN2JgYHGxGPlg1cntf5/AgPqm2JJgmBj58seaT08cdwXFWc9m4gDlzHNhzCFbH6+bN
         ZDIg==
X-Forwarded-Encrypted: i=1; AJvYcCV1a2FqTa/0tslmXL23OTxDjeNy9Z1Wo9ngZD6G6E0vn8Xi5jgLSu63HGjdvRE0boINhkl7870X2rE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycl2wUmTMGEtI3M0+0eqfalMFaoGMz1r+WDOrwP72ZEU4wbQ2Z
	+2NdX0fjx9tp62QTwtEPXImvEwMH3OmoWxdR2SUccb0qh9ydG9EN9zVP3tgIh7Xa1+lCgB7gnxU
	5P8wyNxrYUHgZbXiQk+eER/3qWx4ONxPh4vau
X-Gm-Gg: ASbGncuPQgtY0xQTcW08qXpP1E8CjDF4btyQjkQqC6SAccb9IT0noqd+jEx+UArUsoX
	hgvChHxJFwY9uKk11qMp3T58Mdl/2j7vpZ3zj4OFcy8G1Y3Op5E0uPLsfIbuW6OW0Qj2slaoGAg
	mwIZg1D3F2Om+xmQb/bgbdMA==
X-Google-Smtp-Source: AGHT+IHyX2q78FUMNwSUtQNeLkKZnzrpbKb8UGxVAo8YlAdq1btqxp+4vSCrcPd3BvL8dB+hWa8FRAjO0gtIQ1kP39w=
X-Received: by 2002:a2e:a591:0:b0:30d:e104:a497 with SMTP id
 38308e7fff4ca-3107f74ed34mr8515131fa.41.1744819070153; Wed, 16 Apr 2025
 08:57:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415071017.3261009-1-dualli@chromium.org> <Z_-Jcv-GN68zILvH@google.com>
In-Reply-To: <Z_-Jcv-GN68zILvH@google.com>
From: Li Li <dualli@chromium.org>
Date: Wed, 16 Apr 2025 08:57:39 -0700
X-Gm-Features: ATxdqUFa_5SkPDOk0cZck1S6bx5-8MPV9OEIKtgrjCQi4siAjFbS1rlqXflwhYk
Message-ID: <CANBPYPgN5bu-cXaQO_B1-Dk=nxBZxg7vzH-A76w2fhndTaag9g@mail.gmail.com>
Subject: Re: [PATCH v17 0/3] binder: report txn errors via generic netlink
To: Alice Ryhl <aliceryhl@google.com>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	donald.hunter@gmail.com, gregkh@linuxfoundation.org, arve@android.com, 
	tkjos@android.com, maco@android.com, joel@joelfernandes.org, 
	brauner@kernel.org, cmllamas@google.com, surenb@google.com, 
	omosnace@redhat.com, shuah@kernel.org, arnd@arndb.de, masahiroy@kernel.org, 
	bagasdotme@gmail.com, horms@kernel.org, tweek@google.com, paul@paul-moore.com, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	netdev@vger.kernel.org, selinux@vger.kernel.org, hridya@google.com, 
	smoreland@google.com, ynaffit@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 3:41=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Tue, Apr 15, 2025 at 12:10:14AM -0700, Li Li wrote:
> > From: Li Li <dualli@google.com>
> >
> > It's a known issue that neither the frozen processes nor the system
> > administration process of the OS can correctly deal with failed binder
> > transactions. The reason is that there's no reliable way for the user
> > space administration process to fetch the binder errors from the kernel
> > binder driver.
> >
> > Android is such an OS suffering from this issue. Since cgroup freezer
> > was used to freeze user applications to save battery, innocent frozen
> > apps have to be killed when they receive sync binder transactions or
> > when their async binder buffer is running out.
> >
> > This patch introduces the Linux generic netlink messages into the binde=
r
> > driver so that the Linux/Android system administration process can
> > listen to important events and take corresponding actions, like stoppin=
g
> > a broken app from attacking the OS by sending huge amount of spamming
> > binder transactiions.
>
> I'm a bit confused about this series. Why is [PATCH] binder: add
> setup_report permission a reply to [PATCH v17 1/3] lsm, selinux: Add
> setup_report permission to binder? Which patches are supposed to be
> included and in which order?
>

"[PATCH] binder: add setup_report permission" isn't a Linux kernel patch
so it's not part of this kernel patchset.

Paul was asking for a test case of selinux-testsuite in v16. I added
it in v17, which is
"[PATCH v2] policy,tests: add test for new permission binder:setup_report".
The test depends on the patch you mentioned. So I linked both of them to
the kernel patchset for your convenience. Sorry for the confusion.

In short, the kernel patchset includes 3 patches:
2025-04-15  7:10 [PATCH v17 0/3] binder: report txn errors via generic netl=
ink
2025-04-15  7:10 ` [PATCH v17 1/3] lsm, selinux: Add setup_report
permission to binder Li Li
2025-04-15  7:10 ` [PATCH v17 2/3] binder: report txn errors via
generic netlink Li Li
2025-04-15  7:10 ` [PATCH v17 3/3] binder: transaction report
binder_features flag Li Li

The corresponding test (for https://github.com/SELinuxProject/selinux-tests=
uite)
and its dependency (for https://github.com/SELinuxProject/refpolicy):

2025-04-15  7:13   ` [PATCH] binder: add setup_report permission Li Li
2025-04-15  7:47   ` [PATCH v2] policy,tests: add test for new
permission binder:setup_report Li Li

