Return-Path: <linux-doc+bounces-29895-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D92F9BC34D
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2024 03:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFAB51C22A48
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2024 02:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C87D36AF5;
	Tue,  5 Nov 2024 02:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDTvydDf"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F22D4A0A;
	Tue,  5 Nov 2024 02:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730774501; cv=none; b=FN8oViOzmemDVHxPdBtCX2wM7Emn8x6KdLvQ+y5Fs3fNsbvWuAsUIt2CoRrTGuQS69z6tid0AYwsorBOHRgsONah07+Hb/0j3Sca5uM9fyWPG7rW2mIVuz5zyacNQj9BeVnQF0NeMDqUzdfVYyDWhoesvsMEVTsrAQ3hDnJykBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730774501; c=relaxed/simple;
	bh=0lIcSnVwCAI4Pw+NDcQerVcPmYcpucg0B382cbnO0JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rbn5EqXnc/U6qUwSO7iPBbbZfL+jgVog9xMK+bkARxM5VbkarOOwZ/hvvD787np5RIv4DAt27/RUXc/Qza3WHnLqQsGdDiDE3Xtvjw17mw99SNt7lrDXFcz8QUm7vF1wEyViicvb3rFPkRzAQqq2P9kImg/r2Ib+vqZr+5qb79M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDTvydDf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C61C4CECE;
	Tue,  5 Nov 2024 02:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730774501;
	bh=0lIcSnVwCAI4Pw+NDcQerVcPmYcpucg0B382cbnO0JQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MDTvydDfw4yBvleERy0u+BKlBHr9bqcoHSxKTddeg8zMutO21k7xhr/0QAE5HO30n
	 HQQUPDxQ1oU6up0p6TsuOaUqZ6s/NllktAK8Dw/5q7TjOK1InqcHjR3MJpGoQ3B7zg
	 7dRA/K2SY73/26hYIhQ2FJ1XWZEc5exDoGo3cb1RVtOMnnIU2mFkdsbGg+vYDhR8ex
	 0tFWyzmWXW4/ZDE44sPjUTl1NOT+z+3VAOjEut7T/e4MadI3XSDeYr2Xl284zujhV4
	 kBpPcVIRFMhSxWJpjYzNun9+QKdTCiMAfKD9JhkT42CTCXhueRp0iLOj1GeOh+Z6Qp
	 3iHMUd7x93cww==
Date: Mon, 4 Nov 2024 18:41:39 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Li Li <dualli@chromium.org>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, donald.hunter@gmail.com,
 gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
 maco@android.com, joel@joelfernandes.org, brauner@kernel.org,
 cmllamas@google.com, surenb@google.com, arnd@arndb.de,
 masahiroy@kernel.org, bagasdotme@gmail.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, hridya@google.com, smoreland@google.com,
 kernel-team@android.com
Subject: Re: [PATCH net-next v7 2/2] binder: report txn errors via generic
 netlink
Message-ID: <20241104184139.3eb03c69@kernel.org>
In-Reply-To: <CANBPYPjo0KKm3JbPk=E8Nuv05i=EeR93PHWjSU8fcH-GVWV94w@mail.gmail.com>
References: <20241031092504.840708-1-dualli@chromium.org>
	<20241031092504.840708-3-dualli@chromium.org>
	<20241103151554.5fc79ce1@kernel.org>
	<CANBPYPj4VCYuhOTxPSHBGNtpRyG5wRzuMxRB49eSDXXjrxb7TA@mail.gmail.com>
	<20241104081928.7e383c93@kernel.org>
	<CANBPYPjo0KKm3JbPk=E8Nuv05i=EeR93PHWjSU8fcH-GVWV94w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 4 Nov 2024 09:12:37 -0800 Li Li wrote:
> That's why binder genl uses unicast instead of multicast. The administration
> process of the OS (Android in this case) always runs before any other user
> applications, which registers itself to the kernel binder driver and uses it
> exclusively. With a unified family name, the same userspace admin process
> has access to all binder contexts. With separate family names, each domain
> admin process can register itself to the corresponding binder context.

Side note - it'd be useful for my understanding to know what the binder
families would be. You register them in binderfs_binder_device_create(), 
what creates the devices and how many do we expect?

Back to answering - I don't know why the same process would have to bind
to all domains. You record which portid is bound to the context, the portid
identifies the socket.

BTW portids can get reused, do you need to do something when the admin
process dies? To prevent normal user from binding to the same portid?

> So, do you think the current implementation of registering multiple families
> with different names acceptable? Or is there a better way to do it? Thank
> you very much!

I don't see what having the separate families buys you.
The genl family ID is added to the netlink message in nlmsg_type.
That's it, it doesn't do anything else.
You can add an attribute to the message to carry context->name
and you'll be able to demux the messages.

