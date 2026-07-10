Return-Path: <linux-doc+bounces-96272-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HOavExYDUWq59wIAu9opvQ
	(envelope-from <linux-doc+bounces-96272-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 16:35:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D3873BC84
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 16:35:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=i2BO+ksY;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96272-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96272-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E023E3095A50
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 14:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE21349CC1;
	Fri, 10 Jul 2026 14:25:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E0124677B;
	Fri, 10 Jul 2026 14:25:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693542; cv=none; b=CXd8BkKCRsPFxpACOa5pqvb+iXvovlsHQCxm+NYaEXjxbj4onMtvJGNl1WRLj+s5D3yexMAg0mRnW2XkaGOhP25b1Q/TA5Ni8zFQSw8R6wLwALfD2fzgZULsoaQ6eYKy0KQ4KVmtphnQthwMJU9r+pwNn5LtUTZEh3fw+zj2HbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693542; c=relaxed/simple;
	bh=t7poKbo0WL+sqaWRvXiD34fs/FyH6RahUpxjKAuxYqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqHCaZEIg3i2/pL1C68tdct+K3foGTH+iug0Zp/SBc7EBBrf/XaTAS2UQzKrMDK7h4gLUuuMEsu6MDeeEjuFW5BKPyKSukNQsJmPWkdDgnTHgxiep8jcw2zq8sA/4kxmexmMxpOJBVNIun50Kcz6dS528pkfSHO+bE22a8A3zBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2BO+ksY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B7F1F000E9;
	Fri, 10 Jul 2026 14:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783693541;
	bh=djPcu0FaAOL3FlpJ1AH3s2+hbsgy3DtsP6zvFCsTW9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i2BO+ksYpiBx37gKYrYNHUh2HlF78n89BGtyuZ73Ta2ah83pclTFsjnnd18tnUgE1
	 CfEg4zYqwCprIe85aRi75RuWGOvj4pWOHdp4RVPGBwdDGxiayiV3pi5kVpJ7bRozsQ
	 K7XPmGZO89OOJJ4cQxovFRQO5tAHtIRKljH5UaLtuwzn/fhxO91L5Nn0ssxuAQKD13
	 e+Pm/jk5CkFoxg3iHZOlLDMawkW/D6pO/Kf1TPI6CqHtVK+SOo0KPQfcNcPbiAitDM
	 /1qVc+q69HTej/99qnjeouENAUVr0gXDpXYyP4mv7zXt9Y7dlDIRcyNs5Q4Yz3JGPa
	 s3pubU758lSYQ==
From: SJ Park <sj@kernel.org>
To: Song Hu <husong@kylinos.cn>
Cc: SJ Park <sj@kernel.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 4/4] Docs/ABI/damon: document tried_regions probe hits
Date: Fri, 10 Jul 2026 07:25:31 -0700
Message-ID: <20260710142532.25200-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710044737.561102-5-husong@kylinos.cn>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96272-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:husong@kylinos.cn,m:sj@kernel.org,m:damon@lists.linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kylinos.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9D3873BC84

On Fri, 10 Jul 2026 12:47:37 +0800 Song Hu <husong@kylinos.cn> wrote:

> The 'tried_regions/<R>/probes/<P>/hits' file, added in commit
> 5b0de1bc3325 ("mm/damon/sysfs-schemes: implement probe/hits file"),
> is described in usage.rst but missing from the canonical ABI document.
> 
> Document the 'probes/' directory and the 'probes/<P>/hits' file.

Thank you for catching and fixing this!

> 
> Signed-off-by: Song Hu <husong@kylinos.cn>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]

