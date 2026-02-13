Return-Path: <linux-doc+bounces-75993-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHA4JgNTj2lUQQEAu9opvQ
	(envelope-from <linux-doc+bounces-75993-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 13 Feb 2026 17:36:19 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6A713833E
	for <lists+linux-doc@lfdr.de>; Fri, 13 Feb 2026 17:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B87AF31D72DA
	for <lists+linux-doc@lfdr.de>; Fri, 13 Feb 2026 16:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BA5364EAB;
	Fri, 13 Feb 2026 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HaZPPaJy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE68B364E98
	for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 16:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771000199; cv=none; b=OEFTIpurnoQSFr5TCQEtkPWZEGFajo7/6oLmavATrYLpga2UVqbuLP/29km8TnygI0PVeOBwcK9G5CvwMf/Qm16fxjEbX4H7io0wadcopM+/hX7QzMgb5c1ywwL+9bkyEs5P+VONVU9uXcjQkeKmzngemYUCV+cqPlxn9OA90LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771000199; c=relaxed/simple;
	bh=fWNbEz67Iv2fYCVCEe30DdKVYTP5E9w0B2GUG38uEvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhNjRPEOv9xddq/9pCLwhw4PriEqFD20VnBxvymlOPeof0djMtb6Bc7DhHb0xAlXRTi86fABrEG82IMxyxFv5gxhqNj1PM1HuNkW8iXUGTJY34fGfLFWcP/N0/8wZFoWSr/ZMsajtL99QhpqUxk/ok76BBUx1hYf9W9FdMv5OPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HaZPPaJy; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65940221f7eso1892282a12.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 08:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771000194; x=1771604994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVYO2PMhW1UeAv0+W37BYGltWZ305lyaKixwWqyEWO4=;
        b=HaZPPaJysFclen4atnKUufYsw/F1vIVi2HaMnM2bWpNhwp3fiFCl+UjMnpZB+wQBId
         Cp/zeZn7d5EIVC0tuu2efpMRqufFfalCqWfHxYg4b2+JBTz/gLdVZbnhQWw0i9c5JYd2
         QdH3PpKFiDmwsaV67xwHM0UZUVpkuAHSXDoXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000194; x=1771604994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yVYO2PMhW1UeAv0+W37BYGltWZ305lyaKixwWqyEWO4=;
        b=bqHSDp/0lYYgB7KBFAc7CDZHHT8dfwCfPIwH+lJu3GWmITpuH/mAQ5o1QZnEiOh4aK
         J5Zi9BYVOmPfeOVAYHfD2dwBe8WpGkZKP5ZeTd0EK5iElC+Tn4YwTJR5qhyF16scULtk
         zuDlN+olvhrjf1UF6Fzvbm1X74ZmSmcqVJCKjy4c78uIFQlQH0pU7exkogoM+lFP+eXo
         ww3Zl/um93qZY2LSh35ou/g86geWegbny1LOvsKGSsKYSIFRElPTfebvjBpjGRF9C01n
         srhZZY6G/4/XLcvVzvVXU/j2mNylm2pOcyTWteoC6d4mbL0h0j6SG7jathhuc7+RkHd2
         c54g==
X-Forwarded-Encrypted: i=1; AJvYcCWMlh2sCLp6KStoDpAeXWueqwxcZoWLQpafWCBf0aHlVfIkclcJrBWhEyfLgJcICGFp/XHnM8BnBbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOx/zeJqKNn4Dxsdh+j2PAL4PpSPQMLj71Yoqh1bN7fss0fwrt
	Sv33x36yzvwzxN0yZUQdtBTyO/Ir2pdHw6l6YBAIpvK0kGR8UcupBC5KGUWDaRRoWinzuhgTDgj
	v32ORxQ==
X-Gm-Gg: AZuq6aLiE2aVIrR8/4MYpDBuIqf9BlMQkkU/ZIAVlmUDbBHvFTKPeBdB+J4QuKkPxRf
	H/7zottIgwquU5rexMUA803VydQJoJuwjF7OMg+7T4K5X9G4Q5dqetzL0CpGU8Yb4ebSLvpI5Nf
	rUijcOnjiNMILSdaFgvANwyb7SJ8ntaH+iBLVgIFDFpwthxDnTnqf8kvQFUTZNixlMocBOIH/mY
	YGvihsoOWTxlddfvDQEGyJdaNGH7xyR0ysr3aQ87FV/X92EXovKsjZm8VkZvpT6stnM6mY+wBq3
	vo94xp5/hagRPprqNOVDCRYtAhoSh20FQmS3dDfFjh7f81F1MOB51FqnG8JI1XxYqHHKOrKFUfb
	R/Rju2wC5xM7lDeDH/VnuCyG2CwRqAzDt/wGJbKdz6b0Ml8JTK6jIL6ReEA+CCTadfO15VfPv+5
	LlAuGWC18KdrLVi193oob13ipNBDP47wOTGeR4FFw4TtID1TIRCKjWRoeGazfRfg==
X-Received: by 2002:a17:906:fe4c:b0:b79:fe73:3b18 with SMTP id a640c23a62f3a-b8facd020d9mr168308466b.22.1771000194078;
        Fri, 13 Feb 2026 08:29:54 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f7ff17a44sm241655466b.0.2026.02.13.08.29.53
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 08:29:53 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4327790c4e9so856800f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 08:29:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLhykVZH+dNUpZvf95QYcw/hkov6UxwevzlwDFk+7Wqn9GYdutVkYXz+71/gBuVw8CsP7NWhiXrDs=@vger.kernel.org
X-Received: by 2002:a05:6000:420a:b0:437:6758:ce75 with SMTP id
 ffacd0b85a97d-43796ac216amr6138638f8f.23.1771000192325; Fri, 13 Feb 2026
 08:29:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com> <20260212-hardlockup-watchdog-fixes-v1-2-745f1dce04c3@google.com>
In-Reply-To: <20260212-hardlockup-watchdog-fixes-v1-2-745f1dce04c3@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Feb 2026 08:29:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vqn-=uG=MbUZK3pxfKSdYmpur9mHmLWMMte_cV+PaP9A@mail.gmail.com>
X-Gm-Features: AZwV_Qh_YmaTqFnODDdp3S2mL0CMOWdNyMDReT1_OsqIT-NqulTtxfy446tbqBU
Message-ID: <CAD=FV=Vqn-=uG=MbUZK3pxfKSdYmpur9mHmLWMMte_cV+PaP9A@mail.gmail.com>
Subject: Re: [PATCH 2/4] doc: watchdog: Clarify hardlockup detection timing
To: mrungta@google.com
Cc: Jonathan Corbet <corbet@lwn.net>, Petr Mladek <pmladek@suse.com>, 
	Jinchao Wang <wangjinchao600@gmail.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Stephane Eranian <eranian@google.com>, Ian Rogers <irogers@google.com>, 
	Li Huafei <lihuafei1@huawei.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Max Kellermann <max.kellermann@ionos.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lwn.net,suse.com,gmail.com,bytedance.com,google.com,huawei.com,linux.alibaba.com,ionos.com,linux-foundation.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-75993-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EE6A713833E
X-Rspamd-Action: no action

Hi,

On Thu, Feb 12, 2026 at 1:12=E2=80=AFPM Mayank Rungta via B4 Relay
<devnull+mrungta.google.com@kernel.org> wrote:
>
> From: Mayank Rungta <mrungta@google.com>
>
> The current documentation implies that a hardlockup is strictly defined
> as looping for "more than 10 seconds." However, the detection mechanism
> is periodic (based on `watchdog_thresh`), meaning detection time varies
> significantly depending on when the lockup occurs relative to the NMI
> perf event.
>
> Update the definition to remove the strict "more than 10 seconds"
> constraint in the introduction and defer details to the Implementation
> section.
>
> Additionally, add a "Detection Overhead" section illustrating the
> Best Case (~6s) and Worst Case (~20s) detection scenarios to provide
> administrators with a clearer understanding of the watchdog's
> latency.
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  Documentation/admin-guide/lockup-watchdogs.rst | 41 ++++++++++++++++++++=
+++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)

Thanks for updating the docs! Again, given that I pre-reviewed, I
unsurprisingly have no further comments.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

