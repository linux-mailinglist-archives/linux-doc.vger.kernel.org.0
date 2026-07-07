Return-Path: <linux-doc+bounces-95515-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZaYuOLx9TWom1AEAu9opvQ
	(envelope-from <linux-doc+bounces-95515-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 00:29:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCB47200FA
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 00:29:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GbSHJjuO;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95515-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95515-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F84B3038AD8
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 22:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614AD3D952E;
	Tue,  7 Jul 2026 22:28:34 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCD63D952A;
	Tue,  7 Jul 2026 22:28:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463314; cv=none; b=ninqd72a/00aOpBDZLWMfBUMvQQPdZtREBtTgokXUh6XQQg7wwHVuwchNJJPUqJSB0XdmuAhxkwEyWnIvrd1qOSvNL58rDksQefFph7G2Hbjaqf5Q+nhG+vVKuxCqc9Cib2SWL0BW7Mu17a12Ok8vzXuYbL1n3pSQ5En6v6+Ycw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463314; c=relaxed/simple;
	bh=HVkM4+sYTTUEixg6lUlR80nOrvrs0NmBv/cpnHTEzYg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=cWboZfrfnH9YFgJMQ2sjv3E53maTPhDT95HIq68TO/gNPtLJD12cchE7MI1VT5OsjgxrCi6cVM7gBa7yfJbZs3CaM/2xS8ZtKXFUKSOLbc3oqTECPtqOSCANu23YH2ab5ZXM2eNfeDsfW9lH4ims3K4+SkxG1bzO21Ya4Z+afWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbSHJjuO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302CD1F000E9;
	Tue,  7 Jul 2026 22:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783463312;
	bh=HVkM4+sYTTUEixg6lUlR80nOrvrs0NmBv/cpnHTEzYg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GbSHJjuOLOhFlaX/xK9LmzOFdDwZk8v7dYTE7E8J6Fo4rEVst3kq1AQzLQLq2R/Nz
	 EiBUiIa4YrUWx5mAykkZ6rTaIYfIURANrqEzp7XQLTrzltf5KiZQYVlLGy76wyxhgK
	 BQjrRvpvO33oaAXMK7dZZWN1EJmNuNCjgMvzcPw8jyVPoTqXpty4SxotSyK5p98GHf
	 IqdJSU1NLru0Phg6m2ZznNvj9JbFJdkZQnqdpGMsfoaKPzElKfGftWCliKuL7aQC8G
	 caKPjJqKvz+Sh/ASXGH17eMrK2f0Xtq2PBEtjxQl2aP0CRErhS9+ZvMCTpoXemQFLY
	 biHafNuMtvQYw==
Date: Tue, 07 Jul 2026 12:28:31 -1000
Message-ID: <7eebc05a44cd64399bc2d16691222ae2@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Liang Luo <luoliang@kylinos.cn>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrea Righi <arighi@nvidia.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Documentation: Fix ops table header reference
In-Reply-To: <20260707094538.3033292-1-luoliang@kylinos.cn>
References: <20260707094538.3033292-1-luoliang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95515-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luoliang@kylinos.cn,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:arighi@nvidia.com,m:emil@etsalapatis.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tj@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tj@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SINGLE_SHORT_PART(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BCB47200FA

Applied to sched_ext/for-7.2-fixes.

Thanks.

