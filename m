Return-Path: <linux-doc+bounces-73235-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Bk4ImXkb2lhUQAAu9opvQ
	(envelope-from <linux-doc+bounces-73235-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 21:24:05 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B207F4B3E6
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 21:24:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A7F2560B6A9
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 12:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7CA423A96;
	Tue, 20 Jan 2026 12:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="bMAruVCF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD1A3E9F8C;
	Tue, 20 Jan 2026 12:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912403; cv=none; b=IqYLl3to3uQJPMUheNf8smvc+4m95bdDj2lae7jzM8YzEUoeT9DHr2fhbDhumRjON1IC1QwUjb9x0fhq031y1EdrPHLxqATWIi/gvHxv3xc3B2WZrr01PrH2VFqBZk6j2Q9yX4fYDTW+723gYZuWZ4Icyqndr9iOh6jc4dCpxWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912403; c=relaxed/simple;
	bh=vBeuKkhx08aIyCc74TwTeuXznJnOvHq1xarlmMfLtbg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dQImNDW0AjOJQAJicbAnueX2S3x1mdUzszf3I17XxLdTYcSg7Yh0XtUGg6XxA2gk88Pn9gf5l1Spem/uCL6YtvEshRB8UJJyqhwns+QLE41HSb8a3HXwipba7vKz5qDCf1xpcXCN5aqnGnwrhjhwL6QKWjoytqmtSCM+Nr79pBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=bMAruVCF; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GSlYyMNPyo3nTygPcryodFS1sqXZdlseWzX9iuCJUy0=;
  b=bMAruVCFNUKc6qCht4t2XhuloNnw6BwecFuJ1+qcDa9bEPOswyDQLusw
   a3Q2JNAFEIRSNecBPUVPK0CYdVNXSKreNnu4RbSdybnNHAeFRE0K7rsKA
   eIwL7U5+NCLQVUt0hQWdpJ+UKfhrGbtuEn52sR392SHgpJjCz+nE4esxz
   Q=;
X-CSE-ConnectionGUID: F+ym4SO7RgyYZhvhYKVWZA==
X-CSE-MsgGUID: C4kPhhLYR06hOY4KseEzbA==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,240,1763420400"; 
   d="scan'208";a="136504220"
Received: from unknown (HELO hadrien) ([4.26.64.170])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 13:32:07 +0100
Date: Tue, 20 Jan 2026 07:32:06 -0500 (EST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Benjamin Philip <benjamin.philip495@gmail.com>
cc: Julia Lawall <Julia.Lawall@inria.fr>, 
    Nicolas Palix <nicolas.palix@imag.fr>, Jonathan Corbet <corbet@lwn.net>, 
    cocci@inria.fr, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [cocci] [PATCH RESEND 0/3] scripts: coccicheck: document debug
 log handling
In-Reply-To: <20260106190836.36630-1-benjamin.philip495@gmail.com>
Message-ID: <699831d6-694b-5435-5afc-c86e5a815a61@inria.fr>
References: <20260106190836.36630-1-benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-73235-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_POLICY_ALLOW(0.00)[inria.fr,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[inria.fr:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julia.lawall@inria.fr,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,inria.fr:mid,inria.fr:dkim]
X-Rspamd-Queue-Id: B207F4B3E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On Wed, 7 Jan 2026, Benjamin Philip wrote:

> Currently coccicheck prints debug logs to stdout unless a debug file has been
> set. This makes it hard to read coccinelle's suggested changes, especially for
> someone new to coccicheck.
>
> This patchset documents this behaviour in both the coccicheck script as well as
> in the dev-tools documentation. Additionally, it simplifies some of the logic
> for handling debug files.
>
> Benjamin Philip (3):
>   scripts: coccicheck: simplify debug file handling
>   scripts: coccicheck: warn on unset debug file
>   Documentation: Coccinelle: document debug log handling
>
>  Documentation/dev-tools/coccinelle.rst | 21 ++++++++++++++++-----
>  scripts/coccicheck                     | 21 +++++++++++++--------
>  2 files changed, 29 insertions(+), 13 deletions(-)

Thanks for the update.  I will try to get this in for the next release.

julia

