Return-Path: <linux-doc+bounces-80177-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMMMKMb1u2nkqQIAu9opvQ
	(envelope-from <linux-doc+bounces-80177-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 19 Mar 2026 14:10:30 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2332CBB15
	for <lists+linux-doc@lfdr.de>; Thu, 19 Mar 2026 14:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1F8E3174382
	for <lists+linux-doc@lfdr.de>; Thu, 19 Mar 2026 13:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEAE3D3486;
	Thu, 19 Mar 2026 13:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qygsp4SY"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DD5126C02
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773925760; cv=none; b=bbF0yuSmetw0kPvdf1h5j9nXUYKLKhvclhKSaEfANB0C9uQ2hHjIh1sAxv3ZHhwdx9OWxL4YkiihsIo6Sp1Ka+OZ7DqCdyWEnkVp2pBJ3rbQ4grGmUzDs0JuNji35Xcp9CoHWwbOwKkaYCyL1k5uWVNiIDYzSixC5+kKVGobDz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773925760; c=relaxed/simple;
	bh=Q6j72inhTsH6ewxfYJqIA8kdxCdrfzZ/qo9HHgaCAUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jq0JMuOCM8mz2mLIoENkXhScPhjyqAY3w7UUDteQwbUm+br6mwuSiZcMsm9auSdnXO+3h/em0wAcxQysunrjWJKqP/BrWB06cYHR70bXo4RybOSBSbJj9/Vut7QKMfFeTpUd6/McQFmXyVWhsLp9/03YFbL0SuWxniGSdj58mJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qygsp4SY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1E6C2BCB5
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773925759;
	bh=Q6j72inhTsH6ewxfYJqIA8kdxCdrfzZ/qo9HHgaCAUs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Qygsp4SYDnjNIkRepZ6B/Da7WIVTVHYU4iXoNk8PmGV1OM/gGOd5/M9BvufNOMbpX
	 L3fe8ghS0ZDexaf/xoBcCNoxfpzJGgcSymUOSQM8LFCm7B7oLjrOmUhDXWw83okB85
	 JQKsLI1aTMKRjTk8mRQm4qDfSybEOQ/uU2kuBX7DlPaciRMwXzFDcFiQGi1TZaeY7U
	 /kYnMWhOloiKv/Vxw9DHsIIOnyr5Jm2RgGOup9G6c0BG3+vMniwNt0YL5DyO74/QJY
	 tvIbSDut+lE9CHg5aThsCyDdx3qXRcHu/ur7TUusVV3mLOE3vNUfEnXpdq66baJQkI
	 rj9/ECGl7VWpA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38bf132993dso3436511fa.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:09:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWL1TlG4zB23+smXv1GUaCe1kwT6f72ZNlmnrvLAGzwai6MfMv0q/h4wzQgau53Xu7PZOYZyffmMpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvXzqeXEEmuwh1vzR3iDLnCFITsg+HP4aUkpyuDDkuvt1f48nC
	Y30wrcANoDQV0rdeZsIQzf9Gin95/EBg+FtBOsTiB3ZTBm3hYVU/crSRhapx6QoqkYsp4DgUlce
	P+xGfVQ56uSVselWB/xx+SkAMMdM7yc0=
X-Received: by 2002:a05:651c:201e:b0:38a:4a27:1b58 with SMTP id
 38308e7fff4ca-38bd58700a4mr22921261fa.23.1773925758025; Thu, 19 Mar 2026
 06:09:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com> <20260319105947.6237-11-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260319105947.6237-11-wsa+renesas@sang-engineering.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Mar 2026 21:09:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v673oGgYbK9vxtgzCNSKR0=d+yT+3tD_bp_0AwLdVbht7w@mail.gmail.com>
X-Gm-Features: AaiRm51-S2qI8OWMlxRbpEKWhlUg86es_OnJ0C138mWD9n1SBCUMxkSAhbQynxE
Message-ID: <CAGb2v673oGgYbK9vxtgzCNSKR0=d+yT+3tD_bp_0AwLdVbht7w@mail.gmail.com>
Subject: Re: [PATCH v5 10/15] hwspinlock: handle hwspinlock device allocation
 in the core
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Wilken Gottwalt <wilken.gottwalt@posteo.net>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-80177-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.alibaba.com,infradead.org,redhat.com,lwn.net,linuxfoundation.org,gmail.com,foss.st.com,posteo.net,sholland.org,st-md-mailman.stormreply.com,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-doc@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.533];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,renesas];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3A2332CBB15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 7:00=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Providers have been refactored to avoid using core internal structures.
> As a result, they do not need to allocate the hwspinlock device on their
> own anymore because they can access everything they need with helpers.
>
> So, the allocation is moved to the core. As a result, the registering
> functions now return a pointer to the (soon) opaque hwspinlock device
> which may be needed for unregistering only.
>
> Because the argument list of the registering functions is changed, all
> users are changed here as well.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/locking/hwspinlock.rst  |  6 ++--
>  drivers/hwspinlock/hwspinlock_core.c  | 48 +++++++++++++++------------
>  drivers/hwspinlock/omap_hwspinlock.c  | 10 ++----
>  drivers/hwspinlock/qcom_hwspinlock.c  | 11 ++----
>  drivers/hwspinlock/sprd_hwspinlock.c  | 17 ++++------
>  drivers/hwspinlock/stm32_hwspinlock.c |  7 ++--

>  drivers/hwspinlock/sun6i_hwspinlock.c | 12 ++-----

Acked-by: Chen-Yu Tsai <wens@kernel.org> # for sun6i

