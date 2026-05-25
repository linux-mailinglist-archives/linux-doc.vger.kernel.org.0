Return-Path: <linux-doc+bounces-89372-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLBFKX5oFGriNAcAu9opvQ
	(envelope-from <linux-doc+bounces-89372-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 17:19:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 016E35CC302
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 17:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6F1D301C5B7
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 15:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E53E3EDE6E;
	Mon, 25 May 2026 15:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="ZgwucYs3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pe7X97JB"
X-Original-To: linux-doc@vger.kernel.org
Received: from flow-b8-smtp.messagingengine.com (flow-b8-smtp.messagingengine.com [202.12.124.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C5C384CCA;
	Mon, 25 May 2026 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779722292; cv=none; b=d2F/X5f6LreODMmtLX0Uz3uqattdHve+2Tq94USediHJ4YyRaejf/iRjpP8v/mACJqGx07pjE66dWaqggtwJef+2d8Wlr/YmnyMbDKzu80zt32ipAH8JtxD2SvmMWOx3S5dqwo4tOVryb598EYhl/UFxKI88VuixmM1GFz4RfFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779722292; c=relaxed/simple;
	bh=4QkRt+iKr11Jp/pucEfsueGPTjgQKpWewnCGgXJfwGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/LcfckSnr2VroLW12r3vASgQf8MwafrQ/qP8zbKx7VXJo1qr0ZtgDOb0LgnvUZ/0vFdWaxOe2jr2w62BbwYD/D3vUOfDf4jc4fU9K4FazmHBMVt1zgktC/IlZ2UYgVw4pOOi8daxq6AeTkvRyOQhVOEbeyuT4pECAGMDVppZVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=ZgwucYs3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pe7X97JB; arc=none smtp.client-ip=202.12.124.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id C4F2D130008E;
	Mon, 25 May 2026 11:18:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 25 May 2026 11:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1779722288; x=1779729488; bh=XNbeMvEzyPh7sPx47CH3WFhZNyDg4LG8
	isuSFxUw54Y=; b=ZgwucYs3+R/6nBszPKkbyaaLOw1OxtR1O2hV7axbTFh568Sz
	yqsraJGeP9Mh55L1umBu45pVfGjtQ/yY2072ude/j+VUiLp0wKnBKnBzffmQTJjW
	/o6y8NhmakYY7QpVtA3+0UuERBM+v3/1jaJZBBFSMC1KzrWelj74dRlwGcnhe+2Q
	GN2vBFdJcoZAEObvxQ0cpPwUMtznPUF15RUOW6bBsvNRbXOw3NWrGeu1rUdtfPCP
	KRtZ7RMKVOisgrU2X5VinS6AX0Bw9rksA6Pq35tp4IqGtwAUEZ8SXNVzxRdItopa
	fE1xING4NpeXknYeXNIL73nPKFDhfUVaaBm1PA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779722288; x=
	1779729488; bh=XNbeMvEzyPh7sPx47CH3WFhZNyDg4LG8isuSFxUw54Y=; b=p
	e7X97JBh31Sh07ScqRqkEf2YOrHHOUgWC5br+p5O05641zAF/bw1oOiSl51scTkL
	TTBmGNhHqGdy1A4ZQphhKCWRfADUQ+t/4v2R/7gCyxE8VyFGZqB0BFfxYiMZECt5
	GrrCcw+pm3XCSta6tGdeiTs3s9gf3/hHzzWt+SNV6NpvKTfyuiGTduzK9uFAXt3U
	b4qeVuqbEhqzu1xePnxNMt8BNrrh90Z5XxK7fgL1BZ1WU0+Hni8lr9GeW3viOxc1
	33a5yXoApOcudml5GCuNo7lCtONMBZT5XBC8Ium0/KFoFE6btbuQ20GO+4kbrrMD
	ncG4YKOPipnNo3bmpJtjA==
X-ME-Sender: <xms:MGgUajFAUiJsfhbMD8cHUarZn4-DaghF1cg8HubDqerjMlMmmi53vA>
    <xme:MGgUaovjOjPg9H37IzVGtvI4xGytU93RUdUMWdKYS2mPACUQWau6wj9cV7-ZDTeZI
    AJkFJg2Yw9BVgjFiCOO2xbNDWiiCX9AFjI0jxlnxjn67DMoSi92tQ>
X-ME-Received: <xmr:MGgUavYJ3acQQt61YkqqwotH0qSNFWkOLpKjD2k7SjiKN9gyPnPRBQWuhJJJoA>
X-ME-Proxy-Cause: dmFkZTEQSsA+CxVWFlgQbg+iDCxnTUddRJf1SNUTKP4UbEAr+U7uFdm1L5+NkcBqlGZsgL
    pWKCoEhxBJTNaYSbHSylQV/0lm3jZelxuBNryUEz7SwVEtnBFzslpWQY8GJQqg2vsw0Zz0
    QbZjSZzpKFySn6GqmOLPPlHhCcbMIJ4g8t5wjZhUIw3xERy2MPRsEDG+tKN/NHyTPLO7qG
    MNuhuxsRfncOHiTNXvffzzZm0c3vhnS8L84qdlFXa8gN4MF4U+SuBZ8q2TZuKc3/FG/FpB
    PVSHHPoh/Er5NdABQbI2y8OVtNjciY+F6ctFbe2E3mJ1Jli9xJbNK2RTsh9eF1N7wmLMer
    +EdWIphgvjcbs5d2AJ59P1kblBevKKM+MdC/ufRfH/YKB+uf3079AfvZnMPv9gPK+9Ntfn
    PpICwq40BKLb/d8mAa73XLYvg6gtbWHshle5RMxYTC8df9j0imwSTBIiiZNqtI+TjNBtKT
    ZQIQqfOSRANa7gCD8G8tiOC6+LZ7tar2QHfd/1bAJDIQ5U/MJrqJP2t9drRITdX5TOGnp0
    moO9d+bPUiX8QPtzfu+FHjuFZlLwUePpENrh+Up+d4tRLtnf7kdtSthSxLCCd1z+swEhAZ
    ZOGkGRExuVavjoQAIPsmxZtMQE+r1r2JvHWnywL01pE1anfn209CZp5q3vKw
X-ME-Proxy: <xmx:MGgUalpLt6qUWtQKAom-JJcSBYEe2hkrM3mIBsKUp29hEwzNSK0J6A>
    <xmx:MGgUampwvba2qMEc1z2qQ2iA9ZydNO8pumW3dVf9aCb-ZN0PGE_usw>
    <xmx:MGgUaiX5uzhzrMtUHH5JFosvi4v9Lml4r-i00G28693pIcTmAs2S-g>
    <xmx:MGgUajQ6izxbSlGL9PDntG4Qj4XsHDLOT-cm5F5mV6PSR5rDB5YKig>
    <xmx:MGgUamW0W6QRvvpVR2BPEw06UwSETR2oy1kuoY2zLWaGSnhCceUiuVyP>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 May 2026 11:18:07 -0400 (EDT)
Date: Mon, 25 May 2026 16:18:06 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, akpm@linux-foundation.org, rppt@kernel.org, 
	peterx@redhat.com, david@kernel.org, ljs@kernel.org, surenb@google.com, 
	vbabka@kernel.org, Liam.Howlett@oracle.com, ziy@nvidia.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, seanjc@google.com, pbonzini@redhat.com, jthoughton@google.com, 
	aarcange@redhat.com, sj@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v4 07/14] mm: handle VM_UFFD_RWP in khugepaged, rmap, and
 GUP
Message-ID: <ahRmty2nebDOvgpt@thinkstation>
References: <20260525113737.1942478-8-kas@kernel.org>
 <20260525131923.11A1B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260525131923.11A1B1F000E9@smtp.kernel.org>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[shutemov.name:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89372-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[shutemov.name:+,messagingengine.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[shutemov.name];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kirill@shutemov.name,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sashiko.dev:url,shutemov.name:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 016E35CC302
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 01:19:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] GUP enters an infinite loop when using FOLL_FORCE on an
> inaccessible (PROT_NONE) VMA that has VM_UFFD_RWP enabled.

Confirmed. RWP resolution restores vm_page_prot, which is PAGE_NONE on
a PROT_NONE VMA -- the page never becomes accessible and FOLL_FORCE
loops. Will fix in v5 by rejecting the registration up front in
vma_can_userfault():

      +       if ((vm_flags & VM_UFFD_RWP) && !vma_is_accessible(vma))
      +               return false;

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260525113737.1942478-1-kas@kernel.org?part=7

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

