Return-Path: <linux-doc+bounces-91375-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Lh/QDArFJmo2kQIAu9opvQ
	(envelope-from <linux-doc+bounces-91375-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 15:35:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D43656B1C
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 15:35:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="J/Qi2/A3";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91375-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-91375-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 564C230158A4
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 13:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96FD37FF5A;
	Mon,  8 Jun 2026 13:34:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8F036CE19
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 13:34:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925694; cv=none; b=gI15tYTbOjtKkJq09pJCH/uaSBCJjVqxBout7kpWMxWguI/ziC8xz7XORWtDX09+5OT2ZZ2hYqdhkrkk8wU6faXp3IZGhSNX8nEc1WN8uWOmzk183Op1bmX9EzQQI7PTcmVJEc/yqhyVlR1/ZKJsVrBJ9146XlBmucaXl9ZpM0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925694; c=relaxed/simple;
	bh=6TP4DXEet8BLt0xczKFky+VO5C6mWL7hXd992e99WYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QgdBB7onvgwaz1+btmRPmCs0xOliTM0pWAd1LKM1KM9zUqirvqU1Gbvnn4UlU+bzWV0QF63atvy1XLJooKIfdmdSKVExM301YlNkpXLT5EgcOp+z8ygAEaitUqSeehfvPAir8LJfxoKk6FGv/FcwfrSXlYxVSauC3kqLrONr2LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/Qi2/A3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535361F0089E
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 13:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780925693;
	bh=FTTNnYENiQwmEkIqairk4PrJggGCIdJnX8w+fYMEHkU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=J/Qi2/A3UGCYX73wJ/FhDfkURsiR1r3wzmX028Blzjo1qkkNTHyxUYQ2n/1NYQiT4
	 J0MoE8/wj7ZZdq5TCK/2dMLvVMCFZNpkSJe8FIhfJ4IFN4wlqXAIKF1rjtvAYfthT/
	 +hA9YU4yhM97wFm8cZgpo2MIIyrgIl70nDrfEW/2tSJg5bLn0AiWb8OC2PCmu3kRMC
	 +6vCqhK7wDSjvesm+2CmzWgEq1Z1RPnG79ZQrCSy5K3/TnYtH2f8G3ZchLvWKkbfmf
	 FHYHqkvLGXgZPL7J7R7KiAn0b6Jl4rijXZbP9YSlQPUn/35Q+VkmzHz60+3PdwqOu5
	 40TDS82PeZyCQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa88b4f792so3217806e87.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 06:34:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ92Zu/o7eE8D2jvRnCUqDrIB5kO5r0E1kVQewFpg+TvCmEdSnpdOyqBoe59j/eniXloGgjQTJ8OOSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKjdNBxNh+euhLiSAENm/ppiRmq2LblPssMMyn9BuaV6KbWffE
	U9Fm/ObLcYT7SN0JFTKeL91Wr5bk1TWcuZRkcTyPfxeIrtfhVlkUgf+YvaLljxipWw/vA6KVOWq
	SgoGGLZpSlpSXtis/TCwYXpCt2TC5Dj4=
X-Received: by 2002:a05:6512:2524:b0:5aa:6a11:3a1f with SMTP id
 2adb3069b0e04-5aa8865d71dmr2623756e87.4.1780925691684; Mon, 08 Jun 2026
 06:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603055635.1549943-1-zhangpengjie2@huawei.com> <210cefc5-c9f2-49e2-b2f6-2a3c1a42218a@oss.qualcomm.com>
In-Reply-To: <210cefc5-c9f2-49e2-b2f6-2a3c1a42218a@oss.qualcomm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Jun 2026 15:34:32 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hopywoftnDebg25rDVfTODKpgJjZ=jMi-3KADMg7FXZQ@mail.gmail.com>
X-Gm-Features: AVVi8Ccht1iHdE91GNmN4WEmx-FuILi41e74vlfK5Xwv1kby_7shZfEEorhsteA
Message-ID: <CAJZ5v0hopywoftnDebg25rDVfTODKpgJjZ=jMi-3KADMg7FXZQ@mail.gmail.com>
Subject: Re: [PATCH v2] cpufreq: Documentation: fix freq_step description
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Pengjie Zhang <zhangpengjie2@huawei.com>
Cc: viresh.kumar@linaro.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-pm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxarm@huawei.com, zhanjie9@hisilicon.com, 
	prime.zeng@hisilicon.com, wanghuiqiang@huawei.com, xuwei5@huawei.com, 
	lihuisong@huawei.com, zhenglifeng1@huawei.com, yubowen8@huawei.com, 
	wangzhi12@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91375-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:zhongqiu.han@oss.qualcomm.com,m:zhangpengjie2@huawei.com,m:viresh.kumar@linaro.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-pm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxarm@huawei.com,m:zhanjie9@hisilicon.com,m:prime.zeng@hisilicon.com,m:wanghuiqiang@huawei.com,m:xuwei5@huawei.com,m:lihuisong@huawei.com,m:zhenglifeng1@huawei.com,m:yubowen8@huawei.com,m:wangzhi12@huawei.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[rafael@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,huawei.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5D43656B1C

On Wed, Jun 3, 2026 at 3:32=E2=80=AFPM Zhongqiu Han
<zhongqiu.han@oss.qualcomm.com> wrote:
>
> On 6/3/2026 1:56 PM, Pengjie Zhang wrote:
> > The conservative governor documentation incorrectly states that setting
> > freq_step to 0 will use the default 5% frequency step. In reality, sinc=
e
> > at least commit 8e677ce83bf4 ("[CPUFREQ] conservative: fixup governor t=
o
> > function more like ondemand logic"), freq_step=3D0 has always caused th=
e
> > governor to skip frequency updates entirely.
> >
> > Correct the documentation to reflect the actual behavior: freq_step=3D0
> > disables frequency changes by the governor entirely.
> >
> > Fixes: 2a0e49279850 ("cpufreq: User/admin documentation update and cons=
olidation")
> > Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
> > ---
> > Changes in v2:
> > - Update commit message to reference the correct historical commit
> >    8e677ce83bf4 instead of b9170836d1aa, as the original implementation
> >    had asymmetric behavior for freq_step=3D0 (suggested by Zhongqiu Han=
).
> > - Link to v1:https://lore.kernel.org/all/20260529111122.3321645-1-zhang=
pengjie2@huawei.com/
>
>
> Looks good to me.
>
> Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

Applied as 7.2 material, thanks!

