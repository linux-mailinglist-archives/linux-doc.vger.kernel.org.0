Return-Path: <linux-doc+bounces-84662-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CaZHHHI7mmvxgAAu9opvQ
	(envelope-from <linux-doc+bounces-84662-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 04:22:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F3346C140
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 04:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 588053001CD6
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 02:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE0E31A805;
	Mon, 27 Apr 2026 02:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="CzVMRdGE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE67317715;
	Mon, 27 Apr 2026 02:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777256555; cv=none; b=HKJMG/2cUdQFGNX80M3N1+MdR6b3KOZjeMz05otdRWAqgAIFPQ/vnkqoLpjt64U4tST4+g0vOkLM1EaGrhXOxfKbvD6g4t4Fc0HgIsEhSiRSKIeKfne/vs968iQAUdnFOZtzsOSqzRvzU7ZmKXBSoG8a0T5oICnHvWKUYGNWvyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777256555; c=relaxed/simple;
	bh=11/XhBL0BQ/18bfiG44/OdJ0OAruPKuMueFCeeKXne4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhLV2nkjoqRQNArWCtSsCaQU2XJHomtCIQ3KSfIL7rHfFMpcQMNXU5g95AIElXlQosrJdKqA97MthPfxKPHvjfHH2huPu82AO53JE56yA0AcViAxHY+PR39+Ul60Lavkm5kltKSJydG9qaw26EL/wMHZ/dJdWJHyMvuP5hFjwAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=CzVMRdGE; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1777256550; bh=vz5x2IQ04Cd63QTBTasEJ7DRKJq62Z5gdynqSWJN26k=;
	h=From:Message-ID:From;
	b=CzVMRdGEkkSwss7ngwtlkT8qimRdpusSpsAcnv1RPkT4o954sOFwqnSkbGhnRNmoq
	 jlFFzvO5exgHsKpHzsjXZoh/xefY9cyOnd5TziG7oFhE5PFEfqY9HtH47qKWXGvzia
	 dEvJQKzm1Ch1L9yXCN6PneHPe12IMyTdfSBDQbwo=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 1AB29C0D47;
	Mon, 27 Apr 2026 04:22:30 +0200 (CEST)
Date: Mon, 27 Apr 2026 04:22:29 +0200
From: Willy Tarreau <w@1wt.eu>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: greg@kroah.com, leon@kernel.org, security@kernel.org,
        Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/3] Documentation: security-bugs: clarify requirements
 for AI-assisted reports
Message-ID: <ae7IZZUwV7j7_czA@1wt.eu>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-4-w@1wt.eu>
 <133e96b7-251d-4af2-8084-2adca3e547e4@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <133e96b7-251d-4af2-8084-2adca3e547e4@infradead.org>
X-Rspamd-Queue-Id: 76F3346C140
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[1wt.eu,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[1wt.eu:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-84662-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[1wt.eu:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w@1wt.eu,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Sun, Apr 26, 2026 at 12:36:28PM -0700, Randy Dunlap wrote:
> 
> 
> On 4/26/26 9:39 AM, Willy Tarreau wrote:
> > +Use common sense when evaluating the report. If the affected file has not been
> > +touched for more than one year and is maintained by a single individual, it is
> > +likely that usage has declined and exposed users are virtually non-existent
> > +(e.g., drivers for very old hardware, obsolte filesystems). In such cases,
> 
>                                          obsolete
(...)

Thank you Randy for your reviews! I'll apply the fixes and resend in a
few days if there are no more comments.

Willy

