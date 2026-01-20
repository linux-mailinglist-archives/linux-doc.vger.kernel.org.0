Return-Path: <linux-doc+bounces-73310-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N52H5Dcb2n8RwAAu9opvQ
	(envelope-from <linux-doc+bounces-73310-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 20:50:40 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF404AC22
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 20:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3A40A80D7AF
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 18:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CCF44E039;
	Tue, 20 Jan 2026 18:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nWDbIb8C"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D4B43E9EE;
	Tue, 20 Jan 2026 18:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768934197; cv=none; b=uoAJp19qmzvsRzs7ZHf14BoBq6c7a0HDG8K94k8Jw3D/z1W6GJ4m478nJPDFdKI+LvqmraUYaOucuBlaEZ7mOQrcDVaZuJ5Zysg2mesWH7xggS328nLi0PXCI/N2rHdl3U0eBF6B3x6wvz4hGKtTsYfTGj7Qhs1PlM+ROHLF/pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768934197; c=relaxed/simple;
	bh=QYKth/XopUUmN2w5/xA9zHlbSfdy2ir24LbewWEwvOU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XMZSIF8vP00xj4caL+DVHiu9WOIre0BPGgTzxPUD7GGN78fxKvfx6a8omu/rYN/Jd23gJjb0GysovKEEh2sYFaHd5rqnJnNATXGWnGl9RnmFTefMjbYGpGgcoCesxBMs0ixSAfjTm9AIuoGCWIwPdY5fT4Pm0kx67fUEEFHIpbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nWDbIb8C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA94CC19422;
	Tue, 20 Jan 2026 18:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768934196;
	bh=QYKth/XopUUmN2w5/xA9zHlbSfdy2ir24LbewWEwvOU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nWDbIb8C4Pdc9S6Dmuhx0sP4s0TJLIBQyQ/AcWbVHuZ0hRe0PoKYtU9Hxw7X8LLHA
	 aGURL8szqEnjBpSMEtjFVGh8C/URSKLfq0rrzoK8uC9cmJppJqsnolI/JyuUHEPJr8
	 9reBvNxeN1DY9U2ZV2noPOjkpnUU3Bqg1QxrwnPWOSnMq58zo1iMYa7l2HieqrX0oA
	 8ApTo/v7yNwJwAlbNpibuU1nZvgD952gLoAG/3qwjwIPsbPb7UPar6tliXWZ4G/KW6
	 LfGny8wlbK+Hk9h47zxldaGYXNLdGVZCr+l+U1QnflucJkAB4DfAjL3btK3jNCFHlr
	 C+4tPohqzOZ5A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Andrew Morton
 <akpm@linux-foundation.org>,  Alexander Graf <graf@amazon.com>,  Jason Miu
 <jasonmiu@google.com>,  Jonathan Corbet <corbet@lwn.net>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  kexec@lists.infradead.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH 3/6] kho: docs: combine concepts and FDT documentation
In-Reply-To: <aW_K7QZj8HYzA00t@kernel.org> (Mike Rapoport's message of "Tue,
	20 Jan 2026 20:35:25 +0200")
References: <20260105165839.285270-1-rppt@kernel.org>
	<20260105165839.285270-4-rppt@kernel.org> <2vxz7btce06f.fsf@kernel.org>
	<aW_K7QZj8HYzA00t@kernel.org>
Date: Tue, 20 Jan 2026 18:36:33 +0000
Message-ID: <2vxzikcwcery.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-73310-lists,linux-doc=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: EFF404AC22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20 2026, Mike Rapoport wrote:

> On Tue, Jan 20, 2026 at 04:08:56PM +0000, Pratyush Yadav wrote:
>> On Mon, Jan 05 2026, Mike Rapoport wrote:
>> 
>> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>> >
>> > Currently index.rst in KHO documentation looks empty and sad as it only
>> > contains links to "Kexec Handover Concepts" and "KHO FDT" chapters.
>> >
>> > Inline contents of these chapters into index.rst to provide a single
>> > coherent chapter describing KHO.
>> >
>> > While on it, drop parts of the KHO FDT description that will be superseded
>> > by addition of KHO ABI documentation.
>> >
>> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> [...]
>> > diff --git a/Documentation/core-api/kho/index.rst b/Documentation/core-api/kho/index.rst
>> > index 0c63b0c5c143..03cd9afbdb2e 100644
>> > --- a/Documentation/core-api/kho/index.rst
>> > +++ b/Documentation/core-api/kho/index.rst
>> > @@ -4,10 +4,73 @@
>> >  Kexec Handover Subsystem
>> >  ========================
>> >  
>> > -.. toctree::
>> > -   :maxdepth: 1
>> > +Overview
>> > +========
>> 
>> I ran a test build and Sphinx complains about:
>> 
>>     Documentation/admin-guide/mm/kho.rst:10: WARNING: undefined label: 'kho-concepts' [ref.ref]
>>     Documentation/admin-guide/mm/kho.rst:31: WARNING: undefined label: 'kho-finalization-phase' [ref.ref]
>> 
>> I suppose you should add these labels here.
>
> It's already in Andrew's tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-nonmm-unstable&id=bc1a060da2a76161ba65f1badc551de15056e398

Okay, nice. Then with that,

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

>  
>> Otherwise LGTM.
>> 
[...]

-- 
Regards,
Pratyush Yadav

