Return-Path: <linux-doc+bounces-90554-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X8z7AfkOH2piewAAu9opvQ
	(envelope-from <linux-doc+bounces-90554-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 19:12:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C7E630924
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 19:12:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gPdpn2Ug;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90554-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90554-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 921E8309E1EC
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 17:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96033F4100;
	Tue,  2 Jun 2026 17:02:12 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1974368D75;
	Tue,  2 Jun 2026 17:02:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419732; cv=none; b=dgE4DtEvlso1kLBrdYwNtVjFbYDm+9g6xdjT2xBAEHEcWdoAX3ozIFlK2ZB8Y0Dt5Ov+bvF4OyCe8K20GnpJwtCpTtp7fL7e1pX6WIzTOU2lzXLaQL191ZBzseaaN8Xk5H527rD3AjrEp/ucIuzrK3pX96YvEG0K7IV0rTeemJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419732; c=relaxed/simple;
	bh=HH/z7canl2OU9BPNqf3qYc7C4WXPq1KzR3Vnn1FqPfE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EgCypo0K5Mjj5MJMluGNI7gCbCkvqhEnyV7ZVQGEXBaDfk1dGDuqJr6uwaj+rr0DnhbJ0QH80homtRZf2OzSQ/fiD9wRku4lUiCH0wTZq1TXZ8f2zV2Vju9DgY8aGIshJBqMX8JVrczNfTSG17ElYY9KTTE1xxUlgzcKTLCOG3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPdpn2Ug; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188071F00898;
	Tue,  2 Jun 2026 17:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780419731;
	bh=ShcL7r50dfVkd1EvhBq+OIaa4ZXVW5H9HttcXDcV92M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gPdpn2UgiboYZax3m1sudcCd1Bz3IObeQJ8gFwBLw0ARzbS0bi9eNPJOjxEYtg/FT
	 +pTvMg2hqxgWZUEM0Kz7DhvMRGLQXfTXKJbKZJM0QAQRunrgiTYrUfOlMnOannZwSj
	 yIRSczh7SteOl8ldrFzPnskPV5NFZcUtQJO7jXtzVEo1jsPiLGcACshrJdZzoWTnbD
	 p9JiYBo3MYfttrr20G00bzhqRwVrvnCKqoT62F1/0NWk3rEdSWmae1ZNFTlZSP6jC+
	 X7PEVjIoDqoIoV2IDAoEZEeRvpjdav5LJjcOPT2SVuhTtmqN7xGDUBaAiPJ7N8ZoU/
	 3jIo1lx4Jxx3A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,
  skhan@linuxfoundation.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  corbet@lwn.net,  dmatlack@google.com,
  kexec@lists.infradead.org,  pratyush@kernel.org,  skhawaja@google.com,
  graf@amazon.com
Subject: Re: [PATCH v5 04/13] liveupdate: register luo_ser as KHO subtree
In-Reply-To: <20260602031717.197696-5-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Tue, 2 Jun 2026 03:17:08 +0000")
References: <20260602031717.197696-1-pasha.tatashin@soleen.com>
	<20260602031717.197696-5-pasha.tatashin@soleen.com>
Date: Tue, 02 Jun 2026 19:02:07 +0200
Message-ID: <2vxzzf1cdgfk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90554-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:pasha.tatashin@soleen.com,m:linux-kselftest@vger.kernel.org,m:rppt@kernel.org,m:shuah@kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:corbet@lwn.net,m:dmatlack@google.com,m:kexec@lists.infradead.org,m:pratyush@kernel.org,m:skhawaja@google.com,m:graf@amazon.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,soleen.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82C7E630924

On Tue, Jun 02 2026, Pasha Tatashin wrote:

> Entirely remove the LUO FDT wrapper since the FDT only carries the
> compatible string and the pointer to the centralized struct luo_ser.
> Instead, register the struct luo_ser via the KHO raw subtree
> API, placing the compatibility string inside the structure itself.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav

