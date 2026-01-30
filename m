Return-Path: <linux-doc+bounces-74651-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAJjK19ofGk/MQIAu9opvQ
	(envelope-from <linux-doc+bounces-74651-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 30 Jan 2026 09:14:23 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FF5B8378
	for <lists+linux-doc@lfdr.de>; Fri, 30 Jan 2026 09:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0517301467E
	for <lists+linux-doc@lfdr.de>; Fri, 30 Jan 2026 08:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018053502B6;
	Fri, 30 Jan 2026 08:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HT7JjCUc"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D169B34FF4F;
	Fri, 30 Jan 2026 08:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769760851; cv=none; b=dsX6rKmvSBTL4NE2LKBQWlOpuqap9J2e81Ntaw8q5HuHbb6Obdd4jvmCee/zu+v0jqm8hLBASvLpc+M7Sm8Ddq/VjinmAWWszY8TP+t8HZf+BvvonnHbqLblE9ocubW+gkFNT5OoDAWTy92r5vk6g4Kv+dk3grkOUZ0aAPHq6l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769760851; c=relaxed/simple;
	bh=T/xTnGyF/enhfuoxS2sv+kprrbFBjOX4J2fjW88C3U0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a+6qvEWnCyTUh2amqATMePE8MbMPEFeQxWncbJ8mJn0YpT6Oxg1IAqW1UVYAtTTLEWvCtWYgqIU8SVgjOCmlfG96RwmHP+azl3ZCPJg936qib85ePGscOf0hKJY3uwl+pWIbSopN8maVmApuaF4cZw1wq+33d6qhNieL6KqVPZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HT7JjCUc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E70C4CEF7;
	Fri, 30 Jan 2026 08:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769760851;
	bh=T/xTnGyF/enhfuoxS2sv+kprrbFBjOX4J2fjW88C3U0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HT7JjCUcu5J2DvsQr2lzz6QPIY2ZwnZPR2rvauDa+2EcqzyzRJStEfI1NM6/JBY03
	 FVaAY5EE1zNpJunTknA/4Rs+wOxG2LANxrcIymPgbDwYxQpfc8IRbq3GPbdK4THMeh
	 ZbdiJ+a9l1UQMGRz6FjwZNjOHqPD8b1OUhYnHLT0+UJquHUGGatMKXWp6jMKUSXxir
	 Np3iB46FYzrzzQ2scweU3R9cvlNyU7gG/x5F8l5HIrZG84AFEzxgda9KgN7vDyvzaC
	 bPpdMSlys/s5TKKe3fz1bp2mvedWLnsbwWEYqYQSAr104g5y5+CYxXBZarS4hzJLIU
	 QS9KGkZAohT4g==
From: Thomas Gleixner <tglx@kernel.org>
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, maobibo@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: Re: [PATCH v9 2/4] irqchip/irq-loongson.h:irq-loongson.h
 preparation for Redirect irqchip
In-Reply-To: <20260130025941.2140582-3-zhangtianyang@loongson.cn>
References: <20260130025941.2140582-1-zhangtianyang@loongson.cn>
 <20260130025941.2140582-3-zhangtianyang@loongson.cn>
Date: Fri, 30 Jan 2026 09:14:07 +0100
Message-ID: <875x8jmsa8.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-74651-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 51FF5B8378
X-Rspamd-Action: no action

On Fri, Jan 30 2026 at 10:59, Tianyang Zhang wrote:

The subject line is broken and incomprehensible. Something like:

    irqchip/irq-loonarch-avec: Prepare for interrupt redirection support

is concise and gives context.

> Adjusted definitions and macro from loongson-avec.c to irq-loongson.h,
> including:
> 1 marco AVEC_MSG_OFFSET
> 2 struct avecintc_data
> 3 Make avecintc_sync public

That's not a change log because it only tells _what_ the patch is doing,
but not _why_. Enumerating the details of what is moved is a pointless
exercise because that can bee seen from the diff itself.

So you want something like:

  Interrupt redirection support requires a new interrupt chip, which
  needs to share data structures, constants and functions with the AVEC
  code.

  Move them to the header file and make the required functions public.

See?


