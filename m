Return-Path: <linux-doc+bounces-91229-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B7yEBnAEJWo1CwIAu9opvQ
	(envelope-from <linux-doc+bounces-91229-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 07 Jun 2026 07:41:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A0A64EE04
	for <lists+linux-doc@lfdr.de>; Sun, 07 Jun 2026 07:41:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OH0fXT4a;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91229-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91229-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C6B03002B77
	for <lists+linux-doc@lfdr.de>; Sun,  7 Jun 2026 05:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55C02BFC60;
	Sun,  7 Jun 2026 05:40:57 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AE42D6E5C;
	Sun,  7 Jun 2026 05:40:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780810857; cv=none; b=NfrrgX7u92xXESvhiTidQaIsXlG9ol14ZZA4ofT4Q+pAA0rMoJ6uUPlS3GSqTZE7zbeZIn8PaJhdL9GRi1Wx0ZA/szfX9B4hLUDS6a0V/SHl91LNV/WqBrcNLM9r7M9t5MBevu/re2HZIs0CZkS5jq2it9/B9admXel8uW2zqN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780810857; c=relaxed/simple;
	bh=dUyFbC2koV/kZGMWMfTq7zQcssTYFrEFRwZsEr1ZynQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bwZGqg0jVTPnp5fUoiVJvpCjXmtjs9lKtUA7+ZXDzPe3lbIbqYo9lA/sC1FIfigRNVywxuPQjDeZaYVYK6hTwcFGlszp1Qwi+0RJWGORnDzLkdCQOAEGeT4IP7lyNkGnyeF0iLScKTdITIAQskYr8yxSB8TPZ3zW57jH/M8NFEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OH0fXT4a; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F5D1F00893;
	Sun,  7 Jun 2026 05:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780810855;
	bh=b7TWqZpXo9m0twdnETZaCSpwwDJItYnjhbOEas7Kni4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OH0fXT4aexoxL3cc0AMzNVuAHnv6cvmkPt20x0NyrjUPQLqk1L+BAVTJ+XfN+0gkP
	 OMfb8ALvfRO53XRZKW1gb2RHvwJSs4TpHDH3aD3eiIHlHyhmP/L0RpKxwUG+v4mjOa
	 jBiVUXsoYKVwZ4m8SA7wIIVPtFiXuszclruaUm+RHQGlWtS8gYsBuGws5Tn9kokFg/
	 fPbtUGHWsI83SxsbpnlKOCzhKDSzYyO8Lmat+pT96B7XebVYgAWIkDOdA18++vPBFQ
	 xvFFWZTbKT7t5rXBxz/qwQzsLim5nWZ69nDWqV7nnKpUnoTE6D6M3mhxLZJ843BEf6
	 z0ppglrgK5LeA==
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-doc@vger.kernel.org
In-Reply-To: <20260605160645.3650271-1-pratyush@kernel.org>
References: <20260605160645.3650271-1-pratyush@kernel.org>
Subject: Re: [PATCH] docs: memfd_preservation: fix rendering of ABI
 documentation
Message-Id: <178081082228.1643309.7441148315833852918.b4-ty@b4>
Date: Sun, 07 Jun 2026 08:40:22 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:pasha.tatashin@soleen.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:pratyush@kernel.org,m:kexec@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91229-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51A0A64EE04

On Fri, 05 Jun 2026 18:06:44 +0200, Pratyush Yadav wrote:
> docs: memfd_preservation: fix rendering of ABI documentation

Applied to next branch of liveupdate/linux.git tree, thanks!

[1/1] docs: memfd_preservation: fix rendering of ABI documentation
      commit: 3a358c78093f98a70d84c934b7054f636bc846f2

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: next

--
Sincerely yours,
Mike.



