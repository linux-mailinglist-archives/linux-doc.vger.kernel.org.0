Return-Path: <linux-doc+bounces-85858-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB0mGJPo+WmsFAMAu9opvQ
	(envelope-from <linux-doc+bounces-85858-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 14:54:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA4B4CE00D
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 14:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED79B30C87E6
	for <lists+linux-doc@lfdr.de>; Tue,  5 May 2026 12:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F64D421EFB;
	Tue,  5 May 2026 12:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D51kmhpu"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291B13DA7C2;
	Tue,  5 May 2026 12:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985430; cv=none; b=PVJ/6/8ocC4MpZ2ScA4Qpt/dlXm/ID2ZiomhaBg2M/Ilv2QD1eqQsVXQblSb1DF65o1mBgb0HxN90+v+Z12jKSPXdyhNnCpL7E9dx0y8oBNq9qHns/EnL5ztNqSW9lX1Nn56U5OXRrY5to/cGBzWz0dIX0D1R+rEXdjGPk1u+tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985430; c=relaxed/simple;
	bh=Akp1GLyu6qY6QNtDnLYglVVrCytFNrJXoTQHt5TXUGw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YIwESF/bh1C6HsU5qVpH1KHJBMUYoAWG7oFXbYdOCL/cvBFhzyfP3Q0ZCgGBaSOWBBX0bTjC8agqphDACYCd6rrRm6iAh165uin1fE9hS4R1pwVMAmFO436d+3uRYbja/yuEIVUxGKT9fnCKq/Mbx1wfowBqWkkQq32p2emew2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D51kmhpu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0086C2BCC9;
	Tue,  5 May 2026 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985429;
	bh=Akp1GLyu6qY6QNtDnLYglVVrCytFNrJXoTQHt5TXUGw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D51kmhpuyQX1qwLqAH5rXQ3PgpspVRnO59q1IsmhFYoL0Sx87m2vASdpHEHk7Tb9r
	 sqLTUsISzhH5/0DOdC2/XBz7yHmbmDSXYRESZV3b+M4ax8psyVrleJD8f74mom8wAg
	 p29LCtSdMbtoJ0ZO54lFwTkwsJRznCMVPj3La5Z8kwA5SKTUYYINdvY59ZtuJeYDdN
	 jV5BVi84ESmWDRJX+Ei3/uZocPS+5DxI/yZG2PptawbCz42csH/RjldtRfRpl+leMH
	 OHAUvyY9SBwy5F1gN+J0hgu/lRh3sOInEJG6wERXQ/Sv0nGwkIy0B5Rbds6Eky+i1P
	 +8iV6JxAR2K8A==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wKFEJ-00000004dmO-2JrW;
	Tue, 05 May 2026 14:50:27 +0200
Date: Tue, 5 May 2026 14:50:26 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Benno Lossin <lossin@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Gary Guo
 <gary@garyguo.net>, Joe Perches <joe@perches.com>, Matteo Croce
 <technoboy85@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, Trevor
 Gross <tmgross@umich.edu>
Subject: Re: [PATCH 0/9] Improve process/maintainers output
Message-ID: <20260505145026.7cef62fb@localhost>
In-Reply-To: <d303200a-9fc7-4ea6-89ec-90c2a159bfe2@infradead.org>
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
	<d303200a-9fc7-4ea6-89ec-90c2a159bfe2@infradead.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CAA4B4CE00D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85858-lists,linux-doc=lfdr.de,huawei];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,kernel.org,vger.kernel.org,protonmail.com,google.com,linux-foundation.org,garyguo.net,perches.com,gmail.com,linuxfoundation.org,umich.edu];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, 4 May 2026 14:13:01 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 5/4/26 8:51 AM, Mauro Carvalho Chehab wrote:
> > Hi Jon,
> > 
> > As promised, this series improve the output at process/maintainers:
> > instead of a pure enriched text, the maintainer's file content is
> > now converted with a table, and has gained a javascript to allow
> > filtering entries.
> > 
> > The initial patches change the logic to split parsing from
> > output generation. Now, everything is stored into a dict at
> > the parsing phase. This way, it is easier to adjust the
> > directive handler for it to produce a more structured document.
> > 
> > Right now, the entries are sorted alphabetically, per subsystem's
> > name.  
> 
> How is subsystem determined? Just by the heading?
> The MAINTAINERS file doesn't stay sorted so the output isn't sorted
> unless I am just missing something basic.
> 
> See e.g.:
> DRM TTM SUBSYSTEM
> GPU BUDDY ALLOCATOR
> DRM AUTOMATED TESTING

It was preserving the same order as found at MAINTAINERS file, 
where the order is wrong. I added a sort function there (I guess I
had it before internally on my branches some rebases).

-- 
Thanks,
Mauro

