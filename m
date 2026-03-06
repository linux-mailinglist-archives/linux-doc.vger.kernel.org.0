Return-Path: <linux-doc+bounces-78187-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOE4JnnqqmmOYAEAu9opvQ
	(envelope-from <linux-doc+bounces-78187-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 15:53:45 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE5A223239
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 15:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30D6B3010263
	for <lists+linux-doc@lfdr.de>; Fri,  6 Mar 2026 14:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5CA3A9D85;
	Fri,  6 Mar 2026 14:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heX+F01X"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7493A256B;
	Fri,  6 Mar 2026 14:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772808823; cv=none; b=kgYcj23ODNo3IowP+pE4HEuA89kxy9iChsY/dtkaEe/cMIfdhcptRQ5X0Rom41PirUlcU1N/21jpNuVWU/u9axS7zkarK1p2nWiPNBOrXq1qoK4EuQ+nrynLKv/otTX8lfHA+zYMUwsdzz0MCCvtcGmTgNJPYeFOeNOrSM/yKiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772808823; c=relaxed/simple;
	bh=CZw/X2SBOSyJodI0jT/JddpWgwVJu2o3bbygEGJnjHw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HtzVe+baCzTs1gxQ0NbI2BySBoINqNT6nRkG9bhtN0BKt3Cv5ERINGtswCqxFHxLHU696ukKAqWoh9ldvM5lJTDEX4Z2qg9Lbn+UNAxykhOM4A4Kw7vK2DhvrMdMODiOnFhKsTWG+uu5nwmZTod/GOpoK01+D3FhJbPKmJycX5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heX+F01X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DC9C2BC9E;
	Fri,  6 Mar 2026 14:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772808823;
	bh=CZw/X2SBOSyJodI0jT/JddpWgwVJu2o3bbygEGJnjHw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=heX+F01XuFJfmChXXk9t6MFbE2nYWTB44idjH1qxkCCJr4sdBqzKalibxrrjZlp0t
	 ImeZ0FjenwKEjNcHYDVH101sfcG944aaFERDDvWoKKSpKhqgDk6xCVKpjhErAugNXc
	 AiGpNzPa22iFEPRSNwU5bEvg51cDq4v7wvD3Hxb76NJA15WQDKPKwBmNtff7qNauaJ
	 7TyK8JQDxwWoU2YvnRHiFpwmtpikMRfXT89pOHhZcfDkjmG9uEdqJWkn/h3BFA4z43
	 W5EseAOfHsVaYw6toIbcg55vPXFcNRtvppFKvk1MseH/mhSXSVwgSpLGpXUamxgkDJ
	 mclikboAcnCaw==
Date: Fri, 6 Mar 2026 06:53:41 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "illusion.wang" <illusion.wang@nebula-matrix.com>
Cc: dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 corbet@lwn.net, linux-doc@vger.kernel.org, lorenzo@kernel.org,
 pabeni@redhat.com, horms@kernel.org, vadim.fedorenko@linux.dev,
 lukas.bulwahn@redhat.com, edumazet@google.com, linux-kernel@vger.kernel.org
 (open list)
Subject: Re: [PATCH v6 net-next 01/11] net/nebula-matrix: add minimum nbl
 build framework
Message-ID: <20260306065341.2b0ced09@kernel.org>
In-Reply-To: <20260306033451.5196-2-illusion.wang@nebula-matrix.com>
References: <20260306033451.5196-1-illusion.wang@nebula-matrix.com>
	<20260306033451.5196-2-illusion.wang@nebula-matrix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2DE5A223239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-78187-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri,  6 Mar 2026 11:34:36 +0800 illusion.wang wrote:
> +	default m

default for drivers must be n (no "default" specified)

