Return-Path: <linux-doc+bounces-89659-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOEGLxTzFWqzfwcAu9opvQ
	(envelope-from <linux-doc+bounces-89659-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 21:23:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 191455DBF12
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 21:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3E89300EF4B
	for <lists+linux-doc@lfdr.de>; Tue, 26 May 2026 19:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEC130C63A;
	Tue, 26 May 2026 19:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b="PSR5klBt"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E822DEA9D;
	Tue, 26 May 2026 19:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.13.80.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779823129; cv=none; b=tVlx+Ct5+8esMcPP9VQd+NUwWedbRjvVqhwBjoXrOxpE9l5lRqUNqmm1qSkD5wXJYdBZJx/Bk1LOoyRI5LL4mnzaLlRZehLSxjqj0Mv7UAnAolg+S3MkxNCQRdJH+AZLVpRsS2xPl1AmpGb1s2LLY/m/MJ7un/XT3PGYIKv6sfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779823129; c=relaxed/simple;
	bh=DPzEq/k7wVWOHTlo4Pxl9AqCG45nMJgtiiYCVf0Wg+4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=AgcfnKDqoFsaidCs/ofXolmMArJj9YJ2wtUV9C+uEa3fVRv4uWaTki3AvzUyewHH5gBOR6/tYhnHPJBblsTN0Lxr9dBC3WCghz/0DCwGCsAbFSLgk8xw1zSWtEzEnMK3rGTLay8e1p2qBjvqMreUIjgrRix/DZKJhfZSgam7kI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=PSR5klBt; arc=none smtp.client-ip=194.13.80.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 795CEA0334;
	Tue, 26 May 2026 21:18:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1779823116; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HE0ZDb6xqkrgqysSs06Kqa0Shl7aUAqROC1SPIUzU/o=;
	b=PSR5klBt6XkghM+vxJoRLzp54noTGXCoOVtFaUunPlAKYt9wki5W+DNmFRZXWulOmc5EK1
	dnlOqvlY1QxT9A/n7ALTrzk4Kx8qB2tkdpuW7EiHwBiJIudd74C+Z5Je9gJKvVWba/9Iq8
	MKhM1lmdESU7oVr1Qo+SZ8IX6Cv8ZWg0aEsGOqduUC8MMzQXk2SaAg+kC23FcZJM4n2hrr
	ARlE8xmAOeQxIHp6KnctLgZoeogCtHllcoTbB3TFzDjgG7jgArlFz44W2OW5zKGlfFdx4y
	DOFnzzqvdlFKX78J/cAScUhqRmhPLKnKRdNug/4MOwGcHKrMWGXXJfEXI8hBMg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 26 May 2026 21:18:32 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net,
 tariqt@nvidia.com, dtatulea@nvidia.com, linux-doc@vger.kernel.org,
 hawk@kernel.org, ilias.apalodimas@linaro.org
Subject: Re: [PATCH net-next 1/4] docs: net: page_pool: drop reference to
 removed PP_FLAG_PAGE_FRAG
In-Reply-To: <20260526155722.2790742-2-kuba@kernel.org>
References: <20260526155722.2790742-1-kuba@kernel.org>
 <20260526155722.2790742-2-kuba@kernel.org>
Message-ID: <83168a37b8dc09413f5560d4c2715a37@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[tipi-net.de:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[tipi-net.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89659-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nb@tipi-net.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[tipi-net.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 191455DBF12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26.5.2026 17:57, Jakub Kicinski wrote:
> The flag was removed in commit 09d96ee5674a ("page_pool: remove
> PP_FLAG_PAGE_FRAG"), but the documentation still mentions it when
> describing fragment usage. Drop the stale reference; the fragment
> API does not require any opt-in flag.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

