Return-Path: <linux-doc+bounces-87056-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGgSNlnvAmrAywEAu9opvQ
	(envelope-from <linux-doc+bounces-87056-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 11:14:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D70E951D690
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 11:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81E973095005
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 09:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B7A3A6EFE;
	Tue, 12 May 2026 08:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="A159a+Qh"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712AC3612F1;
	Tue, 12 May 2026 08:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576390; cv=none; b=V46jz4ZnXwFNScK5WlAbIx+YrGZeUhGrLsRZoMBL0+X8Jk3+roPNZQeXMe6jM2o4MTbxNymjtlW7gkcMaYgm5g222qvPe8EzyujZ75fw1K4Xc83hRoFWHJ6YVjsqkfbP1HaKmpmgRQfeXrEGmj/ZahC5lfi1vBqtIYH0/xcqzl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576390; c=relaxed/simple;
	bh=HomaUpIYA27R+BELhpQfX1CZ4dkZwQOf2WtTD4aEC/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qg7D1GE4eag1Z9Yq4XcPMTEqhOKuiTZrwC4X+TVxD838nydu/jcGJiaJcHHyAAF57PqWAwf3oq6F+5UXInS/0nAnzCbAndfNnFEAZ6vysGp2ad/FM/ohPC9koK9Lci4D8SkDf93YPRshVFdiN7eHrXOLucNDF5diLjvWMHYwr7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=A159a+Qh; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 238DA40E0140;
	Tue, 12 May 2026 08:59:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zbnA3-FYneSq; Tue, 12 May 2026 08:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778576363; bh=CmV7EhV35CsKQajYcbhb6mrhovbhrjlSKM4zYuqyZ90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A159a+QhkXH6ityHUYTuOkZs8OIJXjtgvBR/jcvys/rzHuzs+JCQ3wReSAbrkg8E3
	 MZ3lVpaiQcJ3iwmChVdNaFW58Aob4FuZciclo7vsnWPReh9hpzhqlpNaiznpygvxEu
	 eOF3wZwHyfO3XsPyac13i+Ecg+BnlsBDAf6agqvPltBuCP5EmXlffHV1A4cqD4st9Z
	 wAISiwGmhlXo8Xb5Dl+Hy/nnFtxftcbEA/UPwvyc+RtWf3fDFEw9TkUxJEgBGL7mqi
	 j4jxOCB0UItdsLOOb1gs41kEsNT3D0jA+peAqFdKz5dcGT4iWG8ze91S4/TacJMBVE
	 glDf8WiAt5j7zDUzIUBvMY3ZanbxGsDadjJWu0uFKn1G1wKt0KXJp6qT19/YdUp5B9
	 fn4/4niVcseaBL0z+eT0FuXyx5TKVm1WxMCZqBcnczvz0EYPTcU4kMGsTXRpbh774t
	 /UvPLUVk7A0LwIjuujoLvTDoALfBfwFINQQX7q12rCTSC8ZGNF/FaAJscR0bb5hYW0
	 k4y+WdKspSrzBJIGoPMvWPIkv4KjLNw85Eb22tOQHu+2zQXkXj7uo4hsi9mQlhdner
	 BPOnQU1kcQ1YRyM4XmeJoNhczK75VlABTCdv+729GaVL3QmwuX5h7guGwmnuYfZsc/
	 Tmv8G1a1d1BZYKDGzK+6FQ9I=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id B72BB40E00C2;
	Tue, 12 May 2026 08:58:45 +0000 (UTC)
Date: Tue, 12 May 2026 10:58:40 +0200
From: Borislav Petkov <bp@alien8.de>
To: shiju.jose@huawei.com
Cc: rafael@kernel.org, akpm@linux-foundation.org, rppt@kernel.org,
	dferguson@amperecomputing.com, linux-edac@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, tony.luck@intel.com, lenb@kernel.org,
	leo.duran@amd.com, Yazen.Ghannam@amd.com, mchehab@kernel.org,
	jonathan.cameron@huawei.com, linuxarm@huawei.com,
	rientjes@google.com, jiaqiyan@google.com, Jon.Grimm@amd.com,
	dave.hansen@linux.intel.com, naoya.horiguchi@nec.com,
	james.morse@arm.com, jthoughton@google.com, somasundaram.a@hpe.com,
	erdemaktas@google.com, pgonda@google.com, duenwen@google.com,
	gthelen@google.com, wschwartz@amperecomputing.com,
	wbs@os.amperecomputing.com, nifan.cxl@gmail.com,
	tanxiaofei@huawei.com, prime.zeng@hisilicon.com,
	roberto.sassu@huawei.com, kangkang.shen@futurewei.com,
	wanghuiqiang@huawei.com, shijujose2008@gmail.com
Subject: Re: [PATCH v19 0/2] ACPI: Add support for ACPI RAS2 feature table
Message-ID: <20260512085840.GBagLrwPXIom3JWEbG@fat_crate.local>
References: <20260408172850.183-1-shiju.jose@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408172850.183-1-shiju.jose@huawei.com>
X-Rspamd-Queue-Id: D70E951D690
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[alien8.de,none];
	R_DKIM_ALLOW(-0.20)[alien8.de:s=alien8];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,amperecomputing.com,vger.kernel.org,kvack.org,intel.com,amd.com,huawei.com,google.com,linux.intel.com,nec.com,arm.com,hpe.com,os.amperecomputing.com,gmail.com,hisilicon.com,futurewei.com];
	TAGGED_FROM(0.00)[bounces-87056-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[alien8.de:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bp@alien8.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Action: no action

On Wed, Apr 08, 2026 at 06:28:47PM +0100, shiju.jose@huawei.com wrote:
> Changes
> =======
> v18 -> v19:
> 1. Fixed gemini tool reported issues sent by Borislav. Thanks.
> https://sashiko.dev/#/patchset/20260325165714.294-1-shiju.jose%40huawei.com

I can still see outstanding issues there:

https://sashiko.dev/#/patchset/20260408172850.183-1-shiju.jose%40huawei.com

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

