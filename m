Return-Path: <linux-doc+bounces-91237-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XHy5H+NcJWrzHQIAu9opvQ
	(envelope-from <linux-doc+bounces-91237-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 07 Jun 2026 13:58:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7826507D8
	for <lists+linux-doc@lfdr.de>; Sun, 07 Jun 2026 13:58:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ItsDMWph;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91237-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91237-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF22D3003485
	for <lists+linux-doc@lfdr.de>; Sun,  7 Jun 2026 11:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B2136C58F;
	Sun,  7 Jun 2026 11:58:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A913930C17C;
	Sun,  7 Jun 2026 11:58:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780833501; cv=none; b=OjOaKJvKQMiXRDL90MVFsWTdpf3y94+LBEntPg3+kzlyAazMCV6js1kp9RDB0H3rFuizmfq4/hb1RFLfV9vc+ZdldmU9EmVCHLfiAkJ+SC9dDqIDCDH8sGq21xdQwbsCXTA+M2OyB7ZSnNVYBVy/QWdx5BjrKLriBUE4/PsdboM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780833501; c=relaxed/simple;
	bh=GkAapea2r6iMuQ9bRretKpT53hPyS2YuHdH+ULS5Nus=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KFTwjjivvwBWWp94uX/G2lKI2Tv+bD1czy/ueSRmldwRb28DR5Qc6X8k8ReMm09dSwAFg3iL0YCuas2nunkAKcNAgHIATT8Q/yecI26Ta3D96HSQYL8wbY+0N44CBogMM819czsXaCZgKT6ae+OT04hfmWbn681YTej/QUSYPYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItsDMWph; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0487A1F00898;
	Sun,  7 Jun 2026 11:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780833500;
	bh=H2pnv615PWqSZrpd2NRH79qwtsELWXhl5rrCYlTNZXo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ItsDMWphVvFP4D8ih+9sFpqdbEllQp8JuNzqgQys3nbl3JRqSpd7m82izly/lFRXA
	 23SWdwR6HYtp7hRPXyHAUcOCpSsHOvTegPo0+c0Zoc/8HpZOVaNaXYTu391jg8RAcT
	 lNuiTww4Je5vPyjUu6tupBsWXuI6+1WkwqXMcZ1uZzFer2zFa65oT4pvSbc/lPzohm
	 FThaHBR5t10QV7mIFRzbIdC1X3dBWriV7aLfUCAclVbONkt1fiCgXNJgD7wc7Oz4wc
	 9U8zF9tNMbgUZWnuUB23hxabixRlJ3jbIren5pQKdSCeKQcujQXRc3S61MiWKHXSmM
	 xJSxwo9xyAzYw==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC v1 1/9] kho: split out radix tree tracker into
 kho_radix.c
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
 akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
 linux-doc@vger.kernel.org, jasonmiu@google.com, 
 linux-kernel@vger.kernel.org, corbet@lwn.net, ran.xiaokai@zte.com.cn, 
 kexec@lists.infradead.org, pratyush@kernel.org, graf@amazon.com
In-Reply-To: <20260605033235.717351-2-pasha.tatashin@soleen.com>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
 <20260605033235.717351-2-pasha.tatashin@soleen.com>
Date: Sun, 07 Jun 2026 14:58:08 +0300
Message-Id: <178083348873.1648214.11020626647820932506.b4-review@b4>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:pasha.tatashin@soleen.com,m:linux-kselftest@vger.kernel.org,m:rppt@kernel.org,m:shuah@kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:jasonmiu@google.com,m:linux-kernel@vger.kernel.org,m:corbet@lwn.net,m:ran.xiaokai@zte.com.cn,m:kexec@lists.infradead.org,m:pratyush@kernel.org,m:graf@amazon.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-91237-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,soleen.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A7826507D8

On Fri, 05 Jun 2026 03:32:27 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> Move the radix tree tracker implementation from the core KHO code

It's radix tree data structure implementation, kho memory tracker is it's
user. Please rephrase to keep the semantics clear.

>
>
> diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
> index eec9d3ae07eb..a3ee8a5c27a2 100644
> --- a/kernel/liveupdate/Makefile
> +++ b/kernel/liveupdate/Makefile
> @@ -7,7 +7,11 @@ luo-y :=								\
>  		luo_flb.o						\
>  		luo_session.o
>  
> -obj-$(CONFIG_KEXEC_HANDOVER)		+= kexec_handover.o
> +kho-y :=								\
> +		kexec_handover.o					\

I don't see much value in moving kexec_handover.o to a separate line,
btw, the same is true for luo_core.o, but it's not important enough to
change.

-- 
Sincerely yours,
Mike.


