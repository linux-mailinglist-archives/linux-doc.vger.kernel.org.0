Return-Path: <linux-doc+bounces-94901-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YGoKE0sISGq/kAAAu9opvQ
	(envelope-from <linux-doc+bounces-94901-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 21:06:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A36A67050BA
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 21:06:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dX6fYVpw;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94901-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94901-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98A12301CC37
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 19:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21073254B8;
	Fri,  3 Jul 2026 19:06:48 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D9230C144;
	Fri,  3 Jul 2026 19:06:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783105608; cv=none; b=NCe6/cgxBof+LpDzd1gCWp+BfmF97tclI4PxR95RVkmtjR2DVUfEZUVMGeE8ArraLRWT6j8+cRjy7xbnYXIpWX2FiUEQxZ2hw9O3CzWDRPtxla8skeIbG0n3B3bQRdSeuSN3TVDQ7KpQTcz8L5j7Ne9JhrQ8bwjy++ijhvrx3qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783105608; c=relaxed/simple;
	bh=n8+VUHqIiv8p++97/rkQ9IVUAOp+Us3csFFnaglFJYc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=prNX2uMKtmmuQ8zJIDnPykryFRL/TEV4iWXL4OGpup0Bf4Eq0tTDntnzniafpy6igS+W4nQDQFhfben3CjJ0chy91J0306gj4nSPzo8PDuGAOnpW8Ob4aVfPLydcyiuXKK45oRnjvJfAxQA69ALXFZgAO8CapAfT+cIE8RsAHbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dX6fYVpw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF46D1F000E9;
	Fri,  3 Jul 2026 19:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783105607;
	bh=L1qpe0pBavertXc+1KLi6h5XimAiA7wZTjsr24tr3N4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=dX6fYVpw71Bjm2DA4DfM7v/LR24JzuXNjwcTBgGACCWkyJEJ+KurIdy4u9S3tb/qb
	 iq3HGAW+G8oYXN4QB9zDKk8ZhitaNeciw9//iOkR/RsgH03xBtrEVi1DOy9Bsf3h0U
	 H21iVVHxUiO7wIz5TLMmhrtjWWHBBdkEwwmwE/MEF7/M7F6zToF1ryOssJ5oLROvWt
	 H0zdgyDXp9XyuPtuoxWNTrAJuEuI7F+aQgXcxBkVeEEmUEQXxrI30yKyEuZFwhRwhQ
	 KR5KXiclLNV1MEcGU3IeSoABkcXII/7uuIF6cIpHV5rnq53vKM+r2khrgMLa3NnZuc
	 6SBhAeIJVALWw==
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
Subject: Re: [PATCH 2/2] kernel/entry: add kernel.syscall_user_dispatch sysctl
In-Reply-To: <akfwuanT7Ot3KD6R@fedora>
References: <20260627205551.769684-1-gourry@gourry.net>
 <20260627205551.769684-2-gourry@gourry.net> <877bncm5y7.ffs@fw13>
 <akfwuanT7Ot3KD6R@fedora>
Date: Fri, 03 Jul 2026 21:06:44 +0200
Message-ID: <87v7avlwor.ffs@fw13>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94901-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A36A67050BA

On Fri, Jul 03 2026 at 13:26, Gregory Price wrote:
>> > +	/* Arming can be denied at runtime via sysctl, disarming is allowed */
>> > +	if (mode != PR_SYS_DISPATCH_OFF && !syscall_user_dispatch_allowed)
>> > +		return -EPERM;
>> 
>> That might be similar to other sysctls, but if an application had it
>> enabled prior to the sysctl=off toggle, then that application will
>> suddenly fail in operation if it requires to move the dispatch window.
>>
>
> If the admin is turning it off globally, is that not exactly what the
> admin wants?  The alternative is a hard disable that will simply result
> in undefined behavior (windows syscall ABI being interpreted at a linux
> syscall) instead of failing gracefully on the re-arm.
>
> This seemed like the better option.

Fair enough, but please explain such reasoning properly in the change
log.

