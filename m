Return-Path: <linux-doc+bounces-92253-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OXcyBn7GLGr4WAQAu9opvQ
	(envelope-from <linux-doc+bounces-92253-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 04:54:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C4467D908
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 04:54:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Owfy+vSC;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92253-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92253-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C30EA31D873D
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 02:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38100346FAE;
	Sat, 13 Jun 2026 02:54:51 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAB632F75B
	for <linux-doc@vger.kernel.org>; Sat, 13 Jun 2026 02:54:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781319291; cv=none; b=hRF3ALZZjn6mP/xcEeVnH8NKXbDfYGnfVqlTo47Sv0djIjt+hfqT/aUJs1vQH+BRrTCBrvKOYsynsgY3E4pW3WXBa6D+KS7quMxAs4KZlF8sxG2kFUYYnbmk67J2MrA7UHZnnPb87+eWI77+0MZnzoUqpOlwF76Gi2W66RVXelc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781319291; c=relaxed/simple;
	bh=dTQtBMDvmSV2r4k7FWElep648Zj5VqCzYNr5DQhz+P8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qjl/gni2yzfCuyf5sMmBSGDJov0rpzRs/916KeR0RdKKrvokdSbWnSGzMg7Ze5pee2ugESkGyHZVStQnUgc9cVyWDm9JkuKM56dYnI2mmu+R2v1QMzgyXqfOhBQJs7gU9ap5qq74W9xaXGwwHBi8zdlrYzGDU+1JEtABM3NJrdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Owfy+vSC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34581F00ACA
	for <linux-doc@vger.kernel.org>; Sat, 13 Jun 2026 02:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781319289;
	bh=dTQtBMDvmSV2r4k7FWElep648Zj5VqCzYNr5DQhz+P8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Owfy+vSCyVQUlgV04dfjl+8LW5A5WC3GJNASX92KGrdoOv8HiHWqbtc0aQe7dtpz9
	 u/ahTDFObSPsF7Gmv8TYekvLWOvWFW9Ze2H5OAW/7lkaq3Oq8sJE6qxWOGi0n6xPu8
	 2SdUUqgUdfhOVfzdpHnlqs30dUi5YL4t9Yl0zL4brrQxUa6ccEYgJ583+xHp/ed+eP
	 Rz6zjE5dnRxFzrz8CI1p/eqmcN9jwnyU8gltzQV5PcKdoMwgNrWPMMVmKo6t7syPl9
	 zuwBhHUm9clses25TtSJw+UJWAPl9TAGTkUKse1WnhmbXl2q1YhZZwzMf+Au45af3u
	 ic6iEw8AvaKsA==
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-137ec563a95so1769612c88.0
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 19:54:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ954mMQUNLcAhYvHPhmJuJpFiTA4DLIBvjA0EfIvHCNLn2ZrYDLvyYZYLrmB6WGBTApYfndkpBCdnw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp71D7SEW3F0eb0vPb/op/cDvGXUEI8UUg/WE+B4TH7vJmUy4r
	dIUiFCMbpvWqnsdB9YAlx39iUgz28+TVAf94RarXfa9mr7xRtdC791GqDrTvQ2tciW4SKGN6St7
	JhdRqA8Y934Asj6+DeCjQmWjl24D4E7w=
X-Received: by 2002:a05:7022:3d0c:b0:138:4fc9:160d with SMTP id
 a92af1059eb24-138790227dbmr942234c88.35.1781319289300; Fri, 12 Jun 2026
 19:54:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781105672.git.zhuyan2015@qq.com> <tencent_DADDE291CA580302EB7BB40B83A552D6F006@qq.com>
In-Reply-To: <tencent_DADDE291CA580302EB7BB40B83A552D6F006@qq.com>
From: Fan Wu <wufan@kernel.org>
Date: Fri, 12 Jun 2026 19:54:38 -0700
X-Gmail-Original-Message-ID: <CAKtyLkE3unhxMsH1LpqvjHQoKVgz1tcTsZWUxNHs+R6v2amf6w@mail.gmail.com>
X-Gm-Features: AVVi8CftctKBny0jAU4ifk3qIkc0KbuixpNCAMW7ye9rflDa0lxZ53ouLeLjJ4U
Message-ID: <CAKtyLkE3unhxMsH1LpqvjHQoKVgz1tcTsZWUxNHs+R6v2amf6w@mail.gmail.com>
Subject: Re: [PATCH 09/10] docs/zh_CN: add LSM/ipe Chinese translation
To: Yan Zhu <zhuyan2015@qq.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, mic@digikod.net, 
	dzm91@hust.edu.cn, skhan@linuxfoundation.org, gnoack@google.com, 
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92253-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhuyan2015@qq.com,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:corbet@lwn.net,m:mic@digikod.net,m:dzm91@hust.edu.cn,m:skhan@linuxfoundation.org,m:gnoack@google.com,m:linux-doc@vger.kernel.org,m:linux-security-module@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wufan@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[qq.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wufan@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69C4467D908

On Fri, Jun 12, 2026 at 8:59=E2=80=AFAM Yan Zhu <zhuyan2015@qq.com> wrote:
>
> Translate Documentation/admin-guide/LSM/ipe.rst into Chinese.
>
> Update the translation through commit d7ba853c0e47
> ("ipe: Update documentation for script enforcement")
>
> Assisted-by: Claude:deepseek-4-pro
> Signed-off-by: Yan Zhu <zhuyan2015@qq.com>
> ---

Have you tried to refine the AI translation? IMO some are really bad transl=
ated.

Also how does the doc translation project work? I do notice there is
another IPE design doc translation,
https://docs.kernel.org/next/translations/zh_CN/security/ipe.html
which has a wrong "original link".

-Fan

