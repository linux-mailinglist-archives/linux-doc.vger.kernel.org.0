Return-Path: <linux-doc+bounces-88027-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFYKI5v6CWpPvwQAu9opvQ
	(envelope-from <linux-doc+bounces-88027-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 19:27:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED772562878
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 19:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FAA4302C926
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 17:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086103C661D;
	Sun, 17 May 2026 17:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V14Teuym"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74213C65FD;
	Sun, 17 May 2026 17:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779038793; cv=none; b=dR0xkuVbkRnF/0w7wsWHLTqqD08J1r1Ehm847ulZ9tsLxsc1SXmecdgHRJ6Ht3W/upx6yabKEA9bzSi9UZ8yhq0JOwz0E25hMzkrtIipr7KejGx8MdVSkWgBfky0Du/JyNg1bzlMAg/vwHCVhMyayHTj01MwTg+NnUbkS+4PM40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779038793; c=relaxed/simple;
	bh=lGKadVHrKNT6CmfLVM9JxMsWPtA5cHWet/JGmKOuSG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCId5nV8LzX/kGUcT5/uCRXAZ6Vd/IUmerY/1bukMRO3B78ueYpgH7hsyDr/QGZfuHcExlA3aBSPoZzjcd/QKy0KaUw5ZT8aGzyrqId6b93h/9g+YPrI48WtUi98+nkC+WnoSYJlFTnyKQy4jo0U56enRZXkqI5Y7BgM01esswU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V14Teuym; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C912EC2BCB8;
	Sun, 17 May 2026 17:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779038793;
	bh=lGKadVHrKNT6CmfLVM9JxMsWPtA5cHWet/JGmKOuSG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V14Teuym/BTICjj06GX/CguKshYW0qhHPZ8mASyUXBhZ+kn/vrv8I9k7og2EsFjsU
	 oE56s0i4z9OjB0cy8uThGQwgfkpB8ck5evKRR1NwuP6oCDKmGxm9MM/DzljbJ5zi9o
	 4UJS9phIW/XSrkxAuFw9j9UnM+VcfDmcZOoQRdjxkc78eqflUyH5ygIUEWcCbq1O7x
	 LcG+eiRefLnbIaAVe4zZbPwxZ11CeNCojW2ILF5inBqaGqRutMrwzY30q2kyIIefI0
	 QCM6/NHPVCxf09NczrpQ9fFai4sB6zOPdIjTI8eed5oo38NauriLcUSfhV7rdKv3fI
	 NQhO6ltep+iLA==
Date: Sun, 17 May 2026 20:26:25 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com,
	kexec@lists.infradead.org, pratyush@kernel.org, skhawaja@google.com,
	graf@amazon.com
Subject: Re: [PATCH v2 04/10] liveupdate: add support for linked-block
 serialization
Message-ID: <agn6QeIamoeMkesv@kernel.org>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-5-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514222628.931312-5-pasha.tatashin@soleen.com>
X-Rspamd-Queue-Id: ED772562878
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88027-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[soleen.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 10:26:22PM +0000, Pasha Tatashin wrote:
> Introduce a linked-block serialization mechanism for LUO state.
> 
> Previously, LUO used contiguous memory blocks for serializing sessions
> and files, which imposed limits on the total number of items that could
> be preserved across a live update.
> 
> This commit adds the infrastructure for a more flexible, block-based
> approach where serialized data is stored in a chain of linked blocks.
> This is a preparatory step to allow an unlimited number of
> luo_sessions and luo_files to be preserved.

Shouldn't it be a part of KHO?
 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  Documentation/core-api/liveupdate.rst |   8 +
>  include/linux/kho/abi/luo.h           |  22 ++
>  kernel/liveupdate/Makefile            |   1 +
>  kernel/liveupdate/luo_block.c         | 388 ++++++++++++++++++++++++++
>  kernel/liveupdate/luo_internal.h      |  57 ++++
>  5 files changed, 476 insertions(+)
>  create mode 100644 kernel/liveupdate/luo_block.c

-- 
Sincerely yours,
Mike.

