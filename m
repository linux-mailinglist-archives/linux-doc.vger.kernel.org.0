Return-Path: <linux-doc+bounces-75119-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNFvBM1egmnTTAMAu9opvQ
	(envelope-from <linux-doc+bounces-75119-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 21:47:09 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A433FDE9FC
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 21:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE5D53005D1E
	for <lists+linux-doc@lfdr.de>; Tue,  3 Feb 2026 20:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184542ED87F;
	Tue,  3 Feb 2026 20:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tKVIJ+ZM"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901E52DCF61;
	Tue,  3 Feb 2026 20:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770151592; cv=none; b=pD5JVBBDo6q8FlY4g/qiQXuEWUgu/EbvKojmLlnO6/myGmNXOKzji7RF2Lr5dmOHrpw/7m8TLDR3+4xo6Vr95rKliCoeF9Kh3an4ZFfxAmZsSLnxFx22oAInkc5nOSSBklAXXGvAhP+a/l6fI3wUvXz+OEU815zRlTA4hiQrdCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770151592; c=relaxed/simple;
	bh=gFIG9s2gxwKu/+TBw0jLRlVs2o29cPy1GZTadt7c4KM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YYWk77F8kDrqs3Edq1rTXQ4FU5QockP0cRCeKo9IVCPqZ9Hr1uTKgXGyqag9DwGVIK/PrJw9WgFEsaHsCZlOze7DdmlyGerSPK1k9kwHT3EgJoFzqiKOMsVY2MQ+Zvk/DqQzsIZuNu+owack+y6VKQ8gEBS/ulnJA/xePv2NjtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tKVIJ+ZM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F92CC116D0;
	Tue,  3 Feb 2026 20:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770151592;
	bh=gFIG9s2gxwKu/+TBw0jLRlVs2o29cPy1GZTadt7c4KM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tKVIJ+ZM5gzag8nJy3v5mL4qpoMzWopJpgKcVBE33fHM0OKG8sLRRG+DlQvL6GPDA
	 6lgc/xVGsHlA6eoJLyTMaxdRU9qSRBc1/MwJdM8Bo35+kIxG/S3TDq83NRrcoxvCdR
	 tRY7MFCS+YMDKpyOwhhnMi0v+wxvWaJveKQEu1l5aGPKDC21HYApNNx6Mox1PmVyjF
	 vXC1G9O4cNssZNgPtYhKC2kqpyxxoI5cdRZgC8YT6zFbOwkx/Oct+Yh0K6yt8RxZZW
	 SBHDm64cvNVhpNm2I50d/7BbUy1JxNL1SvzdLypOpTguDKcuexsIEzbaEpXu5uOAzO
	 kdLdHwJPo1INA==
From: Thomas Gleixner <tglx@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>, Alexander Graf <graf@amazon.com>,
 Sasha Levin <sashal@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Ingo Molnar
 <mingo@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, Pasha
 Tatashin <pasha.tatashin@soleen.com>, nh-open-source@amazon.com, Nicolas
 Saenz Julienne <nsaenz@amazon.es>, Hendrik Borghorst <hborghor@amazon.de>,
 Filippo Sironi <sironi@amazon.de>, Jan =?utf-8?Q?Sch=C3=B6nherr?=
 <jschoenh@amazon.de>,
 ricardo.neri-calderon@linux.intel.com
Subject: Re: [PATCH 2/2] hpet: Add HPET-based NMI watchdog support
In-Reply-To: <be0ea0adfabcca5c191e07ca5a3811604633f70b.camel@infradead.org>
References: <20260202174803.66640-1-graf@amazon.com>
 <20260202174803.66640-3-graf@amazon.com> <87jywu3yov.ffs@tglx>
 <1e13c61d-8581-4ece-b31c-7aa771ba7bc2@amazon.com> <aYIhJWiBtiCF4UCr@laps>
 <1d74c3cc-d125-49cb-af05-43ca7d15f3f8@amazon.com>
 <be0ea0adfabcca5c191e07ca5a3811604633f70b.camel@infradead.org>
Date: Tue, 03 Feb 2026 21:46:28 +0100
Message-ID: <87fr7h368r.ffs@tglx>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75119-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: A433FDE9FC
X-Rspamd-Action: no action

On Tue, Feb 03 2026 at 17:43, David Woodhouse wrote:
> Honestly, even when I've explicitly told Kiro three times *not* to do
> something, *and* implemented a git commit hook to catch it out, it has
> a tendency just to automatically override the commit hook!

Anarchic Intelligence :)

> If it was made of meat, I'd have stabbed it by now.

rm -rf solves that problem too once and forever.



