Return-Path: <linux-doc+bounces-94900-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jCuHDvkHSGp4kAAAu9opvQ
	(envelope-from <linux-doc+bounces-94900-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 21:05:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B55705085
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 21:05:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=m1zyTKW0;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94900-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94900-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7B74301AD1F
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 19:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E7230ACF1;
	Fri,  3 Jul 2026 19:05:25 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C45C221DAE;
	Fri,  3 Jul 2026 19:05:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783105525; cv=none; b=pXKxzgKxqF6nBn2E6uArhclHRpTf2CMOPM+PI/rwKrRixgFksDnDNclWSqYG/fUsZTvdYEVhex4FEmNB55SO9TsGH5XFiBF6VJ0sZPxx6d5R1ht16Xh2CLJQOx156jobTabNJRv+mOcei/mZTcJNGKABogQduNP7TatmiXT7rJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783105525; c=relaxed/simple;
	bh=hBb6hq4isCfiV8s+nzMNOuu/UNXr2UNwuxWVfeZLujg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AfFIy0FCYbI4YWunSidNzUunG2OH5x1ZrCMkaOn/BDSA5CJ3dY9GuDsyF5yUaD2F74YS1zKVjAiB9HoF863HK3ipzYg4teUbGSX/SaCelhv5o8m5WRPbOGOkmHk2SZnuxzrvPq3PzrAJ6a++HcsRPVYvOc7Em3Iq9qnRbYTLSXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1zyTKW0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415E41F000E9;
	Fri,  3 Jul 2026 19:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783105523;
	bh=bbmfpKuaXnCxb2nR08iPDH1KoBeMW8P78cZz/yvJGm0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=m1zyTKW0qm7fBkbyTAj00Q09+0QWQ24rD620E7z5vDB5fh9BcOcu2kHmAAXQWi9aa
	 jovqqKWVrXz2T3yA+dDQ5zKLP5EJ+0psSHy3ybbsBgeU60QEHm5pZErF48sjtZH8PP
	 hlatZTm/mJPtRJTWBabeJ3IIxKmOAt/yWGe6Bvo3c0b5rZo+LmxJ0yERl6GlqXFxC9
	 OcRMXkff8JEdS5b95XW/5IW/fxDpisss7qzaKf+qUq/qZ7X/dkRVp9I+TUvHui1N3G
	 ZjOwCrZG8eM1lK4eF+cuAqeLYXz0Ui/2B/oRZLanhq7Mtad1Cf6be8OSY2abnA9PEi
	 HWRAHGy0WPlDg==
From: Thomas Gleixner <tglx@kernel.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel-team@meta.com, corbet@lwn.net, skhan@linuxfoundation.org,
 peterz@infradead.org, luto@kernel.org, akpm@linux-foundation.org,
 feng.tang@linux.alibaba.com, pmladek@suse.com, mhiramat@kernel.org,
 marc.herbert@linux.intel.com, joel.granados@kernel.org,
 lirongqing@baidu.com, kees@kernel.org, nathan@kernel.org,
 linusw@kernel.org, arnd@arndb.de, deller@gmx.de, jpoimboe@kernel.org,
 ruanjinjie@huawei.com, lukas.bulwahn@redhat.com, ryan.roberts@arm.com,
 ojeda@kernel.org
Subject: Re: [PATCH 1/2] kernel/entry: add CONFIG_SYSCALL_USER_DISPATCH to
 compile SUD out
In-Reply-To: <akfv4ecFcHMqx5Xp@fedora>
References: <20260627205551.769684-1-gourry@gourry.net>
 <87a4s8m69c.ffs@fw13> <akfv4ecFcHMqx5Xp@fedora>
Date: Fri, 03 Jul 2026 21:05:20 +0200
Message-ID: <87y0frlwr3.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94900-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:gourry@gourry.net,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kernel-team@meta.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:peterz@infradead.org,m:luto@kernel.org,m:akpm@linux-foundation.org,m:feng.tang@linux.alibaba.com,m:pmladek@suse.com,m:mhiramat@kernel.org,m:marc.herbert@linux.intel.com,m:joel.granados@kernel.org,m:lirongqing@baidu.com,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:arnd@arndb.de,m:deller@gmx.de,m:jpoimboe@kernel.org,m:ruanjinjie@huawei.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:ojeda@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,meta.com,lwn.net,linuxfoundation.org,infradead.org,kernel.org,linux-foundation.org,linux.alibaba.com,suse.com,linux.intel.com,baidu.com,arndb.de,gmx.de,huawei.com,redhat.com,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77B55705085

On Fri, Jul 03 2026 at 13:22, Gregory Price wrote:
> On Fri, Jul 03, 2026 at 05:39:59PM +0200, Thomas Gleixner wrote:
>> > #include <linux/thread_info.h>
>> > #include <linux/syscall_user_dispatch_types.h>
>> > +#include <linux/sched.h>
>> 
>> Why does this require to pull in the heaviest header?
>> 
> we dereference current (struct task_struct)

Who is we? :)


