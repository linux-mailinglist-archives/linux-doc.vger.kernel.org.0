Return-Path: <linux-doc+bounces-88025-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLp0Kt/5CWrivgQAu9opvQ
	(envelope-from <linux-doc+bounces-88025-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 19:24:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2D15627E9
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 19:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57F0B300292E
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 17:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF983C4B8A;
	Sun, 17 May 2026 17:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pTx0Mu1I"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D24525FA10;
	Sun, 17 May 2026 17:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779038682; cv=none; b=oHuiiSsciQ/GSSgk/ZgUK+kEgB8E7TyxttPGbk0TDL1zDll37Xvgelo6wjLFg3BtpQGAaE+na8zCaysqEpIgsn06Vj33TpfDL8lE9WqNEkN066ciRv2qvS+9s3/qqOKrjYJk43YPISJwd1UTP5/2LZ7G1lq9eOoMLBQGn4uCE3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779038682; c=relaxed/simple;
	bh=18wU4AaA8QQO+xGJ2kIhTsunkndrM76R9Ox2d9eFd5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBPE7iF24sgWqp6LmSnq4OytWsekyoVO+YkRdMwtR8EPgC6+5KiCyRQWHheVU0cFfTdmEf6fHUP88+kwJ90eLkU9s0wO16epx9GfTk90ICAvYouBT9lCLauPhGbIPsMGskgpqVO2y2BZGvbrW3WVz+MruwbFzmjwzZouKuxxYuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTx0Mu1I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80395C2BCB0;
	Sun, 17 May 2026 17:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779038681;
	bh=18wU4AaA8QQO+xGJ2kIhTsunkndrM76R9Ox2d9eFd5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pTx0Mu1I8DpGHA2aJuMI7NKp8xzGNMC0P0k63npy00s0iHZlPGlMRb+FwVyDrnWf9
	 NUv4DcxtPx7aMQ4I2Kx34VcOi65DjSVPQJnL/GETiVIvTnA8tGowjq2iazzDert6P0
	 RK0J9ayNhloK1k5Kg+LkgpODxR6Rrq0lAM1fXAjqbK5uL1GtOz72KXhepk0qmzD3/7
	 wPPI4rJnRp8cqjgVyAn3OmyWAF2jncHX60DelW3kF2fNLKgHRQILWN0vhHIQO8Trkj
	 FNPtfWIYKop/JzvEoixE1K+Ya35mFMRgPDLEeVJ5ADOZx7cU3UeQ+H+GQpsn4PrOUZ
	 +FwOpkeLN/CBg==
Date: Sun, 17 May 2026 20:24:33 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com,
	kexec@lists.infradead.org, pratyush@kernel.org, skhawaja@google.com,
	graf@amazon.com
Subject: Re: [PATCH v2 02/10] liveupdate: Extract luo_file_deserialize_one
 helper
Message-ID: <agn50TRvhDpGm_9v@kernel.org>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-3-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514222628.931312-3-pasha.tatashin@soleen.com>
X-Rspamd-Queue-Id: AB2D15627E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88025-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,soleen.com:email]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 10:26:20PM +0000, Pasha Tatashin wrote:
> Extract the logic for deserializing single entries for files into
> separate helper functions. In preparation to a linked-block
> serialization for files.

It would be nice to mention that this is a pure code movement without
indented changes.
 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  kernel/liveupdate/luo_file.c | 77 ++++++++++++++++++++----------------
>  1 file changed, 44 insertions(+), 33 deletions(-)

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

