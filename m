Return-Path: <linux-doc+bounces-88026-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePQfMv75CWpPvwQAu9opvQ
	(envelope-from <linux-doc+bounces-88026-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 19:25:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C62B56280E
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 19:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4057C3002D45
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 17:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEF93C6608;
	Sun, 17 May 2026 17:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pKvjCb+w"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0F23C37A5;
	Sun, 17 May 2026 17:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779038713; cv=none; b=aA+L0+jazeyj8GEHOGvPaSp5M4PlDrg0s3zFihuqgOkD30VtI/CDZfrO2QXINzA+fugI/vKQZQQQh53e989RJaLN34rgW0P7fWJok0BbhoV1c+mi8rc9zc7R/a1UnfskPA+9oR0iGDgHYh/GWrDLyU2daKiqrVfDY73CjGMRH+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779038713; c=relaxed/simple;
	bh=dhS9wVv40cgOex3fqEGWAJwNPN0dvGp8u4KcgCsmWV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jdn5lAnKYoBUZiKFNOZ4vpVv+oYypn+VYDME2QpoihVyaX1yjZ5AvE9PsUpLBc62cnrzhE1V/KHzb+hwSRDZEgHxo5O12h/Rx5aSMqBo/hOifbZOpjNEMgZM5mPcawXsNmj/B5RHYc8ieCjWeeidkRemofjnLpIRQ5U/e0DP/gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pKvjCb+w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D36AC2BCB0;
	Sun, 17 May 2026 17:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779038713;
	bh=dhS9wVv40cgOex3fqEGWAJwNPN0dvGp8u4KcgCsmWV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pKvjCb+wKRGA9xiiCNbRlqsxXuUdAB4R1A/U0fGy180AVGpyQhHWCIZyle1QqYBL9
	 X1S8o+7dJztCIkngZZmyOti6FuvshZ5IxQ5HzImT3wBfj05+ljzNuC3yN8at6VCwTJ
	 KVm7QVCGtFvJIHtTdl1t4/qX00JkcdCM3PlpfyfRHJZs+Jw7TjKCGj4yi9aGQlGGZ5
	 OUwk7sXt8f271KeRvmGmzDszytUKK7MgQSQ9U1SCWplSyTYyaU12+Eno9c7ytzXxSf
	 1S4Rb+H9f1eagWaXhLxyfdMBzjCWILZifNyk7j+3D93YalZOE1sEFndj7Rb+9NjWGr
	 gS1NDt/r92Wcw==
Date: Sun, 17 May 2026 20:25:05 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com,
	kexec@lists.infradead.org, pratyush@kernel.org, skhawaja@google.com,
	graf@amazon.com
Subject: Re: [PATCH v2 03/10] liveupdate: Extract luo_session_deserialize_one
 helper
Message-ID: <agn58YPpCkkKFfWA@kernel.org>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-4-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514222628.931312-4-pasha.tatashin@soleen.com>
X-Rspamd-Queue-Id: 4C62B56280E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88026-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[soleen.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 10:26:21PM +0000, Pasha Tatashin wrote:
> Extract the logic for deserializing single entries for sessions into
> separate helper functions. In preparation to a linked-block
> serialization for sessions.

It would be nice to mention that this is a pure code movement without
indented changes.
 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  kernel/liveupdate/luo_session.c | 62 +++++++++++++++++++--------------
>  1 file changed, 36 insertions(+), 26 deletions(-)

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

